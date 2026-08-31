import 'package:drift/native.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/interventions/application/intervention_markdown_generator.dart';
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

  test('reserva códigos consecutivos y crea D01 transaccionalmente', () async {
    final first = await repository.create(
      draft: _draft('Duward'),
      interventionsRoot: Uri.parse('content://intervenciones'),
    );
    final second = await repository.create(
      draft: _draft('Omega'),
      interventionsRoot: Uri.parse('content://intervenciones'),
    );

    expect(first.intervention.code, 'INT-2026-001');
    expect(second.intervention.code, 'INT-2026-002');
    expect(first.firstOperation.code, 'D01');

    final operations = await database
        .select(database.disassemblyOperations)
        .get();
    expect(operations, hasLength(2));
    expect(operations.every((item) => item.code == 'D01'), isTrue);
  });

  test('normaliza el nombre de carpeta sin perder el código', () async {
    final created = await repository.create(
      draft: _draft('Reloj Español'),
      interventionsRoot: Uri.parse('content://intervenciones'),
    );

    expect(created.intervention.folderName, 'INT-2026-001_Reloj_Espanol_777');
  });

  test('genera Markdown portable con enlaces relativos y escapado', () async {
    final created = await repository.create(
      draft: _draft('Marca | prueba'),
      interventionsRoot: Uri.parse('content://intervenciones'),
    );
    const generator = InterventionMarkdownGenerator();

    final markdown = generator.intervention(created);
    final operation = generator.operation(created);

    expect(markdown, contains('schema_version: 1'));
    expect(markdown, contains('| Marca | Marca \\| prueba |'));
    expect(markdown, contains('(01_desmontaje/D01/D01.md)'));
    expect(operation, contains('# D01 — Operación inicial'));
    expect(operation, endsWith('\n'));
  });
}

InterventionDraft _draft(String brand) {
  return InterventionDraft(
    brand: brand,
    modelReference: 'Ref',
    calibre: '777',
    movementNumber: '123',
    watchType: WatchType.manual,
    technician: 'Técnico',
    referenceOrientation: 'crown_3',
    initialState: 'Estado inicial',
  );
}
