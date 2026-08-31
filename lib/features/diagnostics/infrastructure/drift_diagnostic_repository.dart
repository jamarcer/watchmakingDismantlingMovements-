import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/diagnostic.dart';
import '../domain/diagnostic_repository.dart';

class DriftDiagnosticRepository implements DiagnosticRepository {
  DriftDiagnosticRepository(this.database, {Uuid uuid = const Uuid()})
    : _uuid = uuid;
  final db.AppDatabase database;
  final Uuid _uuid;
  @override
  Stream<List<DiagnosticFinding>> watchFindings(String operationId) {
    final q = database.select(database.diagnosticFindings)
      ..where((t) => t.operationId.equals(operationId))
      ..orderBy([(t) => OrderingTerm.asc(t.code)]);
    return q.watch().map((r) => r.map(_finding).toList());
  }

  @override
  Stream<List<CriticalItem>> watchChecklist(String interventionId) {
    final q = database.select(database.criticalChecklistItems)
      ..where((t) => t.interventionId.equals(interventionId))
      ..orderBy([
        (t) => OrderingTerm.asc(t.system),
        (t) => OrderingTerm.asc(t.itemCode),
      ]);
    return q.watch().map((r) => r.map(_item).toList());
  }

  @override
  Future<DiagnosticFinding> addFinding({
    required String interventionId,
    required String operationId,
    required DiagnosticDraft draft,
  }) => database.transaction(() async {
    final count = await (database.select(
      database.diagnosticFindings,
    )..where((t) => t.operationId.equals(operationId))).get();
    final now = DateTime.now();
    final id = _uuid.v4();
    final code = 'H' + (count.length + 1).toString().padLeft(2, '0');
    await database
        .into(database.diagnosticFindings)
        .insert(
          db.DiagnosticFindingsCompanion.insert(
            id: id,
            interventionId: interventionId,
            operationId: operationId,
            code: code,
            zone: draft.zone.trim(),
            category: draft.category.name,
            description: draft.description.trim(),
            severity: draft.severity.name,
            photoAssetId: Value(draft.photoAssetId),
            proposedAction: Value(_clean(draft.proposedAction)),
            status: 'open',
            createdAt: now,
            updatedAt: now,
          ),
        );
    return DiagnosticFinding(
      id: id,
      interventionId: interventionId,
      operationId: operationId,
      code: code,
      zone: draft.zone.trim(),
      category: draft.category,
      description: draft.description.trim(),
      severity: draft.severity,
      photoAssetId: draft.photoAssetId,
      proposedAction: _clean(draft.proposedAction),
      status: 'open',
      createdAt: now,
      updatedAt: now,
    );
  });
  @override
  Future<void> toggleChecklist({
    required String interventionId,
    required CriticalSystem system,
    required String itemCode,
    required bool checked,
  }) async {
    final existing =
        await (database.select(database.criticalChecklistItems)
              ..where((t) => t.interventionId.equals(interventionId))
              ..where((t) => t.system.equals(system.name))
              ..where((t) => t.itemCode.equals(itemCode)))
            .getSingleOrNull();
    final now = DateTime.now();
    if (existing == null) {
      await database
          .into(database.criticalChecklistItems)
          .insert(
            db.CriticalChecklistItemsCompanion.insert(
              id: _uuid.v4(),
              interventionId: interventionId,
              system: system.name,
              itemCode: itemCode,
              label: _label(system, itemCode),
              checked: Value(checked),
              updatedAt: now,
            ),
          );
    } else {
      await (database.update(
        database.criticalChecklistItems,
      )..where((t) => t.id.equals(existing.id))).write(
        db.CriticalChecklistItemsCompanion(
          checked: Value(checked),
          updatedAt: Value(now),
        ),
      );
    }
  }

  DiagnosticFinding _finding(db.DiagnosticFinding r) => DiagnosticFinding(
    id: r.id,
    interventionId: r.interventionId,
    operationId: r.operationId,
    code: r.code,
    zone: r.zone,
    category: DiagnosticCategory.values.byName(r.category),
    description: r.description,
    severity: DiagnosticSeverity.values.byName(r.severity),
    photoAssetId: r.photoAssetId,
    proposedAction: r.proposedAction,
    status: r.status,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
  );
  CriticalItem _item(db.CriticalChecklistItem r) => CriticalItem(
    id: r.id,
    interventionId: r.interventionId,
    system: CriticalSystem.values.byName(r.system),
    itemCode: r.itemCode,
    label: r.label,
    checked: r.checked,
    notes: r.notes,
    updatedAt: r.updatedAt,
  );
  String _label(CriticalSystem s, String c) => '${s.label}: $c';
  String? _clean(String? v) {
    final x = v?.trim();
    return x == null || x.isEmpty ? null : x;
  }
}
