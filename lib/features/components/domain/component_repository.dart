import 'component.dart';

abstract interface class InterventionComponentRepository {
  Stream<List<WatchComponent>> watchForIntervention(String interventionId);
}

abstract interface class ComponentRepository {
  Stream<List<WatchComponent>> watchForOperation(String operationId);
  Future<List<WatchComponent>> getForOperation(String operationId);
  Future<WatchComponent> add({
    required String interventionId,
    required String operationId,
    required ComponentDraft draft,
  });
  Future<WatchComponent> update({
    required WatchComponent component,
    required String description,
    required int quantity,
    required String tray,
    required String? notes,
  });
  Future<void> completeOperation(String operationId);
}
