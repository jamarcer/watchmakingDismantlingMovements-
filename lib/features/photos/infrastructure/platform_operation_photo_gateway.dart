import 'dart:io';

import 'package:flutter/services.dart';

import '../../../core/platform/linux_file_services.dart';
import '../domain/photo_asset.dart';
import '../domain/photo_repository.dart';

class PlatformOperationPhotoGateway implements OperationPhotoGateway {
  const PlatformOperationPhotoGateway();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  static const _linux = LinuxFileServices();

  @override
  Future<CapturedPhoto?> capture({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) {
    if (Platform.isLinux) {
      return Future.error(
        PlatformException(
          code: 'camera_unsupported',
          message: 'En Linux las fotografías se incorporan mediante Importar.',
        ),
      );
    }
    return _invoke(
      'captureOperationPhoto',
      interventionsRoot,
      interventionFolder,
      operationCode,
      kind,
    );
  }

  @override
  Future<CapturedPhoto?> import({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) {
    if (Platform.isLinux) {
      return _linux.importPhoto(
        interventionsRoot: interventionsRoot,
        interventionFolder: interventionFolder,
        operationCode: operationCode,
        kind: kind,
      );
    }
    return _invoke(
      'importOperationPhoto',
      interventionsRoot,
      interventionFolder,
      operationCode,
      kind,
    );
  }

  Future<CapturedPhoto?> _invoke(
    String method,
    Uri root,
    String folder,
    String code,
    OperationPhotoKind kind,
  ) async {
    final value = await _channel.invokeMapMethod<Object?, Object?>(method, {
      'interventionsRootUri': root.toString(),
      'interventionFolder': folder,
      'operationCode': code,
      'kind': kind.name,
      'fileName': kind.fileNameFor(code),
    });
    return value == null ? null : CapturedPhoto.fromPlatform(value);
  }
}
