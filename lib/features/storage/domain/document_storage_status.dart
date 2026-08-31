import '../../../core/config/app_config.dart';

class DocumentStorageStatus {
  const DocumentStorageStatus({
    required this.documentRoot,
    required this.interventionsRoot,
    required this.availableBytes,
  });

  final Uri documentRoot;
  final Uri interventionsRoot;
  final int? availableBytes;

  bool get isSpaceKnown => availableBytes != null;

  bool get isLowOnSpace =>
      availableBytes != null &&
      availableBytes! < AppConfig.lowStorageWarningBytes;

  bool get canCapturePhotos =>
      availableBytes == null ||
      availableBytes! >= AppConfig.minimumCaptureFreeSpaceBytes;

  factory DocumentStorageStatus.fromPlatform(Map<Object?, Object?> value) {
    final documentRoot = value['documentRootUri'] as String?;
    final interventionsRoot = value['interventionsUri'] as String?;
    final availableBytes = value['availableBytes'] as int?;

    if (documentRoot == null || interventionsRoot == null) {
      throw const FormatException('Estado de almacenamiento incompleto.');
    }

    return DocumentStorageStatus(
      documentRoot: Uri.parse(documentRoot),
      interventionsRoot: Uri.parse(interventionsRoot),
      availableBytes: availableBytes,
    );
  }
}
