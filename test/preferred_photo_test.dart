import 'package:fichas_desmontaje/features/photos/domain/photo_asset.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PhotoAsset photo({
    required String id,
    required OperationPhotoKind kind,
    String? sourcePhotoId,
  }) => PhotoAsset(
    id: id,
    interventionId: 'i1',
    operationId: 'o1',
    kind: kind,
    relativePath: id + '.jpg',
    sha256: id,
    byteSize: 1,
    width: 100,
    height: 100,
    thumbnailPath: '/tmp/' + id,
    capturedAt: DateTime.utc(2026, 9, 1),
    isOriginal: sourcePhotoId == null,
    sourcePhotoId: sourcePhotoId,
  );

  test('muestra la anotada vinculada y usa el original si no existe', () {
    final originalA = photo(id: 'a', kind: OperationPhotoKind.before);
    final originalC = photo(id: 'c', kind: OperationPhotoKind.after);
    final annotatedA = photo(
      id: 'annotated-a',
      kind: OperationPhotoKind.annotated,
      sourcePhotoId: originalA.id,
    );

    expect(
      preferredDisplayPhoto(originalA, [originalA, originalC, annotatedA]),
      same(annotatedA),
    );
    expect(
      preferredDisplayPhoto(originalC, [originalA, originalC, annotatedA]),
      same(originalC),
    );
  });
}
