import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/photo_asset.dart' as domain;
import '../domain/photo_repository.dart';

class DriftPhotoRepository implements PhotoRepository {
  DriftPhotoRepository(this._database, {Uuid uuid = const Uuid()})
    : _uuid = uuid;

  final db.AppDatabase _database;
  final Uuid _uuid;

  @override
  Stream<List<domain.PhotoAsset>> watchForOperation(String operationId) {
    final query = _database.select(_database.photoAssets)
      ..where((table) => table.operationId.equals(operationId))
      ..orderBy([(table) => OrderingTerm.asc(table.capturedAt)]);
    return query.watch().map((rows) => rows.map(_map).toList(growable: false));
  }

  @override
  Future<domain.PhotoAsset> save({
    required String interventionId,
    required String operationId,
    required domain.OperationPhotoKind kind,
    required domain.CapturedPhoto captured,
    String? sourcePhotoId,
  }) async {
    final existing = sourcePhotoId == null
        ? null
        : await (_database.select(_database.photoAssets)
                ..where(
                  (table) =>
                      table.sourcePhotoId.equals(sourcePhotoId) &
                      table.kind.equals(kind.name),
                )
                ..limit(1))
              .getSingleOrNull();
    final id = existing?.id ?? _uuid.v4();
    if (existing == null) {
      await _database
          .into(_database.photoAssets)
          .insert(
            db.PhotoAssetsCompanion.insert(
              id: id,
              interventionId: interventionId,
              operationId: operationId,
              kind: kind.name,
              relativePath: captured.relativePath,
              sha256: captured.sha256,
              byteSize: captured.byteSize,
              width: captured.width,
              height: captured.height,
              thumbnailPath: captured.thumbnailPath,
              capturedAt: captured.capturedAt,
              isOriginal: Value(sourcePhotoId == null),
              sourcePhotoId: Value(sourcePhotoId),
            ),
          );
    } else {
      await (_database.update(
        _database.photoAssets,
      )..where((table) => table.id.equals(existing.id))).write(
        db.PhotoAssetsCompanion(
          relativePath: Value(captured.relativePath),
          sha256: Value(captured.sha256),
          byteSize: Value(captured.byteSize),
          width: Value(captured.width),
          height: Value(captured.height),
          thumbnailPath: Value(captured.thumbnailPath),
          capturedAt: Value(captured.capturedAt),
        ),
      );
    }
    return domain.PhotoAsset(
      id: id,
      interventionId: interventionId,
      operationId: operationId,
      kind: kind,
      relativePath: captured.relativePath,
      sha256: captured.sha256,
      byteSize: captured.byteSize,
      width: captured.width,
      height: captured.height,
      thumbnailPath: captured.thumbnailPath,
      capturedAt: captured.capturedAt,
      isOriginal: sourcePhotoId == null,
      sourcePhotoId: sourcePhotoId,
    );
  }

  domain.PhotoAsset _map(db.PhotoAsset row) {
    return domain.PhotoAsset(
      id: row.id,
      interventionId: row.interventionId,
      operationId: row.operationId,
      kind: domain.OperationPhotoKind.values.byName(row.kind),
      relativePath: row.relativePath,
      sha256: row.sha256,
      byteSize: row.byteSize,
      width: row.width,
      height: row.height,
      thumbnailPath: row.thumbnailPath,
      capturedAt: row.capturedAt,
      isOriginal: row.isOriginal,
      sourcePhotoId: row.sourcePhotoId,
    );
  }
}
