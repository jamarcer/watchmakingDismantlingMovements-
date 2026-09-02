import 'dart:io';

import 'package:flutter/services.dart';

import '../../../core/platform/linux_file_services.dart';
import '../domain/component_document_gateway.dart';

class PlatformComponentDocumentGateway implements ComponentDocumentGateway {
  const PlatformComponentDocumentGateway();
  static const _channel = MethodChannel(
    'es.relojeria.fichasdesmontaje/document_root',
  );
  static const _linux = LinuxFileServices();

  @override
  Future<void> updateOperation({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required String markdown,
  }) {
    if (Platform.isLinux) {
      return _linux.updateOperation(
        interventionsRoot: interventionsRoot,
        interventionFolder: interventionFolder,
        operationCode: operationCode,
        markdown: markdown,
      );
    }
    return _channel.invokeMethod('updateOperationDocument', {
      'interventionsRootUri': interventionsRoot.toString(),
      'interventionFolder': interventionFolder,
      'operationCode': operationCode,
      'operationMarkdown': markdown,
    });
  }
}
