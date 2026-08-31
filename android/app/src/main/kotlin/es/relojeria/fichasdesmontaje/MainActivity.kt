package es.relojeria.fichasdesmontaje

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.provider.DocumentsContract
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import java.util.UUID

class MainActivity : FlutterActivity() {
    private val channelName = "es.relojeria.fichasdesmontaje/document_root"
    private val preferencesName = "document_storage"
    private val rootPreference = "document_root_uri"
    private val selectDocumentRootRequest = 7401
    private val interventionsDirectoryName = "intervenciones"
    private var pendingSelection: MethodChannel.Result? = null
    private val photoCoordinator by lazy { OperationPhotoCoordinator(this) }
    private val backupCoordinator by lazy { BackupCoordinator(this) }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, channelName + "/backup_progress").setStreamHandler(backupCoordinator.streamHandler())
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getStorageStatus" -> getStorageStatus(result)
                    "chooseDocumentRoot" -> chooseDocumentRoot(result)
                    "writeInterventionDocuments" -> writeInterventionDocuments(call.arguments, result)
                    "updateOperationDocument" -> updateOperationDocument(call.arguments, result)
                    "captureOperationPhoto" -> photoCoordinator.capture(call.arguments, result)
                    "importOperationPhoto" -> photoCoordinator.import(call.arguments, result)
                    "saveAnnotationDraft" -> photoCoordinator.saveAnnotation(call.arguments, result, false)
                    "exportAnnotation" -> photoCoordinator.saveAnnotation(call.arguments, result, true)
                    "backupIntervention" -> backupCoordinator.start(call.arguments, result)
                    else -> result.notImplemented()
                }
            }
    }

    private fun updateOperationDocument(arguments: Any?, result: MethodChannel.Result) {
        try {
            ("UNCHECKED_CAST")
            DocumentTreeWriter(contentResolver).updateOperation(arguments as Map<String, Any?>)
            result.success(null)
        } catch (error: Exception) {
            result.error("document_generation_failed", "No se pudo actualizar D01.md.", error.message)
        }
    }

    private fun writeInterventionDocuments(arguments: Any?, result: MethodChannel.Result) {
        try {
            @Suppress("UNCHECKED_CAST")
            DocumentTreeWriter(contentResolver).write(arguments as Map<String, Any?>)
            result.success(null)
        } catch (error: Exception) {
            result.error(
                "document_generation_failed",
                "No se pudo generar la documentación de la intervención.",
                error.message,
            )
        }
    }

    private fun getStorageStatus(result: MethodChannel.Result) {
        val root = savedDocumentRoot()
        if (root == null) {
            result.success(null)
            return
        }

        try {
            result.success(buildStorageStatus(Uri.parse(root)))
        } catch (error: Exception) {
            result.error(
                "storage_not_available",
                "La carpeta documental no está disponible. Comprueba la microSD.",
                error.message,
            )
        }
    }

    private fun chooseDocumentRoot(result: MethodChannel.Result) {
        if (pendingSelection != null) {
            result.error(
                "selection_in_progress",
                "Ya hay un selector de carpeta abierto.",
                null,
            )
            return
        }

        pendingSelection = result
        val intent =
            Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
                addFlags(
                    Intent.FLAG_GRANT_READ_URI_PERMISSION or
                        Intent.FLAG_GRANT_WRITE_URI_PERMISSION or
                        Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or
                        Intent.FLAG_GRANT_PREFIX_URI_PERMISSION,
                )
                savedDocumentRoot()?.let {
                    putExtra(DocumentsContract.EXTRA_INITIAL_URI, Uri.parse(it))
                }
            }
        startActivityForResult(intent, selectDocumentRootRequest)
    }

    @Deprecated("Android activity result compatibility for API 27")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (backupCoordinator.handles(requestCode)) {
            backupCoordinator.complete(requestCode, resultCode, data)
            return
        }
        if (photoCoordinator.handles(requestCode)) {
            photoCoordinator.complete(requestCode, resultCode, data)
            return
        }
        if (requestCode != selectDocumentRootRequest) {
            super.onActivityResult(requestCode, resultCode, data)
            return
        }

        val result = pendingSelection ?: return
        pendingSelection = null
        val uri = if (resultCode == Activity.RESULT_OK) data?.data else null

        if (uri == null) {
            result.success(null)
            return
        }

        completeDocumentRootSelection(uri, data?.flags ?: 0, result)
    }

    private fun completeDocumentRootSelection(
        uri: Uri,
        resultFlags: Int,
        result: MethodChannel.Result,
    ) {
        try {
            val requestedFlags =
                Intent.FLAG_GRANT_READ_URI_PERMISSION or
                    Intent.FLAG_GRANT_WRITE_URI_PERMISSION
            val persistableFlags = resultFlags and requestedFlags
            contentResolver.takePersistableUriPermission(uri, persistableFlags)
            val status = buildStorageStatus(uri)
            getSharedPreferences(preferencesName, MODE_PRIVATE)
                .edit()
                .putString(rootPreference, uri.toString())
                .apply()
            result.success(status)
        } catch (error: Exception) {
            result.error(
                "storage_not_writable",
                "No se pudo preparar la carpeta seleccionada.",
                error.message,
            )
        }
    }

    private fun savedDocumentRoot(): String? {
        val savedUri =
            getSharedPreferences(preferencesName, MODE_PRIVATE)
                .getString(rootPreference, null)
                ?: return null
        val uri = Uri.parse(savedUri)
        val permission =
            contentResolver.persistedUriPermissions.firstOrNull {
                it.uri == uri && it.isReadPermission && it.isWritePermission
            }
        return if (permission == null) null else savedUri
    }

    private fun buildStorageStatus(treeUri: Uri): Map<String, Any?> {
        verifyWritableTree(treeUri)
        val interventionsUri = ensureInterventionsDirectory(treeUri)
        return mapOf(
            "documentRootUri" to treeUri.toString(),
            "interventionsUri" to interventionsUri.toString(),
            "availableBytes" to runCatching { queryAvailableBytes(treeUri) }.getOrNull(),
        )
    }

    private fun ensureInterventionsDirectory(treeUri: Uri): Uri {
        val parentUri =
            DocumentsContract.buildDocumentUriUsingTree(
                treeUri,
                DocumentsContract.getTreeDocumentId(treeUri),
            )
        val childrenUri =
            DocumentsContract.buildChildDocumentsUriUsingTree(
                treeUri,
                DocumentsContract.getTreeDocumentId(treeUri),
            )
        val projection =
            arrayOf(
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE,
            )

        contentResolver.query(childrenUri, projection, null, null, null).use { cursor ->
            requireNotNull(cursor) {
                "No se pudo consultar la carpeta documental."
            }
            val idColumn =
                cursor.getColumnIndexOrThrow(
                    DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                )
            val nameColumn =
                cursor.getColumnIndexOrThrow(
                    DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                )
            val typeColumn =
                cursor.getColumnIndexOrThrow(
                    DocumentsContract.Document.COLUMN_MIME_TYPE,
                )

            while (cursor.moveToNext()) {
                if (
                    cursor.getString(nameColumn) == interventionsDirectoryName &&
                    cursor.getString(typeColumn) ==
                    DocumentsContract.Document.MIME_TYPE_DIR
                ) {
                    return DocumentsContract.buildDocumentUriUsingTree(
                        treeUri,
                        cursor.getString(idColumn),
                    )
                }
            }
        }

        return DocumentsContract.createDocument(
            contentResolver,
            parentUri,
            DocumentsContract.Document.MIME_TYPE_DIR,
            interventionsDirectoryName,
        ) ?: error("No se pudo crear la carpeta «intervenciones».")
    }

    private fun queryAvailableBytes(treeUri: Uri): Long? {
        val authority = treeUri.authority ?: return null
        val treeDocumentId = DocumentsContract.getTreeDocumentId(treeUri)
        val rootId = treeDocumentId.substringBefore(':')
        val projection =
            arrayOf(
                DocumentsContract.Root.COLUMN_ROOT_ID,
                DocumentsContract.Root.COLUMN_AVAILABLE_BYTES,
            )

        contentResolver
            .query(
                DocumentsContract.buildRootsUri(authority),
                projection,
                null,
                null,
                null,
            )
            .use { cursor ->
                if (cursor == null) return null
                val idColumn =
                    cursor.getColumnIndex(
                        DocumentsContract.Root.COLUMN_ROOT_ID,
                    )
                val bytesColumn =
                    cursor.getColumnIndex(
                        DocumentsContract.Root.COLUMN_AVAILABLE_BYTES,
                    )
                if (idColumn < 0 || bytesColumn < 0) return null

                while (cursor.moveToNext()) {
                    if (cursor.getString(idColumn) == rootId && !cursor.isNull(bytesColumn)) {
                        return cursor.getLong(bytesColumn).takeIf { it >= 0 }
                    }
                }
            }

        return null
    }

    private fun verifyWritableTree(treeUri: Uri) {
        val parentUri =
            DocumentsContract.buildDocumentUriUsingTree(
                treeUri,
                DocumentsContract.getTreeDocumentId(treeUri),
            )
        val temporaryUri =
            DocumentsContract.createDocument(
                contentResolver,
                parentUri,
                "application/octet-stream",
                ".fichas_desmontaje_" + UUID.randomUUID().toString(),
            ) ?: error("El proveedor no permitió crear el archivo de prueba.")

        try {
            contentResolver.openOutputStream(temporaryUri, "w").use { stream ->
                requireNotNull(stream) {
                    "El proveedor no permitió abrir el archivo de prueba."
                }
                stream.write(byteArrayOf(0x46, 0x44))
                stream.flush()
            }
        } finally {
            DocumentsContract.deleteDocument(contentResolver, temporaryUri)
        }
    }
}
