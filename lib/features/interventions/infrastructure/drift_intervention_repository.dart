import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/intervention.dart' as domain;
import '../domain/intervention_repository.dart';

class DriftInterventionRepository implements InterventionRepository {
  DriftInterventionRepository(
    this._database, {
    Uuid uuid = const Uuid(),
    DateTime Function()? clock,
  }) : _uuid = uuid,
       _clock = clock ?? DateTime.now;

  final db.AppDatabase _database;

  @override
  Stream<List<domain.Intervention>> watchDeleted() {
    final query = _database.select(_database.interventions)
      ..where((t) => t.deletedAt.isNotNull())
      ..orderBy([(t) => OrderingTerm.desc(t.deletedAt)]);
    return query.watch().map((rows) => rows.map(_mapIntervention).toList());
  }

  final Uuid _uuid;
  final DateTime Function() _clock;

  @override
  Stream<List<domain.Intervention>> watchAll() {
    final query = _database.select(_database.interventions)
      ..where((t) => t.deletedAt.isNull())
      ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)]);
    return query.watch().map(
      (rows) => rows.map(_mapIntervention).toList(growable: false),
    );
  }

  @override
  Stream<List<domain.DisassemblyOperation>> watchOperations(
    String interventionId,
  ) {
    final query = _database.select(_database.disassemblyOperations)
      ..where(
        (t) => t.interventionId.equals(interventionId) & t.deletedAt.isNull(),
      )
      ..orderBy([(t) => OrderingTerm.asc(t.sequence)]);
    return query.watch().map(
      (rows) => rows.map(_mapOperation).toList(growable: false),
    );
  }

  @override
  Future<domain.DisassemblyOperation> createOperation({
    required String interventionId,
    required String title,
    String? system,
    String? description,
  }) => _database.transaction(() async {
    final intervention = await (_database.select(
      _database.interventions,
    )..where((t) => t.id.equals(interventionId))).getSingle();
    final sequence = intervention.nextOperationNumber;
    final now = _clock();
    final id = _uuid.v4();
    final operation = domain.DisassemblyOperation(
      id: id,
      interventionId: interventionId,
      code: 'D${sequence.toString().padLeft(2, '0')}',
      sequence: sequence,
      title: title.trim(),
      status: 'draft',
      orientation: null,
      createdAt: now,
      updatedAt: now,
    );
    await _database
        .into(_database.disassemblyOperations)
        .insert(
          db.DisassemblyOperationsCompanion.insert(
            id: id,
            interventionId: interventionId,
            code: operation.code,
            sequence: sequence,
            title: operation.title,
            system: Value(_nullable(system)),
            description: Value(_nullable(description)),
            status: 'draft',
            createdAt: now,
            updatedAt: now,
          ),
        );
    await (_database.update(
      _database.interventions,
    )..where((t) => t.id.equals(interventionId))).write(
      db.InterventionsCompanion(
        nextOperationNumber: Value(sequence + 1),
        updatedAt: Value(now),
        documentState: const Value('pending'),
      ),
    );
    await _database
        .into(_database.auditEvents)
        .insert(
          db.AuditEventsCompanion.insert(
            id: _uuid.v4(),
            interventionId: interventionId,
            eventType: 'operation_created',
            details: Value(operation.code + ' · ' + operation.title),
            createdAt: now,
          ),
        );
    return operation;
  });

  @override
  Future<domain.DisassemblyOperation?> firstOperation(
    String interventionId,
  ) async {
    final query = _database.select(_database.disassemblyOperations)
      ..where((table) => table.interventionId.equals(interventionId))
      ..orderBy([(table) => OrderingTerm.asc(table.sequence)])
      ..limit(1);
    final row = await query.getSingleOrNull();
    return row == null ? null : _mapOperation(row);
  }

  @override
  Future<domain.CreatedIntervention> create({
    required domain.InterventionDraft draft,
    required Uri interventionsRoot,
  }) {
    return _database.transaction(() async {
      final now = _clock();
      final year = now.year;
      final codePrefix = 'INT-' + year.toString() + '-';
      final lastQuery = _database.select(_database.interventions)
        ..where((table) => table.code.like(codePrefix + '%'))
        ..orderBy([(table) => OrderingTerm.desc(table.code)])
        ..limit(1);
      final last = await lastQuery.getSingleOrNull();
      final nextNumber = last == null
          ? 1
          : (int.tryParse(last.code.split('-').last) ?? 0) + 1;
      final code = codePrefix + nextNumber.toString().padLeft(3, '0');
      final interventionId = _uuid.v4();
      final operationId = _uuid.v4();
      final folderName = _folderName(code, draft.brand, draft.calibre);

      await _database
          .into(_database.interventions)
          .insert(
            db.InterventionsCompanion.insert(
              id: interventionId,
              code: code,
              brand: draft.brand.trim(),
              modelReference: Value(_nullable(draft.modelReference)),
              calibre: Value(_nullable(draft.calibre)),
              movementNumber: Value(_nullable(draft.movementNumber)),
              watchType: draft.watchType.name,
              technician: draft.technician.trim(),
              referenceOrientation: draft.referenceOrientation,
              initialState: Value(_nullable(draft.initialState)),
              status: domain.InterventionStatus.draft.name,
              documentState: domain.DocumentState.pending.name,
              rootDocumentUri: interventionsRoot.toString(),
              folderName: folderName,
              createdAt: now,
              updatedAt: now,
            ),
          );

      await _database
          .into(_database.disassemblyOperations)
          .insert(
            db.DisassemblyOperationsCompanion.insert(
              id: operationId,
              interventionId: interventionId,
              code: 'D01',
              sequence: 1,
              title: 'Operación inicial',
              status: 'draft',
              orientation: Value(draft.referenceOrientation),
              createdAt: now,
              updatedAt: now,
            ),
          );

      await _database
          .into(_database.auditEvents)
          .insert(
            db.AuditEventsCompanion.insert(
              id: _uuid.v4(),
              interventionId: interventionId,
              eventType: 'intervention_created',
              details: const Value('D01 reservada automáticamente'),
              createdAt: now,
            ),
          );

      final intervention = domain.Intervention(
        id: interventionId,
        code: code,
        brand: draft.brand.trim(),
        modelReference: _nullable(draft.modelReference),
        calibre: _nullable(draft.calibre),
        movementNumber: _nullable(draft.movementNumber),
        watchType: draft.watchType,
        technician: draft.technician.trim(),
        referenceOrientation: draft.referenceOrientation,
        initialState: _nullable(draft.initialState),
        status: domain.InterventionStatus.draft,
        documentState: domain.DocumentState.pending,
        rootDocumentUri: interventionsRoot,
        folderName: folderName,
        createdAt: now,
        updatedAt: now,
      );
      final operation = domain.DisassemblyOperation(
        id: operationId,
        interventionId: interventionId,
        code: 'D01',
        sequence: 1,
        title: 'Operación inicial',
        orientation: draft.referenceOrientation,
        status: 'draft',
        createdAt: now,
        updatedAt: now,
      );

      return domain.CreatedIntervention(
        intervention: intervention,
        firstOperation: operation,
      );
    });
  }

  @override
  @override
  Future<void> softDeleteIntervention(domain.Intervention item) =>
      _setInterventionDeleted(item, true);

  @override
  Future<void> restoreIntervention(domain.Intervention item) =>
      _setInterventionDeleted(item, false);

  Future<void> _setInterventionDeleted(
    domain.Intervention item,
    bool deleted,
  ) async {
    final now = _clock();
    await _database.transaction(() async {
      final update = _database.update(_database.interventions)
        ..where(
          (t) =>
              t.id.equals(item.id) &
              (deleted ? t.deletedAt.isNull() : t.deletedAt.isNotNull()),
        );
      final count = await update.write(
        db.InterventionsCompanion(
          deletedAt: Value(deleted ? now : null),
          deletedBy: Value(deleted ? item.technician : null),
          updatedAt: Value(now),
          documentState: const Value('pending'),
        ),
      );
      if (count != 1) throw StateError('intervention_delete_conflict');
      await _auditDeletion(
        item.id,
        'intervention',
        item.id,
        item.code,
        item.technician,
        deleted,
        item.deletedAt,
        now,
      );
    });
  }

  @override
  Future<void> softDeleteOperation({
    required domain.DisassemblyOperation operation,
    required String actor,
  }) => _setOperationDeleted(operation, actor, true);

  @override
  Future<void> restoreOperation({
    required domain.DisassemblyOperation operation,
    required String actor,
  }) => _setOperationDeleted(operation, actor, false);

  Future<void> _setOperationDeleted(
    domain.DisassemblyOperation item,
    String actor,
    bool deleted,
  ) async {
    final now = _clock();
    await _database.transaction(() async {
      final parent = await (_database.select(
        _database.interventions,
      )..where((t) => t.id.equals(item.interventionId))).getSingle();
      if (!deleted && parent.deletedAt != null) {
        throw StateError('parent_intervention_deleted');
      }
      final update = _database.update(_database.disassemblyOperations)
        ..where(
          (t) =>
              t.id.equals(item.id) &
              (deleted ? t.deletedAt.isNull() : t.deletedAt.isNotNull()),
        );
      final count = await update.write(
        db.DisassemblyOperationsCompanion(
          deletedAt: Value(deleted ? now : null),
          deletedBy: Value(deleted ? actor : null),
          updatedAt: Value(now),
        ),
      );
      if (count != 1) throw StateError('operation_delete_conflict');
      await _auditDeletion(
        item.interventionId,
        'operation',
        item.id,
        item.code,
        actor,
        deleted,
        item.deletedAt,
        now,
      );
    });
  }

  Future<void> _auditDeletion(
    String interventionId,
    String entityType,
    String entityId,
    String entityCode,
    String actor,
    bool deleted,
    DateTime? previousDeletedAt,
    DateTime now,
  ) {
    return _database
        .into(_database.auditEvents)
        .insert(
          db.AuditEventsCompanion.insert(
            id: _uuid.v4(),
            interventionId: interventionId,
            eventType: deleted ? 'soft_deleted' : 'restored',
            entityType: Value(entityType),
            entityId: Value(entityId),
            entityCode: Value(entityCode),
            actor: Value(actor),
            oldValuesJson: Value(
              jsonEncode({'deleted_at': previousDeletedAt?.toIso8601String()}),
            ),
            newValuesJson: Value(
              jsonEncode({
                'deleted_at': deleted ? now.toIso8601String() : null,
              }),
            ),
            details: Value(entityCode),
            createdAt: now,
          ),
        );
  }

  @override
  Future<domain.DisassemblyOperation?> operationById(String operationId) async {
    final row = await (_database.select(
      _database.disassemblyOperations,
    )..where((t) => t.id.equals(operationId))).getSingleOrNull();
    return row == null ? null : _mapOperation(row);
  }

  @override
  Future<List<domain.TimelineEntry>> timeline(String interventionId) async {
    final operations = await (_database.select(
      _database.disassemblyOperations,
    )..where((t) => t.interventionId.equals(interventionId))).get();
    final audits = await (_database.select(
      _database.auditEvents,
    )..where((t) => t.interventionId.equals(interventionId))).get();
    final entries = <domain.TimelineEntry>[
      for (final operation in operations)
        domain.TimelineEntry(
          when: operation.createdAt,
          title: '${operation.code} · ${operation.title}',
          detail: operation.status == 'complete'
              ? 'Operación completada'
              : 'Operación en curso',
          kind: 'operation',
        ),
      for (final audit in audits)
        domain.TimelineEntry(
          when: audit.createdAt,
          title: _auditTitle(audit.eventType),
          detail: audit.details,
          kind: 'audit',
        ),
    ]..sort((a, b) => a.when.compareTo(b.when));
    return entries;
  }

  String _auditTitle(String type) => switch (type) {
    'intervention_created' => 'Intervención creada',
    'intervention_closed' => 'Intervención cerrada',
    'intervention_reopened' => 'Intervención reabierta',
    'operation_created' => 'Operación creada',
    _ => type,
  };

  @override
  Future<void> setStatus(
    String interventionId,
    domain.InterventionStatus status,
  ) async {
    final now = _clock();
    await _database.transaction(() async {
      await (_database.update(
        _database.interventions,
      )..where((t) => t.id.equals(interventionId))).write(
        db.InterventionsCompanion(
          status: Value(status.name),
          updatedAt: Value(now),
        ),
      );
      await (_database.update(
        _database.disassemblyOperations,
      )..where((t) => t.interventionId.equals(interventionId))).write(
        db.DisassemblyOperationsCompanion(
          status: Value(
            status == domain.InterventionStatus.closed ? 'complete' : 'draft',
          ),
          updatedAt: Value(now),
        ),
      );
      await _database
          .into(_database.auditEvents)
          .insert(
            db.AuditEventsCompanion.insert(
              id: _uuid.v4(),
              interventionId: interventionId,
              eventType: status == domain.InterventionStatus.closed
                  ? 'intervention_closed'
                  : 'intervention_reopened',
              details: Value('Estado: ${status.name}'),
              createdAt: now,
            ),
          );
    });
  }

  @override
  Future<void> updateDocumentState(
    String interventionId,
    domain.DocumentState state,
  ) {
    return (_database.update(
      _database.interventions,
    )..where((table) => table.id.equals(interventionId))).write(
      db.InterventionsCompanion(
        documentState: Value(state.name),
        updatedAt: Value(_clock()),
      ),
    );
  }

  domain.DisassemblyOperation _mapOperation(db.DisassemblyOperation row) {
    return domain.DisassemblyOperation(
      id: row.id,
      interventionId: row.interventionId,
      code: row.code,
      sequence: row.sequence,
      title: row.title,
      status: row.status,
      orientation: row.orientation,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      deletedBy: row.deletedBy,
    );
  }

  domain.Intervention _mapIntervention(db.Intervention row) {
    return domain.Intervention(
      id: row.id,
      code: row.code,
      brand: row.brand,
      modelReference: row.modelReference,
      calibre: row.calibre,
      movementNumber: row.movementNumber,
      watchType: domain.WatchType.values.byName(row.watchType),
      technician: row.technician,
      referenceOrientation: row.referenceOrientation,
      initialState: row.initialState,
      status: domain.InterventionStatus.values.byName(row.status),
      documentState: domain.DocumentState.values.byName(row.documentState),
      rootDocumentUri: Uri.parse(row.rootDocumentUri),
      folderName: row.folderName,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      deletedBy: row.deletedBy,
    );
  }

  String? _nullable(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  String _folderName(String code, String brand, String? calibre) {
    final raw = [code, brand, _nullable(calibre) ?? 'sin_calibre'].join('_');
    final ascii = raw
        .replaceAll(RegExp('[áàäâÁÀÄÂ]'), 'a')
        .replaceAll(RegExp('[éèëêÉÈËÊ]'), 'e')
        .replaceAll(RegExp('[íìïîÍÌÏÎ]'), 'i')
        .replaceAll(RegExp('[óòöôÓÒÖÔ]'), 'o')
        .replaceAll(RegExp('[úùüûÚÙÜÛ]'), 'u')
        .replaceAll(RegExp('[ñÑ]'), 'n')
        .replaceAll(RegExp(r'[^A-Za-z0-9_-]+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    return ascii.substring(0, ascii.length > 80 ? 80 : ascii.length);
  }
}
