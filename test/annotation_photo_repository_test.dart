import 'package:drift/native.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/interventions/infrastructure/drift_intervention_repository.dart';
import 'package:fichas_desmontaje/features/photos/domain/photo_asset.dart';
import 'package:fichas_desmontaje/features/photos/infrastructure/drift_photo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'reexportar una misma fuente actualiza la derivada sin duplicarla',
    () async {
      final database = AppDatabase(executor: NativeDatabase.memory());
      addTearDown(database.close);
      final intervention = await DriftInterventionRepository(database).create(
        draft: const InterventionDraft(
          brand: 'Prueba',
          modelReference: null,
          calibre: null,
          movementNumber: null,
          watchType: WatchType.manual,
          technician: 'Técnico',
          referenceOrientation: 'crown_3',
          initialState: null,
        ),
        interventionsRoot: Uri.parse('content://intervenciones'),
      );
      final repository = DriftPhotoRepository(database);
      CapturedPhoto captured(String hash) => CapturedPhoto(
        relativePath: '01_desmontaje/D01/D01_C_anotada.jpg',
        sha256: hash,
        byteSize: 100,
        width: 800,
        height: 600,
        thumbnailPath: '/tmp/' + hash + '.jpg',
        capturedAt: DateTime.utc(2026, 9, 1),
      );

      final first = await repository.save(
        interventionId: intervention.intervention.id,
        operationId: intervention.firstOperation.id,
        kind: OperationPhotoKind.annotated,
        captured: captured('first'),
        sourcePhotoId: 'source-c',
      );
      final second = await repository.save(
        interventionId: intervention.intervention.id,
        operationId: intervention.firstOperation.id,
        kind: OperationPhotoKind.annotated,
        captured: captured('second'),
        sourcePhotoId: 'source-c',
      );

      expect(second.id, first.id);
      final rows = await database.select(database.photoAssets).get();
      expect(rows, hasLength(1));
      expect(rows.single.sha256, 'second');
    },
  );
}
