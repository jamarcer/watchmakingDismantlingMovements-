import 'package:drift/native.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/interventions/infrastructure/drift_intervention_repository.dart';
import 'package:fichas_desmontaje/features/photos/domain/photo_asset.dart';
import 'package:fichas_desmontaje/features/photos/infrastructure/drift_photo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late DriftInterventionRepository interventions;
  late DriftPhotoRepository photos;

  setUp(() {
    database = AppDatabase(executor: NativeDatabase.memory());
    interventions = DriftInterventionRepository(
      database,
      clock: () => DateTime(2026, 8, 31, 12),
    );
    photos = DriftPhotoRepository(database);
  });

  tearDown(() => database.close());

  test('guarda metadatos y recupera la foto A de D01', () async {
    final created = await interventions.create(
      draft: const InterventionDraft(
        brand: 'Duward',
        modelReference: null,
        calibre: '777',
        movementNumber: null,
        watchType: WatchType.manual,
        technician: 'Técnico',
        referenceOrientation: 'crown_3',
        initialState: null,
      ),
      interventionsRoot: Uri.parse('content://intervenciones'),
    );
    final captured = CapturedPhoto(
      relativePath: '01_desmontaje/D01/D01_A_antes.jpg',
      sha256: List.filled(64, 'a').join(),
      byteSize: 123456,
      width: 4000,
      height: 3000,
      thumbnailPath: '/tmp/thumb.jpg',
      capturedAt: DateTime.utc(2026, 8, 31, 12, 1),
    );

    await photos.save(
      interventionId: created.intervention.id,
      operationId: created.firstOperation.id,
      kind: OperationPhotoKind.before,
      captured: captured,
    );
    final stored = await photos
        .watchForOperation(created.firstOperation.id)
        .first;

    expect(stored, hasLength(1));
    expect(stored.single.kind, OperationPhotoKind.before);
    expect(stored.single.sha256, captured.sha256);
    expect(stored.single.isOriginal, isTrue);
    expect(database.schemaVersion, 7);
  });
}
