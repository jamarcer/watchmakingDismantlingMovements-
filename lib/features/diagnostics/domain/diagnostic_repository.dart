import 'diagnostic.dart';

abstract interface class DiagnosticRepository {
  Stream<List<DiagnosticFinding>> watchFindings(String operationId);
  Stream<List<CriticalItem>> watchChecklist(String interventionId);
  Future<DiagnosticFinding> addFinding({
    required String interventionId,
    required String operationId,
    required DiagnosticDraft draft,
  });
  Future<void> toggleChecklist({
    required String interventionId,
    required CriticalSystem system,
    required String itemCode,
    required bool checked,
  });
}
