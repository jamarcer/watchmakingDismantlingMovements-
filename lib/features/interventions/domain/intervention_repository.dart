import 'intervention.dart';

abstract interface class InterventionRepository {
  Stream<List<Intervention>> watchAll();

  Stream<List<Intervention>> watchDeleted();

  Future<DisassemblyOperation?> firstOperation(String interventionId);

  Stream<List<DisassemblyOperation>> watchOperations(String interventionId);

  Future<DisassemblyOperation> createOperation({
    required String interventionId,
    required String title,
    String? system,
    String? description,
  });

  Future<CreatedIntervention> create({
    required InterventionDraft draft,
    required Uri interventionsRoot,
  });

  Future<void> updateDocumentState(String interventionId, DocumentState state);

  Future<void> setStatus(String interventionId, InterventionStatus status);

  Future<List<TimelineEntry>> timeline(String interventionId);

  Future<void> softDeleteIntervention(Intervention intervention);

  Future<void> restoreIntervention(Intervention intervention);

  Future<void> softDeleteOperation({
    required DisassemblyOperation operation,
    required String actor,
  });

  Future<void> restoreOperation({
    required DisassemblyOperation operation,
    required String actor,
  });

  Future<DisassemblyOperation?> operationById(String operationId);
}
