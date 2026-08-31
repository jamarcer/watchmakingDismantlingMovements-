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
