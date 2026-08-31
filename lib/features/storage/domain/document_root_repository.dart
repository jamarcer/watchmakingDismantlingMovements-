import 'document_storage_status.dart';

abstract interface class DocumentRootRepository {
  Future<DocumentStorageStatus?> getSavedRoot();

  Future<DocumentStorageStatus?> chooseRoot();
}
