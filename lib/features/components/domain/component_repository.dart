import 'component.dart';

abstract interface class ComponentRepository {
  Stream<List<WatchComponent>> watchForOperation(String operationId);
  Future<List<WatchComponent>> getForOperation(String operationId);
  Future<WatchComponent> add({
    required String interventionId,
    required String operationId,
    required ComponentDraft draft,
  });
  Future<void> completeOperation(String operationId);
}
