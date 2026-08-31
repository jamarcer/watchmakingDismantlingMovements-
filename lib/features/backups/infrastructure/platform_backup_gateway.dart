import 'package:flutter/services.dart';

import '../domain/backup.dart';
import '../domain/backup_gateway.dart';

class PlatformBackupGateway implements BackupGateway {
  const PlatformBackupGateway();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  static const _events = EventChannel(
    'es.relojeria.fichasdesmontaje/document_root/backup_progress',
  );
  @override
  Stream<BackupProgress> get progress =>
      _events.receiveBroadcastStream().map((raw) {
        final v = Map<Object?, Object?>.from(raw as Map);
        return BackupProgress(
          status: BackupStatus.values.byName(v['status'] as String),
          bytesCopied: (v['bytesCopied'] as num?)?.toInt() ?? 0,
          totalBytes: (v['totalBytes'] as num?)?.toInt() ?? 0,
          path: v['path'] as String? ?? '',
          error: v['error'] as String?,
        );
      });
  @override
  Future<BackupResult?> backup({
    required Uri interventionsRoot,
    required String interventionFolder,
  }) async {
    final value = await _channel.invokeMapMethod<Object?, Object?>(
      'backupIntervention',
      {
        'interventionsRootUri': interventionsRoot.toString(),
        'interventionFolder': interventionFolder,
      },
    );
    if (value == null) return null;
    return BackupResult(
      destinationUri: Uri.parse(value['destinationUri'] as String),
      manifestSha256: value['manifestSha256'] as String,
      bytesCopied: (value['bytesCopied'] as num).toInt(),
      filesCopied: (value['filesCopied'] as num).toInt(),
    );
  }
}
