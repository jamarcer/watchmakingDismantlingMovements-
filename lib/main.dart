import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'core/database/app_database.dart';
import 'core/platform/linux_file_services.dart';
import 'features/backups/infrastructure/drift_backup_repository.dart';
import 'features/backups/infrastructure/platform_backup_gateway.dart';
import 'features/backups/application/backup_controller.dart';
import 'features/diagnostics/infrastructure/drift_diagnostic_repository.dart';
import 'features/components/infrastructure/drift_component_repository.dart';
import 'features/components/infrastructure/platform_component_document_gateway.dart';
import 'features/annotations/infrastructure/drift_annotation_repository.dart';
import 'features/interventions/application/create_intervention.dart';
import 'features/interventions/infrastructure/drift_intervention_repository.dart';
import 'features/interventions/infrastructure/portable_intervention_repository.dart';
import 'features/interventions/application/import_intervention.dart';
import 'features/interventions/infrastructure/platform_intervention_document_writer.dart';
import 'features/photos/infrastructure/drift_photo_repository.dart';
import 'features/photos/infrastructure/platform_operation_photo_gateway.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  final interventionRepository = DriftInterventionRepository(database);
  final photoRepository = DriftPhotoRepository(database);
  final annotationRepository = DriftAnnotationRepository(database);
  final componentRepository = DriftComponentRepository(database);
  final diagnosticRepository = DriftDiagnosticRepository(database);
  final portableRepository = PortableInterventionRepository(database);
  final importer = ImportIntervention(portableRepository);
  final backupController = BackupController(
    gateway: const PlatformBackupGateway(),
    repository: DriftBackupRepository(database),
    prepare: Platform.isLinux
        ? (id, root, folder) async {
            final snapshot = await portableRepository.export(id);
            await const LinuxFileServices().writePortableExport(
              root: root,
              folder: folder,
              json: const JsonEncoder.withIndent('  ').convert(snapshot) + '\n',
            );
          }
        : null,
  );
  const documentWriter = PlatformInterventionDocumentWriter();

  runApp(
    FichasDesmontajeApp(
      interventionRepository: interventionRepository,
      createIntervention: CreateIntervention(
        repository: interventionRepository,
        documentWriter: documentWriter,
      ),
      photoRepository: photoRepository,
      photoGateway: const PlatformOperationPhotoGateway(),
      annotationRepository: annotationRepository,
      componentRepository: componentRepository,
      componentDocumentGateway: const PlatformComponentDocumentGateway(),
      diagnosticRepository: diagnosticRepository,
      backupController: backupController,
      importIntervention: importer,
    ),
  );
}
