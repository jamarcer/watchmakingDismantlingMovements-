package es.relojeria.fichasdesmontaje

import android.content.ContentResolver
import android.net.Uri
import android.provider.DocumentsContract
import org.json.JSONArray
import org.json.JSONObject
import java.security.MessageDigest
import java.time.Instant
import java.util.UUID

class DocumentTreeWriter(
    private val contentResolver: ContentResolver,
) {
    fun write(arguments: Map<String, Any?>) {
        val interventionsRoot =
            Uri.parse(arguments.requiredString("interventionsRootUri"))
        val interventionId = arguments.requiredString("interventionId")
        val folderName = arguments.requiredString("folderName")
        val operationCode = arguments.requiredString("operationCode")
        val generatedAt = arguments.requiredString("generatedAt")

        val interventionFolder = ensureDirectory(interventionsRoot, folderName)
        val disassemblyFolder =
            ensureDirectory(interventionFolder, "01_desmontaje")
        val operationFolder =
            ensureDirectory(disassemblyFolder, operationCode)

        val entries =
            listOf(
                writeTextAtomically(
                    interventionFolder,
                    "ficha_intervencion.md",
                    arguments.requiredString("interventionMarkdown"),
                    "ficha_intervencion.md",
                ),
                writeTextAtomically(
                    operationFolder,
                    operationCode + ".md",
                    arguments.requiredString("operationMarkdown"),
                    "01_desmontaje/" +
                        operationCode +
                        "/" +
                        operationCode +
                        ".md",
                ),
            ).sortedBy { it.path }

        val files = JSONArray()
        entries.forEach { entry ->
            files.put(
                JSONObject()
                    .put("path", entry.path)
                    .put("size", entry.size)
                    .put("sha256", entry.sha256),
            )
        }
        val manifest =
            JSONObject()
                .put("schemaVersion", 1)
                .put("interventionId", interventionId)
                .put("generatedAt", generatedAt)
                .put("files", files)
                .toString(2) + "\n"

        writeTextAtomically(
            interventionFolder,
            "manifest.json",
            manifest,
            "manifest.json",
        )
    }

    fun updateOperation(arguments: Map<String, Any?>) {
        val root = Uri.parse(arguments.requiredString("interventionsRootUri"))
        val folder = ensureDirectory(root, arguments.requiredString("interventionFolder"))
        val code = arguments.requiredString("operationCode")
        val operation = ensureDirectory(ensureDirectory(folder, "01_desmontaje"), code)
        val relativePath = "01_desmontaje/" + code + "/" + code + ".md"
        val updated = writeTextAtomically(operation, code + ".md", arguments.requiredString("operationMarkdown"), relativePath)
        val manifestUri = findChild(folder, "manifest.json", null) ?: error("No existe manifest.json.")
        val manifestText = contentResolver.openInputStream(manifestUri).use { input -> requireNotNull(input); input.bufferedReader(Charsets.UTF_8).readText() }
        val manifest = JSONObject(manifestText)
        val old = manifest.getJSONArray("files")
        val entries = mutableListOf<JSONObject>()
        for (index in 0 until old.length()) { val item = old.getJSONObject(index); if (item.getString("path") != relativePath) entries.add(item) }
        entries.add(JSONObject().put("path", updated.path).put("size", updated.size).put("sha256", updated.sha256))
        entries.sortBy { it.getString("path") }
        val files = JSONArray(); entries.forEach(files::put)
        manifest.put("files", files).put("generatedAt", Instant.now().toString())
        writeTextAtomically(folder, "manifest.json", manifest.toString(2) + "\n", "manifest.json")
    }

    private fun ensureDirectory(parentUri: Uri, name: String): Uri {
        findChild(parentUri, name, DocumentsContract.Document.MIME_TYPE_DIR)
            ?.let { return it }
        return DocumentsContract.createDocument(
            contentResolver,
            parentUri,
            DocumentsContract.Document.MIME_TYPE_DIR,
            name,
        ) ?: error("No se pudo crear la carpeta " + name + ".")
    }

    private fun writeTextAtomically(
        parentUri: Uri,
        fileName: String,
        content: String,
        relativePath: String,
    ): ManifestEntry {
        val bytes = content.toByteArray(Charsets.UTF_8)
        val temporaryName = "." + fileName + "." + UUID.randomUUID() + ".tmp"
        val temporaryUri =
            DocumentsContract.createDocument(
                contentResolver,
                parentUri,
                "application/octet-stream",
                temporaryName,
            ) ?: error("No se pudo crear el temporal para " + fileName + ".")

        try {
            contentResolver.openOutputStream(temporaryUri, "w").use { stream ->
                requireNotNull(stream) {
                    "No se pudo abrir el temporal para " + fileName + "."
                }
                stream.write(bytes)
                stream.flush()
            }

            findChild(parentUri, fileName, null)?.let {
                check(DocumentsContract.deleteDocument(contentResolver, it)) {
                    "No se pudo sustituir " + fileName + "."
                }
            }
            checkNotNull(
                DocumentsContract.renameDocument(
                    contentResolver,
                    temporaryUri,
                    fileName,
                ),
            ) {
                "No se pudo finalizar " + fileName + "."
            }
        } catch (error: Exception) {
            runCatching {
                DocumentsContract.deleteDocument(contentResolver, temporaryUri)
            }
            throw error
        }

        return ManifestEntry(
            path = relativePath,
            size = bytes.size.toLong(),
            sha256 = sha256(bytes),
        )
    }

    private fun findChild(
        parentUri: Uri,
        name: String,
        mimeType: String?,
    ): Uri? {
        val parentId = DocumentsContract.getDocumentId(parentUri)
        val childrenUri =
            DocumentsContract.buildChildDocumentsUriUsingTree(
                parentUri,
                parentId,
            )
        val projection =
            arrayOf(
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE,
            )

        contentResolver.query(childrenUri, projection, null, null, null).use { cursor ->
            requireNotNull(cursor) {
                "No se pudo consultar " + parentUri + "."
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
                val matchesType =
                    mimeType == null || cursor.getString(typeColumn) == mimeType
                if (cursor.getString(nameColumn) == name && matchesType) {
                    return DocumentsContract.buildDocumentUriUsingTree(
                        parentUri,
                        cursor.getString(idColumn),
                    )
                }
            }
        }
        return null
    }

    private fun sha256(bytes: ByteArray): String {
        return MessageDigest
            .getInstance("SHA-256")
            .digest(bytes)
            .joinToString("") { byte -> "%02x".format(byte) }
    }

    private fun Map<String, Any?>.requiredString(key: String): String {
        return this[key] as? String
            ?: error("Falta el argumento " + key + ".")
    }
}

private data class ManifestEntry(
    val path: String,
    val size: Long,
    val sha256: String,
)
