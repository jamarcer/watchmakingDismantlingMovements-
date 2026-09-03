import 'package:uuid/uuid.dart';

import '../domain/backup.dart';
import '../domain/backup_gateway.dart';
import '../domain/backup_repository.dart';

typedef BackupPreparation = Future<void> Function(
  String interventionId,
  Uri root,
  String folder,
);

class BackupController {
  BackupController({
    required this.gateway,
    required this.repository,
    Uuid uuid = const Uuid(),
    this.prepare,
  }) : _uuid = uuid;
  final BackupGateway gateway;
  final BackupRepository repository;
  final Uuid _uuid;
  final BackupPreparation? prepare;
  Stream<BackupProgress> get progress => gateway.progress;
  Future<BackupResult?> run({
    required String interventionId,
    required Uri root,
    required String folder,
  }) async {
    final id = _uuid.v4();
    try {
      await prepare?.call(interventionId, root, folder);
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
