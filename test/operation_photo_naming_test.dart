import 'package:fichas_desmontaje/features/photos/domain/photo_asset.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('genera el nombre de fotografía con la operación en curso', () {
    expect(OperationPhotoKind.before.fileNameFor('D02'), 'D02_A_antes.jpg');
    expect(OperationPhotoKind.after.fileNameFor('D17'), 'D17_C_despues.jpg');
    expect(
      OperationPhotoKind.before.annotationFileStemFor('D02'),
      'D02_B_anotada',
    );
    expect(
      OperationPhotoKind.after.annotationFileStemFor('D02'),
      'D02_C_anotada',
    );
    expect(
      OperationPhotoKind.parts.annotationFileStemFor('D02'),
      'D02_D_anotada',
    );
  });
}
