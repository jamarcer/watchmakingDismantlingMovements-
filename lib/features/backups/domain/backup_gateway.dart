import 'backup.dart';

abstract interface class BackupGateway {
  Stream<BackupProgress> get progress;
  Future<BackupResult?> backup({
    required Uri interventionsRoot,
    required String interventionFolder,
  });
}
