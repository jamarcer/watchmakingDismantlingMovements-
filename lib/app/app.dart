import 'package:flutter/material.dart';

import '../features/backups/application/backup_controller.dart';
import '../features/diagnostics/domain/diagnostic_repository.dart';
import '../features/components/domain/component_repository.dart';
import '../features/components/domain/component_document_gateway.dart';
import '../features/annotations/domain/annotation_repository.dart';
import '../features/interventions/application/create_intervention.dart';
import '../features/interventions/domain/intervention_repository.dart';
import '../features/interventions/presentation/interventions_home_page.dart';
import '../features/photos/domain/photo_repository.dart';
import '../features/storage/domain/document_root_repository.dart';
import '../features/storage/infrastructure/platform_document_root_repository.dart';
import 'theme.dart';

class FichasDesmontajeApp extends StatelessWidget {
  const FichasDesmontajeApp({
    super.key,
    this.documentRootRepository = const PlatformDocumentRootRepository(),
    required this.interventionRepository,
    required this.createIntervention,
    required this.photoRepository,
    required this.photoGateway,
    required this.annotationRepository,
    required this.componentRepository,
    required this.componentDocumentGateway,
    required this.backupController,
    required this.diagnosticRepository,
  });

  final DocumentRootRepository documentRootRepository;
  final InterventionRepository interventionRepository;
  final CreateIntervention createIntervention;
  final PhotoRepository photoRepository;
  final OperationPhotoGateway photoGateway;
  final AnnotationRepository annotationRepository;
  final ComponentRepository componentRepository;
  final ComponentDocumentGateway componentDocumentGateway;
  final BackupController backupController;
  final DiagnosticRepository diagnosticRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fichas de desmontaje',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: InterventionsHomePage(
        documentRootRepository: documentRootRepository,
        interventionRepository: interventionRepository,
        createIntervention: createIntervention,
        photoRepository: photoRepository,
        photoGateway: photoGateway,
        annotationRepository: annotationRepository,
        componentRepository: componentRepository,
        componentDocumentGateway: componentDocumentGateway,
        backupController: backupController,
        diagnosticRepository: diagnosticRepository,
      ),
    );
  }
}
