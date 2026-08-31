import 'package:drift/native.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/interventions/infrastructure/drift_intervention_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late DriftInterventionRepository repository;

  setUp(() {
    database = AppDatabase(executor: NativeDatabase.memory());
    repository = DriftInterventionRepository(
      database,
      clock: () => DateTime(2026, 8, 31, 10, 30),
    );
  });
  tearDown(() => database.close());

  test('borrado y restauración de intervención son auditables', () async {
    final created = await repository.create(
      draft: _draft(),
      interventionsRoot: Uri.parse('content://intervenciones'),
    );

    await repository.softDeleteIntervention(created.intervention);
    expect(await repository.watchAll().first, isEmpty);
    final deleted = (await repository.watchDeleted().first).single;
    expect(deleted.deletedAt, isNotNull);

    await repository.restoreIntervention(deleted);
    expect(await repository.watchAll().first, hasLength(1));

    final events = await database.select(database.auditEvents).get();
    expect(events.where((e) => e.eventType == 'soft_deleted'), hasLength(1));
    expect(events.where((e) => e.eventType == 'restored'), hasLength(1));
    expect(events.last.entityType, 'intervention');
    expect(events.last.actor, 'Técnico');
  });

  test(
    'operación eliminada queda oculta y su código no se reutiliza',
    () async {
      final created = await repository.create(
        draft: _draft(),
        interventionsRoot: Uri.parse('content://intervenciones'),
      );
      await repository.createOperation(
        interventionId: created.intervention.id,
        title: 'Segunda',
      );

      await repository.softDeleteOperation(
        operation: created.firstOperation,
        actor: 'Técnico',
      );
      final visible = await repository
          .watchOperations(created.intervention.id)
          .first;
      expect(visible.single.code, 'D02');

      final next = await repository.createOperation(
        interventionId: created.intervention.id,
        title: 'Tercera',
      );
      expect(next.code, 'D03');
    },
  );
}

InterventionDraft _draft() => const InterventionDraft(
  brand: 'Duward',
  modelReference: 'Ref',
  calibre: '777',
  movementNumber: '123',
  watchType: WatchType.manual,
  technician: 'Técnico',
  referenceOrientation: 'crown_3',
  initialState: 'Estado inicial',
);
