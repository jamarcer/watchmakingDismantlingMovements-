enum OperationPhotoKind {
  before('A', 'Antes', 'D01_A_antes.jpg'),
  annotated('B', 'Anotada', 'D01_B_anotada.jpg'),
  after('C', 'Después', 'D01_C_despues.jpg'),
  parts('D', 'Piezas', 'D01_D_piezas.jpg');

  const OperationPhotoKind(this.letter, this.label, this.defaultFileName);

  final String letter;
  final String label;
  final String defaultFileName;
}

class PhotoAsset {
  const PhotoAsset({
    required this.id,
    required this.interventionId,
    required this.operationId,
    required this.kind,
    required this.relativePath,
    required this.sha256,
    required this.byteSize,
    required this.width,
    required this.height,
    required this.thumbnailPath,
    required this.capturedAt,
    required this.isOriginal,
    this.sourcePhotoId,
  });

  final String id;
  final String interventionId;
  final String operationId;
  final OperationPhotoKind kind;
  final String relativePath;
  final String sha256;
  final int byteSize;
  final int width;
  final int height;
  final String thumbnailPath;
  final DateTime capturedAt;
  final bool isOriginal;
  final String? sourcePhotoId;
}

class CapturedPhoto {
  const CapturedPhoto({
    required this.relativePath,
    required this.sha256,
    required this.byteSize,
    required this.width,
    required this.height,
    required this.thumbnailPath,
    required this.capturedAt,
  });

  final String relativePath;
  final String sha256;
  final int byteSize;
  final int width;
  final int height;
  final String thumbnailPath;
  final DateTime capturedAt;

  factory CapturedPhoto.fromPlatform(Map<Object?, Object?> value) {
    return CapturedPhoto(
      relativePath: value.requiredString('relativePath'),
      sha256: value.requiredString('sha256'),
      byteSize: value.requiredInt('byteSize'),
      width: value.requiredInt('width'),
      height: value.requiredInt('height'),
      thumbnailPath: value.requiredString('thumbnailPath'),
      capturedAt: DateTime.parse(value.requiredString('capturedAt')),
    );
  }
}

extension on Map<Object?, Object?> {
  String requiredString(String key) {
    return (this[key] as String?) ??
        (throw FormatException('Falta el campo ' + key + '.'));
  }

  int requiredInt(String key) {
    return (this[key] as int?) ??
        (throw FormatException('Falta el campo ' + key + '.'));
  }
}
