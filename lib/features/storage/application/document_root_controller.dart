import 'package:flutter/foundation.dart';

import '../domain/document_root_repository.dart';
import '../domain/document_storage_status.dart';

class DocumentRootController extends ChangeNotifier {
  DocumentRootController(this._repository);

  final DocumentRootRepository _repository;

  DocumentStorageStatus? _status;
  bool _isLoading = false;
  String? _errorMessage;

  DocumentStorageStatus? get status => _status;
  Uri? get documentRoot => _status?.documentRoot;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isConfigured => _status != null;

  Future<void> load() async => _run(_repository.getSavedRoot);

  Future<void> chooseRoot() async => _run(_repository.chooseRoot);

  Future<void> refresh() async => _run(_repository.getSavedRoot);

  Future<void> _run(Future<DocumentStorageStatus?> Function() action) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final selectedStatus = await action();
      if (selectedStatus != null) {
        _status = selectedStatus;
      }
    } on DocumentRootException catch (error) {
      _status = null;
      _errorMessage = error.message;
    } catch (_) {
      _status = null;
      _errorMessage = 'No se pudo acceder a la carpeta. Comprueba que la microSD está disponible.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class DocumentRootException implements Exception {
  const DocumentRootException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => 'DocumentRootException($code): $message';
}
