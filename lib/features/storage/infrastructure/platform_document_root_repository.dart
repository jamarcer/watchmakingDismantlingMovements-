import 'dart:io';

import 'package:flutter/services.dart';

import '../../../core/platform/linux_file_services.dart';
import '../application/document_root_controller.dart';
import '../domain/document_root_repository.dart';
import '../domain/document_storage_status.dart';

class PlatformDocumentRootRepository implements DocumentRootRepository {
  const PlatformDocumentRootRepository();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  static const _linux = LinuxFileServices();

  @override
  Future<DocumentStorageStatus?> getSavedRoot() =>
      Platform.isLinux ? _linux.getSavedRoot() : _invoke('getStorageStatus');

  @override
  Future<DocumentStorageStatus?> chooseRoot() =>
      Platform.isLinux ? _linux.chooseRoot() : _invoke('chooseDocumentRoot');

  Future<DocumentStorageStatus?> _invoke(String method) async {
    try {
      final value = await _channel.invokeMapMethod<Object?, Object?>(method);
      return value == null ? null : DocumentStorageStatus.fromPlatform(value);
    } on PlatformException catch (error) {
      throw DocumentRootException(
        error.code,
        error.message ??
            'No se pudo acceder a la carpeta documental seleccionada.',
      );
    }
  }
}
