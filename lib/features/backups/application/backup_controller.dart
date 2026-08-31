import 'package:uuid/uuid.dart';

import '../domain/backup.dart';
import '../domain/backup_gateway.dart';
import '../domain/backup_repository.dart';

class BackupController {
  BackupController({
    required this.gateway,
    required this.repository,
    Uuid uuid = const Uuid(),
  }) : _uuid = uuid;
  final BackupGateway gateway;
  final BackupRepository repository;
  final Uuid _uuid;
  Stream<BackupProgress> get progress => gateway.progress;
  Future<BackupResult?> run({
    required String interventionId,
    required Uri root,
    required String folder,
  }) async {
    final id = _uuid.v4();
    try {
      final result = await gateway.backup(
        interventionsRoot: root,
        interventionFolder: folder,
      );
      if (result == null) return null;
      await repository.start(
        id: id,
        interventionId: interventionId,
        destination: result.destinationUri,
      );
      await repository.finish(id, result);
      return result;
    } catch (error) {
      await repository.fail(id, 'backup_failed');
      rethrow;
    }
  }
}
