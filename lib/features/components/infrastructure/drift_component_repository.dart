import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/component.dart';
import '../domain/component_repository.dart';

class DriftComponentRepository implements ComponentRepository {
  DriftComponentRepository(this.database, {Uuid uuid = const Uuid()})
    : _uuid = uuid;
  final db.AppDatabase database;
  final Uuid _uuid;

  @override
  Future<List<WatchComponent>> getForOperation(String operationId) async {
    final query = database.select(database.components)
      ..where((t) => t.operationId.equals(operationId))
      ..orderBy([(t) => OrderingTerm.asc(t.code)]);
    return (await query.get()).map(_map).toList();
  }

  @override
  Stream<List<WatchComponent>> watchForOperation(String operationId) {
    final q = database.select(database.components)
      ..where((t) => t.operationId.equals(operationId))
      ..orderBy([(t) => OrderingTerm.asc(t.code)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Future<WatchComponent> add({
    required String interventionId,
    required String operationId,
    required ComponentDraft draft,
  }) => database.transaction(() async {
    final intervention = await (database.select(
      database.interventions,
    )..where((t) => t.id.equals(interventionId))).getSingle();
    final number = switch (draft.type) {
      ComponentType.part => intervention.nextPartNumber,
      ComponentType.screw => intervention.nextScrewNumber,
      ComponentType.wheel => intervention.nextWheelNumber,
      ComponentType.spring => intervention.nextSpringNumber,
    };
    final code = '${draft.type.prefix}${number.toString().padLeft(2, '0')}';
    final now = DateTime.now();
    final id = _uuid.v4();
    await database
        .into(database.components)
        .insert(
          db.ComponentsCompanion.insert(
            id: id,
            interventionId: interventionId,
            operationId: operationId,
            code: code,
            type: draft.type.name,
            description: draft.description.trim(),
            quantity: draft.quantity,
            position: Value(_clean(draft.position)),
            orientation: Value(_clean(draft.orientation)),
            tray: draft.tray.trim(),
            notes: Value(_clean(draft.notes)),
            createdAt: now,
            updatedAt: now,
          ),
        );
    final companion = switch (draft.type) {
      ComponentType.part => db.InterventionsCompanion(
        nextPartNumber: Value(number + 1),
        updatedAt: Value(now),
        documentState: const Value('pending'),
      ),
      ComponentType.screw => db.InterventionsCompanion(
        nextScrewNumber: Value(number + 1),
        updatedAt: Value(now),
        documentState: const Value('pending'),
      ),
      ComponentType.wheel => db.InterventionsCompanion(
        nextWheelNumber: Value(number + 1),
        updatedAt: Value(now),
        documentState: const Value('pending'),
      ),
      ComponentType.spring => db.InterventionsCompanion(
        nextSpringNumber: Value(number + 1),
        updatedAt: Value(now),
        documentState: const Value('pending'),
      ),
    };
    await (database.update(
      database.interventions,
    )..where((t) => t.id.equals(interventionId))).write(companion);
    return WatchComponent(
      id: id,
      interventionId: interventionId,
      operationId: operationId,
      code: code,
      type: draft.type,
      description: draft.description.trim(),
      quantity: draft.quantity,
      position: _clean(draft.position),
      orientation: _clean(draft.orientation),
      tray: draft.tray.trim(),
      notes: _clean(draft.notes),
      createdAt: now,
      updatedAt: now,
    );
  });
  @override
  Future<WatchComponent> update({
    required WatchComponent component,
    required String description,
    required int quantity,
    required String tray,
    required String? notes,
  }) => database.transaction(() async {
    final cleanDescription = description.trim();
    final cleanTray = tray.trim();
    if (cleanDescription.isEmpty) {
      throw ArgumentError.value(description, 'description');
    }
    if (quantity < 1) throw ArgumentError.value(quantity, 'quantity');
    if (cleanTray.isEmpty) throw ArgumentError.value(tray, 'tray');
    final intervention = await (database.select(
      database.interventions,
    )..where((t) => t.id.equals(component.interventionId))).getSingle();
    if (intervention.status == 'closed') {
      throw StateError('intervention_closed');
    }
    final now = DateTime.now();
    final cleanNotes = _clean(notes);
    final changed =
        await (database.update(
          database.components,
        )..where((t) => t.id.equals(component.id))).write(
          db.ComponentsCompanion(
            description: Value(cleanDescription),
            quantity: Value(quantity),
            tray: Value(cleanTray),
            notes: Value(cleanNotes),
            updatedAt: Value(now),
          ),
        );
    if (changed != 1) throw StateError('component_update_conflict');
    await (database.update(
      database.interventions,
    )..where((t) => t.id.equals(component.interventionId))).write(
      db.InterventionsCompanion(
        documentState: const Value('pending'),
        updatedAt: Value(now),
      ),
    );
    await database
        .into(database.auditEvents)
        .insert(
          db.AuditEventsCompanion.insert(
            id: _uuid.v4(),
            interventionId: component.interventionId,
            eventType: 'component_updated',
            entityType: const Value('component'),
            entityId: Value(component.id),
            entityCode: Value(component.code),
            actor: Value(intervention.technician),
            oldValuesJson: Value(
              jsonEncode({
                'description': component.description,
                'quantity': component.quantity,
                'tray': component.tray,
                'notes': component.notes,
              }),
            ),
            newValuesJson: Value(
              jsonEncode({
                'description': cleanDescription,
                'quantity': quantity,
                'tray': cleanTray,
                'notes': cleanNotes,
              }),
            ),
            details: Value(component.code + ' · componente actualizado'),
            createdAt: now,
          ),
        );
    return WatchComponent(
      id: component.id,
      interventionId: component.interventionId,
      operationId: component.operationId,
      code: component.code,
      type: component.type,
      description: cleanDescription,
      quantity: quantity,
      position: component.position,
      orientation: component.orientation,
      tray: cleanTray,
      notes: cleanNotes,
      createdAt: component.createdAt,
      updatedAt: now,
    );
  });

  @override
  Future<void> completeOperation(String operationId) =>
      (database.update(
        database.disassemblyOperations,
      )..where((t) => t.id.equals(operationId))).write(
        db.DisassemblyOperationsCompanion(
          status: const Value('complete'),
          updatedAt: Value(DateTime.now()),
        ),
      );
  WatchComponent _map(db.Component r) => WatchComponent(
    id: r.id,
    interventionId: r.interventionId,
    operationId: r.operationId,
    code: r.code,
    type: ComponentType.values.byName(r.type),
    description: r.description,
    quantity: r.quantity,
    position: r.position,
    orientation: r.orientation,
    tray: r.tray,
    notes: r.notes,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );
  String? _clean(String? value) {
    final text = value?.trim();
    return text == null || text.isEmpty ? null : text;
  }
}
