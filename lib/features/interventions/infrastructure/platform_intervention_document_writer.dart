import 'package:flutter/services.dart';

import '../domain/intervention.dart';
import '../domain/intervention_document_writer.dart';

class PlatformInterventionDocumentWriter implements InterventionDocumentWriter {
  const PlatformInterventionDocumentWriter();

  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );

  @override
  Future<void> write({
    required CreatedIntervention created,
    required String interventionMarkdown,
    required String operationMarkdown,
  }) async {
    await _channel.invokeMethod<void>('writeInterventionDocuments', {
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
