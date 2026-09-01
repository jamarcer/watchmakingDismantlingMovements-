import 'dart:convert';

import 'package:drift/native.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/components/domain/component.dart';
import 'package:fichas_desmontaje/features/components/infrastructure/drift_component_repository.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/interventions/infrastructure/drift_intervention_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late DriftInterventionRepository interventions;
  late DriftComponentRepository components;
  late CreatedIntervention created;
  late WatchComponent component;

  setUp(() async {
    database = AppDatabase(executor: NativeDatabase.memory());
    interventions = DriftInterventionRepository(database);
    components = DriftComponentRepository(database);
    created = await interventions.create(
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
    component = await components.add(
      interventionId: created.intervention.id,
      operationId: created.firstOperation.id,
      draft: const ComponentDraft(
        type: ComponentType.part,
        description: 'Puente',
        quantity: 1,
        position: 'Superior',
        orientation: 'Corona',
        tray: 'D01',
        notes: null,
      ),
    );
  });
  tearDown(() => database.close());

  test('actualiza campos editables, conserva identidad y audita', () async {
    final updated = await components.update(
      component: component,
      description: 'Puente del tren',
      quantity: 2,
      tray: 'D01-B',
      notes: 'Dos tornillos distintos',
    );

    expect(updated.id, component.id);
    expect(updated.code, component.code);
    expect(updated.type, component.type);
    expect(updated.description, 'Puente del tren');
    expect(updated.quantity, 2);
    expect(updated.tray, 'D01-B');
    expect(updated.notes, 'Dos tornillos distintos');

    final stored = (await components.getForOperation(created.firstOperation.id))
        .single;
    expect(stored.description, 'Puente del tren');

    final event = (await database.select(database.auditEvents).get())
        .where((item) => item.eventType == 'component_updated')
        .single;
    expect(event.entityCode, component.code);
    expect(event.actor, 'Técnico');
    expect(jsonDecode(event.oldValuesJson!)['quantity'], 1);
    expect(jsonDecode(event.newValuesJson!)['tray'], 'D01-B');
  });

  test('rechaza edición si la intervención está cerrada', () async {
    await interventions.setStatus(
      created.intervention.id,
      InterventionStatus.closed,
    );

    expect(
      () => components.update(
        component: component,
        description: 'Cambio',
        quantity: 1,
        tray: 'D01',
        notes: null,
      ),
      throwsA(isA<StateError>()),
    );
    expect(
      (await components.getForOperation(created.firstOperation.id))
          .single
          .description,
      'Puente',
    );
  });
}
