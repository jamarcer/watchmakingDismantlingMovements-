import 'dart:io';

import 'package:flutter/services.dart';

import '../../../core/platform/linux_file_services.dart';
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
  static const _linux = LinuxFileServices();

  @override
  Stream<BackupProgress> get progress => Platform.isLinux
      ? linuxBackupProgress
      : _events.receiveBroadcastStream().map((raw) {
          final value = Map<Object?, Object?>.from(raw as Map);
          return BackupProgress(
            status: BackupStatus.values.byName(value['status'] as String),
            bytesCopied: (value['bytesCopied'] as num?)?.toInt() ?? 0,
            totalBytes: (value['totalBytes'] as num?)?.toInt() ?? 0,
            path: value['path'] as String? ?? '',
            error: value['error'] as String?,
          );
        });

  @override
  Future<BackupResult?> backup({
    required Uri interventionsRoot,
    required String interventionFolder,
  }) async {
    if (Platform.isLinux) {
      return _linux.backup(
        interventionsRoot: interventionsRoot,
        interventionFolder: interventionFolder,
      );
    }
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
