import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/annotation_document.dart';
import '../domain/annotation_repository.dart';

class DriftAnnotationRepository implements AnnotationRepository {
  DriftAnnotationRepository(this.database, {Uuid uuid = const Uuid()})
    : _uuid = uuid;
  final db.AppDatabase database;
  final Uuid _uuid;
  @override
  Future<AnnotationDocument?> findBySource(String sourcePhotoId) async {
    final q = database.select(database.annotationDocuments)
      ..where((t) => t.sourcePhotoId.equals(sourcePhotoId));
    final r = await q.getSingleOrNull();
    return r == null ? null : _map(r);
  }

  @override
  Future<AnnotationDocument> saveDraft({
    required String sourcePhotoId,
    required int canvasWidth,
    required int canvasHeight,
    required List<AnnotationElement> elements,
  }) async {
    final old = await findBySource(sourcePhotoId);
    final v = AnnotationDocument(
      id: old?.id ?? _uuid.v4(),
      sourcePhotoId: sourcePhotoId,
      canvasWidth: canvasWidth,
      canvasHeight: canvasHeight,
      elements: List.unmodifiable(elements),
      renderedPhotoId: old?.renderedPhotoId,
      updatedAt: DateTime.now(),
    );
    await database
        .into(database.annotationDocuments)
        .insertOnConflictUpdate(
          db.AnnotationDocumentsCompanion.insert(
            id: v.id,
            sourcePhotoId: sourcePhotoId,
            canvasWidth: canvasWidth,
            canvasHeight: canvasHeight,
            elementsJson: v.elementsJson,
            renderedPhotoId: Value(v.renderedPhotoId),
            updatedAt: v.updatedAt,
          ),
        );
    return v;
  }

  @override
  Future<void> markRendered(String id, String photoId) =>
      (database.update(
        database.annotationDocuments,
      )..where((t) => t.id.equals(id))).write(
        db.AnnotationDocumentsCompanion(
          renderedPhotoId: Value(photoId),
          updatedAt: Value(DateTime.now()),
        ),
      );
  AnnotationDocument _map(db.AnnotationDocument r) => AnnotationDocument(
    id: r.id,
    sourcePhotoId: r.sourcePhotoId,
    canvasWidth: r.canvasWidth,
    canvasHeight: r.canvasHeight,
    elements: (jsonDecode(r.elementsJson) as List)
        .map(
          (e) =>
              AnnotationElement.fromJson(Map<String, Object?>.from(e as Map)),
        )
        .toList(),
    renderedPhotoId: r.renderedPhotoId,
    updatedAt: r.updatedAt,
  );
}
