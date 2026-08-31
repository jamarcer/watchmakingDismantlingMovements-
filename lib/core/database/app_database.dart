import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Interventions extends Table {
  TextColumn get id => text()();
  TextColumn get code => text().unique()();
  TextColumn get brand => text()();
  TextColumn get modelReference => text().nullable()();
  TextColumn get calibre => text().nullable()();
  TextColumn get movementNumber => text().nullable()();
  TextColumn get watchType => text()();
  TextColumn get technician => text()();
  TextColumn get referenceOrientation => text()();
  TextColumn get initialState => text().nullable()();
  TextColumn get status => text()();
  TextColumn get documentState => text()();
  TextColumn get rootDocumentUri => text()();
  TextColumn get folderName => text()();
  IntColumn get nextOperationNumber =>
      integer().withDefault(const Constant(2))();
  IntColumn get nextPartNumber => integer().withDefault(const Constant(1))();
  IntColumn get nextScrewNumber => integer().withDefault(const Constant(1))();
  IntColumn get nextWheelNumber => integer().withDefault(const Constant(1))();
  IntColumn get nextSpringNumber => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get deletedBy => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@TableIndex(
  name: 'operations_intervention_code',
  columns: {#interventionId, #code},
  unique: true,
)
@TableIndex(
  name: 'operations_intervention_sequence',
  columns: {#interventionId, #sequence},
)
class DisassemblyOperations extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get code => text()();
  IntColumn get sequence => integer()();
  TextColumn get title => text()();
  TextColumn get system => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get tray => text().nullable()();
  TextColumn get orientation => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get deletedBy => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@TableIndex(name: 'photo_assets_operation_kind', columns: {#operationId, #kind})
class PhotoAssets extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get operationId => text().references(
    DisassemblyOperations,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get kind => text()();
  TextColumn get relativePath => text()();
  TextColumn get sha256 => text()();
  IntColumn get byteSize => integer()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
  TextColumn get thumbnailPath => text()();
  DateTimeColumn get capturedAt => dateTime()();
  BoolColumn get isOriginal => boolean().withDefault(const Constant(true))();
  TextColumn get sourcePhotoId => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AnnotationDocuments extends Table {
  TextColumn get id => text()();
  TextColumn get sourcePhotoId =>
      text().references(PhotoAssets, #id, onDelete: KeyAction.cascade)();
  IntColumn get canvasWidth => integer()();
  IntColumn get canvasHeight => integer()();
  TextColumn get elementsJson => text()();
  TextColumn get renderedPhotoId => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@TableIndex(
  name: 'components_intervention_code',
  columns: {#interventionId, #code},
  unique: true,
)
class Components extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get operationId => text().references(
    DisassemblyOperations,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get code => text()();
  TextColumn get type => text()();
  TextColumn get description => text()();
  IntColumn get quantity => integer()();
  TextColumn get position => text().nullable()();
  TextColumn get orientation => text().nullable()();
  TextColumn get tray => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class DiagnosticFindings extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get operationId => text().references(
    DisassemblyOperations,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get code => text()();
  TextColumn get zone => text()();
  TextColumn get category => text()();
  TextColumn get description => text()();
  TextColumn get severity => text()();
  TextColumn get photoAssetId => text().nullable()();
  TextColumn get proposedAction => text().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

@TableIndex(
  name: 'critical_checklist_intervention_system',
  columns: {#interventionId, #system, #itemCode},
  unique: true,
)
class CriticalChecklistItems extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get system => text()();
  TextColumn get itemCode => text()();
  TextColumn get label => text()();
  BoolColumn get checked => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class BackupRecords extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get destinationUri => text()();
  TextColumn get manifestSha256 => text()();
  TextColumn get status => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get errorCode => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@TableIndex(
  name: 'audit_events_intervention_created',
  columns: {#interventionId, #createdAt},
)
class AuditEvents extends Table {
  TextColumn get id => text()();
  TextColumn get interventionId =>
      text().references(Interventions, #id, onDelete: KeyAction.cascade)();
  TextColumn get eventType => text()();
  TextColumn get entityType => text().nullable()();
  TextColumn get entityId => text().nullable()();
  TextColumn get entityCode => text().nullable()();
  TextColumn get actor => text().nullable()();
  TextColumn get oldValuesJson => text().nullable()();
  TextColumn get newValuesJson => text().nullable()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Interventions,
    DisassemblyOperations,
    PhotoAssets,
    AnnotationDocuments,
    Components,
    BackupRecords,
    DiagnosticFindings,
    CriticalChecklistItems,
    AuditEvents,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor})
    : super(executor ?? driftDatabase(name: 'fichas_desmontaje'));

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(photoAssets);
      }
      if (from < 3) {
        await migrator.addColumn(photoAssets, photoAssets.sourcePhotoId);
        await migrator.createTable(annotationDocuments);
      }
      if (from < 4) {
        await migrator.addColumn(interventions, interventions.nextPartNumber);
        await migrator.addColumn(interventions, interventions.nextScrewNumber);
        await migrator.addColumn(interventions, interventions.nextWheelNumber);
        await migrator.addColumn(interventions, interventions.nextSpringNumber);
        await migrator.createTable(components);
      }
      if (from < 5) {
        await migrator.createTable(backupRecords);
      }
      if (from < 6) {
        await migrator.createTable(diagnosticFindings);
        await migrator.createTable(criticalChecklistItems);
      }
      if (from < 7) {
        await migrator.addColumn(interventions, interventions.deletedAt);
        await migrator.addColumn(interventions, interventions.deletedBy);
        await migrator.addColumn(
          disassemblyOperations,
          disassemblyOperations.deletedAt,
        );
        await migrator.addColumn(
          disassemblyOperations,
          disassemblyOperations.deletedBy,
        );
        await migrator.addColumn(auditEvents, auditEvents.entityType);
        await migrator.addColumn(auditEvents, auditEvents.entityId);
        await migrator.addColumn(auditEvents, auditEvents.entityCode);
        await migrator.addColumn(auditEvents, auditEvents.actor);
        await migrator.addColumn(auditEvents, auditEvents.oldValuesJson);
        await migrator.addColumn(auditEvents, auditEvents.newValuesJson);
        await customStatement(
          'CREATE INDEX IF NOT EXISTS interventions_deleted_at ON interventions (deleted_at)',
        );
        await customStatement(
          'CREATE INDEX IF NOT EXISTS operations_deleted_at ON disassembly_operations (deleted_at)',
        );
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
