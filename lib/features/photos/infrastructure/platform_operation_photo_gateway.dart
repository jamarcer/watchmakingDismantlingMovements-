import 'package:flutter/services.dart';

import '../domain/photo_asset.dart';
import '../domain/photo_repository.dart';

class PlatformOperationPhotoGateway implements OperationPhotoGateway {
  const PlatformOperationPhotoGateway();

  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );

  @override
  Future<CapturedPhoto?> capture({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) {
    return _invoke(
      'captureOperationPhoto',
      interventionsRoot: interventionsRoot,
      interventionFolder: interventionFolder,
      operationCode: operationCode,
      kind: kind,
    );
  }

  @override
  Future<CapturedPhoto?> import({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) {
    return _invoke(
      'importOperationPhoto',
      interventionsRoot: interventionsRoot,
      interventionFolder: interventionFolder,
      operationCode: operationCode,
      kind: kind,
    );
  }

  Future<CapturedPhoto?> _invoke(
    String method, {
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) async {
    final fileName = kind.fileNameFor(operationCode);
    final value = await _channel.invokeMapMethod<Object?, Object?>(method, {
      'interventionsRootUri': interventionsRoot.toString(),
      'interventionFolder': interventionFolder,
      'operationCode': operationCode,
      'kind': kind.name,
      'fileName': fileName,
    });
    return value == null ? null : CapturedPhoto.fromPlatform(value);
  }
}
