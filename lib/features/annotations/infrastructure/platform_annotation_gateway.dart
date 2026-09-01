import 'package:flutter/services.dart';

import '../../photos/domain/photo_asset.dart';

class PlatformAnnotationGateway {
  const PlatformAnnotationGateway();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  Future<void> saveDraft({
    required Uri root,
    required String folder,
    required String operationCode,
    required OperationPhotoKind sourceKind,
    required String json,
  }) => _channel.invokeMethod(
    'saveAnnotationDraft',
    _args(root, folder, operationCode, sourceKind, json),
  );
  Future<CapturedPhoto> export({
    required Uri root,
    required String folder,
    required String operationCode,
    required OperationPhotoKind sourceKind,
    required String json,
    required Uint8List renderedPng,
  }) async {
    final args = _args(root, folder, operationCode, sourceKind, json)
      ..['renderedPng'] = renderedPng;
    final value = await _channel.invokeMapMethod<Object?, Object?>(
      'exportAnnotation',
      args,
    );
    if (value == null) {
      throw PlatformException(
        code: 'annotation_export_failed',
        message: 'No se generó la copia anotada.',
      );
    }
    return CapturedPhoto.fromPlatform(value);
  }

  Map<String, Object> _args(
    Uri root,
    String folder,
    String code,
    OperationPhotoKind sourceKind,
    String json,
  ) => {
    'interventionsRootUri': root.toString(),
    'interventionFolder': folder,
    'operationCode': code,
    'annotationFileStem': sourceKind.annotationFileStemFor(code),
    'json': json,
  };
}
