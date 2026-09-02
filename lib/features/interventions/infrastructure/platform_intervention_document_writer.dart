import 'dart:io';

import 'package:flutter/services.dart';

import '../../../core/platform/linux_file_services.dart';
import '../domain/intervention.dart';
import '../domain/intervention_document_writer.dart';

class PlatformInterventionDocumentWriter implements InterventionDocumentWriter {
  const PlatformInterventionDocumentWriter();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  static const _linux = LinuxFileServices();

  @override
  Future<void> write({
    required CreatedIntervention created,
    required String interventionMarkdown,
    required String operationMarkdown,
  }) {
    if (Platform.isLinux) {
      return _linux.writeIntervention(
        created: created,
        interventionMarkdown: interventionMarkdown,
        operationMarkdown: operationMarkdown,
      );
    }
    return _channel.invokeMethod<void>('writeInterventionDocuments', {
      'interventionsRootUri': created.intervention.rootDocumentUri.toString(),
      'interventionId': created.intervention.id,
      'folderName': created.intervention.folderName,
      'interventionMarkdown': interventionMarkdown,
      'operationCode': created.firstOperation.code,
      'operationMarkdown': operationMarkdown,
      'generatedAt': created.intervention.updatedAt.toUtc().toIso8601String(),
    });
  }
}
