import 'package:drift/native.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/components/domain/component.dart';
import 'package:fichas_desmontaje/features/components/infrastructure/drift_component_repository.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/interventions/infrastructure/drift_intervention_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('secuencia P/T/R/M independiente y persistente', () async {
    final db = AppDatabase(executor: NativeDatabase.memory());
    final interventions = DriftInterventionRepository(
      db,
      clock: () => DateTime(2026, 8, 31),
    );
    final created = await interventions.create(
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
      interventionsRoot: Uri.parse('content://test/intervenciones'),
    );
    final repo = DriftComponentRepository(db);
    Future<String> add(ComponentType type) async => (await repo.add(
      interventionId: created.intervention.id,
      operationId: created.firstOperation.id,
      draft: ComponentDraft(
        type: type,
        description: type.label,
        quantity: 1,
        position: null,
        orientation: null,
        tray: 'D01',
        notes: null,
      ),
    )).code;
    expect(await add(ComponentType.part), 'P01');
    expect(await add(ComponentType.screw), 'T01');
    expect(await add(ComponentType.wheel), 'R01');
    expect(await add(ComponentType.spring), 'M01');
    expect(await add(ComponentType.part), 'P02');
    expect((await repo.getForOperation(created.firstOperation.id)).length, 5);
    expect(db.schemaVersion, 7);
    await db.close();
  });
  test('completitud bloquea fotos y bandejas; B y D son recomendadas', () {
    const missing = OperationCompleteness(
      hasTitle: true,
      hasBeforePhoto: true,
      hasAfterPhoto: false,
      allComponentsLocated: false,
      hasAnnotatedPhoto: false,
      hasPartsPhoto: false,
    );
    expect(missing.canComplete, isFalse);
    expect(missing.blockers, [
      'Fotografía C · Después',
      'Bandeja de todos los componentes',
    ]);
    expect(missing.recommendations.length, 2);
    const ready = OperationCompleteness(
      hasTitle: true,
      hasBeforePhoto: true,
      hasAfterPhoto: true,
      allComponentsLocated: true,
      hasAnnotatedPhoto: false,
      hasPartsPhoto: false,
    );
    expect(ready.canComplete, isTrue);
  });
}
