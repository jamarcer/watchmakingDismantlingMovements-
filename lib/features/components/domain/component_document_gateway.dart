abstract interface class ComponentDocumentGateway {
  Future<void> updateOperation({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required String markdown,
  });
}
