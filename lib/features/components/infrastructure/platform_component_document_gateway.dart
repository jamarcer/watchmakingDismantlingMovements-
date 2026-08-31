import 'package:flutter/services.dart';

import '../domain/component_document_gateway.dart';

class PlatformComponentDocumentGateway implements ComponentDocumentGateway {
  const PlatformComponentDocumentGateway();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  @override
  Future<void> updateOperation({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required String markdown,
  }) => _channel.invokeMethod('updateOperationDocument', {
    'interventionsRootUri': interventionsRoot.toString(),
    'interventionFolder': interventionFolder,
    'operationCode': operationCode,
    'operationMarkdown': markdown,
  });
}
