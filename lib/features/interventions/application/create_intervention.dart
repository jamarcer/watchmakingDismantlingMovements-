import '../domain/intervention.dart';
import '../domain/intervention_document_writer.dart';
import '../domain/intervention_repository.dart';
import 'intervention_markdown_generator.dart';

class CreateIntervention {
  const CreateIntervention({
    required InterventionRepository repository,
    required InterventionDocumentWriter documentWriter,
    InterventionMarkdownGenerator markdownGenerator =
        const InterventionMarkdownGenerator(),
  }) : _repository = repository,
       _documentWriter = documentWriter,
       _markdownGenerator = markdownGenerator;

  final InterventionRepository _repository;
  final InterventionDocumentWriter _documentWriter;
  final InterventionMarkdownGenerator _markdownGenerator;

  Future<CreateInterventionResult> call({
    required InterventionDraft draft,
    required Uri interventionsRoot,
  }) async {
    if (draft.brand.trim().isEmpty) {
      throw const InterventionValidationException('La marca es obligatoria.');
    }
    if (draft.technician.trim().isEmpty) {
      throw const InterventionValidationException('El técnico es obligatorio.');
    }

    final created = await _repository.create(
      draft: draft,
      interventionsRoot: interventionsRoot,
    );

    try {
      await _documentWriter.write(
        created: created,
        interventionMarkdown: _markdownGenerator.intervention(created),
        operationMarkdown: _markdownGenerator.operation(created),
      );
      await _repository.updateDocumentState(
        created.intervention.id,
        DocumentState.synchronized,
      );
      return CreateInterventionResult(
        created: created,
        documentsSynchronized: true,
      );
    } catch (_) {
      await _repository.updateDocumentState(
        created.intervention.id,
        DocumentState.error,
      );
      return CreateInterventionResult(
        created: created,
        documentsSynchronized: false,
      );
    }
  }
}

class CreateInterventionResult {
  const CreateInterventionResult({
    required this.created,
    required this.documentsSynchronized,
  });

  final CreatedIntervention created;
  final bool documentsSynchronized;
}

class InterventionValidationException implements Exception {
  const InterventionValidationException(this.message);

  final String message;
}
