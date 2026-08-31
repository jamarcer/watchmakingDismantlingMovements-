import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/backup.dart';
import '../domain/backup_repository.dart';

class DriftBackupRepository implements BackupRepository {
  DriftBackupRepository(this.database);
  final db.AppDatabase database;
  @override
  Future<void> start({
    required String id,
    required String interventionId,
    required Uri destination,
  }) => database
      .into(database.backupRecords)
      .insert(
        db.BackupRecordsCompanion.insert(
          id: id,
          interventionId: interventionId,
          destinationUri: destination.toString(),
          manifestSha256: '',
          status: BackupStatus.running.name,
          startedAt: DateTime.now(),
        ),
      );
  @override
  Future<void> finish(String id, BackupResult result) =>
      (database.update(
        database.backupRecords,
      )..where((t) => t.id.equals(id))).write(
        db.BackupRecordsCompanion(
          manifestSha256: Value(result.manifestSha256),
          status: const Value('verified'),
          completedAt: Value(DateTime.now()),
        ),
      );
  @override
  Future<void> fail(String id, String errorCode) =>
      (database.update(
        database.backupRecords,
      )..where((t) => t.id.equals(id))).write(
        db.BackupRecordsCompanion(
          status: const Value('failed'),
          errorCode: Value(errorCode),
          completedAt: Value(DateTime.now()),
        ),
      );
}
