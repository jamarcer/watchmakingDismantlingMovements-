import 'photo_asset.dart';

abstract interface class PhotoRepository {
  Stream<List<PhotoAsset>> watchForOperation(String operationId);

  Future<PhotoAsset> save({
    required String interventionId,
    required String operationId,
    required OperationPhotoKind kind,
    required CapturedPhoto captured,
    String? sourcePhotoId,
  });
}

abstract interface class OperationPhotoGateway {
  Future<CapturedPhoto?> capture({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  });

  Future<CapturedPhoto?> import({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  });
}
