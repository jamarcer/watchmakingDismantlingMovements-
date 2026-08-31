import 'package:flutter/services.dart';

import '../application/document_root_controller.dart';
import '../domain/document_root_repository.dart';
import '../domain/document_storage_status.dart';

class PlatformDocumentRootRepository implements DocumentRootRepository {
  const PlatformDocumentRootRepository();

  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );

  @override
  Future<DocumentStorageStatus?> getSavedRoot() => _invoke('getStorageStatus');

  @override
  Future<DocumentStorageStatus?> chooseRoot() => _invoke('chooseDocumentRoot');

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
