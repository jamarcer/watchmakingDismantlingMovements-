import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;

class PortableInterventionRepository {
  PortableInterventionRepository(this.database, {Uuid uuid = const Uuid()})
    : _uuid = uuid;
  final db.AppDatabase database;
  final Uuid _uuid;

  Future<Map<String, dynamic>> export(String id) async {
    Future<List<Map<String, dynamic>>> rows(
      Future<List<dynamic>> future,
    ) async => (await future)
        .map((row) => (row as dynamic).toJson() as Map<String, dynamic>)
        .toList();
    final intervention = await (database.select(
      database.interventions,
    )..where((t) => t.id.equals(id))).getSingle();
    final photos = await (database.select(
      database.photoAssets,
    )..where((t) => t.interventionId.equals(id))).get();
    final photoIds = photos.map((p) => p.id).toList();
    return {
      'format': 'fichas_desmontaje',
      'schemaVersion': 1,
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'intervention': intervention.toJson(),
      'operations': await rows(
        (database.select(
          database.disassemblyOperations,
        )..where((t) => t.interventionId.equals(id))).get(),
      ),
      'photos': photos.map((r) => r.toJson()).toList(),
      'annotations': photoIds.isEmpty
          ? []
          : await rows(
              (database.select(
                database.annotationDocuments,
              )..where((t) => t.sourcePhotoId.isIn(photoIds))).get(),
            ),
      'components': await rows(
        (database.select(
          database.components,
        )..where((t) => t.interventionId.equals(id))).get(),
      ),
      'findings': await rows(
        (database.select(
          database.diagnosticFindings,
        )..where((t) => t.interventionId.equals(id))).get(),
      ),
      'checklist': await rows(
        (database.select(
          database.criticalChecklistItems,
        )..where((t) => t.interventionId.equals(id))).get(),
      ),
      'audits': await rows(
        (database.select(
          database.auditEvents,
        )..where((t) => t.interventionId.equals(id))).get(),
      ),
    };
  }

  Future<String> availableCode(String requested) async {
    if (await (database.select(
          database.interventions,
        )..where((t) => t.code.equals(requested))).getSingleOrNull() ==
        null) {
      return requested;
    }
    final match = RegExp(r'^INT-(\d{4})-(\d+)$').firstMatch(requested);
    final year = match == null
        ? DateTime.now().year
        : int.parse(match.group(1)!);
    final prefix = 'INT-' + year.toString() + '-';
    final records = await (database.select(
      database.interventions,
    )..where((t) => t.code.like(prefix + '%'))).get();
    final next =
        records
            .map((r) => int.tryParse(r.code.split('-').last) ?? 0)
            .fold<int>(0, (a, b) => a > b ? a : b) +
        1;
    return prefix + next.toString().padLeft(3, '0');
  }

  Future<String> import({
    required Map<String, dynamic> snapshot,
    required Uri root,
    required String folder,
    required String code,
  }) async {
    if (snapshot['format'] != 'fichas_desmontaje' ||
        snapshot['schemaVersion'] != 1) {
      throw const FormatException('Formato portátil no compatible.');
    }
    return database.transaction(() async {
      final source = db.Intervention.fromJson(
        _object(snapshot['intervention']),
      );
      final newId = _uuid.v4();
      final operations = _items(
        snapshot,
        'operations',
      ).map(db.DisassemblyOperation.fromJson).toList();
      final photos = _items(
        snapshot,
        'photos',
      ).map(db.PhotoAsset.fromJson).toList();
      final operationIds = {for (final row in operations) row.id: _uuid.v4()};
      final photoIds = {for (final row in photos) row.id: _uuid.v4()};
      await database
          .into(database.interventions)
          .insert(
            source.copyWith(
              id: newId,
              code: code,
              rootDocumentUri: root.toString(),
              folderName: folder,
              documentState: 'synchronized',
              deletedAt: const Value(null),
              deletedBy: const Value(null),
            ),
          );
      for (final row in operations) {
        await database
            .into(database.disassemblyOperations)
            .insert(
              row.copyWith(id: operationIds[row.id], interventionId: newId),
            );
      }
      for (final row in photos) {
        final operationId = operationIds[row.operationId];
        if (operationId == null) {
          throw const FormatException('Fotografía sin operación.');
        }
        final imagePath = root.scheme == 'file'
            ? [
                root.toFilePath(),
                folder,
                ...row.relativePath.split('/'),
              ].join(Platform.pathSeparator)
            : row.thumbnailPath;
        await database
            .into(database.photoAssets)
            .insert(
              row.copyWith(
                id: photoIds[row.id],
                interventionId: newId,
                operationId: operationId,
                thumbnailPath: imagePath,
                sourcePhotoId: Value(
                  row.sourcePhotoId == null
                      ? null
                      : photoIds[row.sourcePhotoId],
                ),
              ),
            );
      }
      for (final map in _items(snapshot, 'annotations')) {
        final row = db.AnnotationDocument.fromJson(map);
        final sourceId = photoIds[row.sourcePhotoId];
        if (sourceId == null) continue;
        await database
            .into(database.annotationDocuments)
            .insert(
              row.copyWith(
                id: _uuid.v4(),
                sourcePhotoId: sourceId,
                renderedPhotoId: Value(
                  row.renderedPhotoId == null
                      ? null
                      : photoIds[row.renderedPhotoId],
                ),
              ),
            );
      }
      for (final map in _items(snapshot, 'components')) {
        final row = db.Component.fromJson(map);
        final operationId = operationIds[row.operationId];
        if (operationId != null) {
          await database
              .into(database.components)
              .insert(
                row.copyWith(
                  id: _uuid.v4(),
                  interventionId: newId,
                  operationId: operationId,
                ),
              );
        }
      }
      for (final map in _items(snapshot, 'findings')) {
        final row = db.DiagnosticFinding.fromJson(map);
        final operationId = operationIds[row.operationId];
        if (operationId != null) {
          await database
              .into(database.diagnosticFindings)
              .insert(
                row.copyWith(
                  id: _uuid.v4(),
                  interventionId: newId,
                  operationId: operationId,
                  photoAssetId: Value(
                    row.photoAssetId == null
                        ? null
                        : photoIds[row.photoAssetId],
                  ),
                ),
              );
        }
      }
      for (final map in _items(snapshot, 'checklist')) {
        final row = db.CriticalChecklistItem.fromJson(map);
        await database
            .into(database.criticalChecklistItems)
            .insert(row.copyWith(id: _uuid.v4(), interventionId: newId));
      }
      await database
          .into(database.auditEvents)
          .insert(
            db.AuditEventsCompanion.insert(
              id: _uuid.v4(),
              interventionId: newId,
              eventType: 'intervention_imported',
              entityType: const Value('intervention'),
              entityId: Value(newId),
              entityCode: Value(code),
              actor: Value(source.technician),
              oldValuesJson: Value(
                jsonEncode({
                  'source_id': source.id,
                  'source_code': source.code,
                }),
              ),
              newValuesJson: Value(jsonEncode({'id': newId, 'code': code})),
              details: const Value(
                'Importación completa desde intervention_export.json',
              ),
              createdAt: DateTime.now(),
            ),
          );
      return newId;
    });
  }
}

Map<String, dynamic> _object(Object? value) {
  if (value is! Map) throw const FormatException('Objeto JSON no válido.');
  return Map<String, dynamic>.from(value);
}

List<Map<String, dynamic>> _items(Map<String, dynamic> source, String key) {
  final value = source[key];
  if (value == null) return const [];
  if (value is! List) throw FormatException('Lista no válida: ' + key);
  return value.map(_object).toList();
}
