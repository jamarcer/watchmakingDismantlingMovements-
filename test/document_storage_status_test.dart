import 'package:fichas_desmontaje/features/storage/domain/document_storage_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DocumentStorageStatus statusWith(int? availableBytes) {
    return DocumentStorageStatus(
      documentRoot: Uri.parse('content://root'),
      interventionsRoot: Uri.parse('content://root/intervenciones'),
      availableBytes: availableBytes,
    );
  }

  test('avisa por debajo de 2 GB y permite capturas sobre 500 MB', () {
    final status = statusWith(1024 * 1024 * 1024);

    expect(status.isLowOnSpace, isTrue);
    expect(status.canCapturePhotos, isTrue);
  });

  test('bloquea capturas por debajo de 500 MB', () {
    final status = statusWith(499 * 1024 * 1024);

    expect(status.isLowOnSpace, isTrue);
    expect(status.canCapturePhotos, isFalse);
  });

  test('no bloquea si el proveedor no informa del espacio', () {
    final status = statusWith(null);

    expect(status.isSpaceKnown, isFalse);
    expect(status.canCapturePhotos, isTrue);
  });
}
