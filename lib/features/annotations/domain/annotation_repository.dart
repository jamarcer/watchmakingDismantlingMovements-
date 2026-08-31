import 'annotation_document.dart';

abstract interface class AnnotationRepository {
  Future<AnnotationDocument?> findBySource(String sourcePhotoId);
  Future<AnnotationDocument> saveDraft({
    required String sourcePhotoId,
    required int canvasWidth,
    required int canvasHeight,
    required List<AnnotationElement> elements,
  });
  Future<void> markRendered(String documentId, String renderedPhotoId);
}
