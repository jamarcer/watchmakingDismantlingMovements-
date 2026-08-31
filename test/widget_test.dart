import 'package:drift/native.dart';
import 'package:fichas_desmontaje/app/app.dart';
import 'package:fichas_desmontaje/core/database/app_database.dart';
import 'package:fichas_desmontaje/features/interventions/application/create_intervention.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention_document_writer.dart';
import 'package:fichas_desmontaje/features/interventions/infrastructure/drift_intervention_repository.dart';
import 'package:fichas_desmontaje/features/photos/domain/photo_asset.dart';
import 'package:fichas_desmontaje/features/photos/domain/photo_repository.dart';
import 'package:fichas_desmontaje/features/photos/infrastructure/drift_photo_repository.dart';
import 'package:fichas_desmontaje/features/annotations/infrastructure/drift_annotation_repository.dart';
import 'package:fichas_desmontaje/features/components/domain/component_document_gateway.dart';
import 'package:fichas_desmontaje/features/components/infrastructure/drift_component_repository.dart';
import 'package:fichas_desmontaje/features/diagnostics/infrastructure/drift_diagnostic_repository.dart';
import 'package:fichas_desmontaje/features/backups/application/backup_controller.dart';
import 'package:fichas_desmontaje/features/backups/infrastructure/drift_backup_repository.dart';
import 'package:fichas_desmontaje/features/backups/infrastructure/platform_backup_gateway.dart';
import 'package:fichas_desmontaje/features/storage/domain/document_root_repository.dart';
import 'package:fichas_desmontaje/features/storage/domain/document_storage_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('crea y lista una intervención con D01', (tester) async {
    tester.view.physicalSize = const Size(1920, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final database = AppDatabase(executor: NativeDatabase.memory());
    final repository = DriftInterventionRepository(
      database,
      clock: () => DateTime(2026, 8, 31, 10, 30),
    );
    final writer = FakeDocumentWriter();
    final photoRepository = DriftPhotoRepository(database);

    await tester.pumpWidget(
      FichasDesmontajeApp(
        documentRootRepository: FakeDocumentRootRepository(),
        interventionRepository: repository,
        photoRepository: photoRepository,
        photoGateway: const FakePhotoGateway(),
        annotationRepository: DriftAnnotationRepository(database),
        componentRepository: DriftComponentRepository(database),
        componentDocumentGateway: const FakeComponentDocumentGateway(),
        backupController: BackupController(
          gateway: const PlatformBackupGateway(),
          repository: DriftBackupRepository(database),
        ),
        diagnosticRepository: DriftDiagnosticRepository(database),
        createIntervention: CreateIntervention(
          repository: repository,
          documentWriter: writer,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No hay intervenciones registradas'), findsOneWidget);

    await tester.tap(find.byKey(const Key('new-intervention')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('brand-field')), 'Duward');
    await tester.tap(find.byKey(const Key('save-intervention')));
    await tester.pumpAndSettle();

    expect(find.textContaining('INT-2026-001 · Duward'), findsOneWidget);
    expect(find.textContaining('D01 creada'), findsOneWidget);
    expect(writer.writeCalls, 1);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await database.close();
  });
}

class FakeDocumentRootRepository implements DocumentRootRepository {
  final status = DocumentStorageStatus(
    documentRoot: Uri.parse('content://documentos/Relojeria'),
    interventionsRoot: Uri.parse('content://documentos/intervenciones'),
    availableBytes: 3 * 1024 * 1024 * 1024,
  );

  @override
  Future<DocumentStorageStatus?> getSavedRoot() async => status;

  @override
  Future<DocumentStorageStatus?> chooseRoot() async => status;
}

class FakeDocumentWriter implements InterventionDocumentWriter {
  int writeCalls = 0;

  @override
  Future<void> write({
    required CreatedIntervention created,
    required String interventionMarkdown,
    required String operationMarkdown,
  }) async {
    writeCalls += 1;
  }
}

class FakePhotoGateway implements OperationPhotoGateway {
  const FakePhotoGateway();

  @override
  Future<CapturedPhoto?> capture({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) async => null;

  @override
  Future<CapturedPhoto?> import({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) async => null;
}

class FakeComponentDocumentGateway implements ComponentDocumentGateway {
  const FakeComponentDocumentGateway();
  @override
  Future<void> updateOperation({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required String markdown,
  }) async {}
}
