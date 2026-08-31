import 'backup.dart';

abstract interface class BackupRepository {
  Future<void> start({
    required String id,
    required String interventionId,
    required Uri destination,
  });
  Future<void> finish(String id, BackupResult result);
  Future<void> fail(String id, String errorCode);
}
