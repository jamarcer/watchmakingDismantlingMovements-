import 'intervention.dart';

abstract interface class InterventionDocumentWriter {
  Future<void> write({
    required CreatedIntervention created,
    required String interventionMarkdown,
    required String operationMarkdown,
  });
}
