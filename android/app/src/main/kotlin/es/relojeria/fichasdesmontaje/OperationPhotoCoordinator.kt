package es.relojeria.fichasdesmontaje

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Matrix
import android.media.ExifInterface
import android.net.Uri
import android.provider.DocumentsContract
import android.provider.MediaStore
import androidx.core.content.FileProvider
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.security.MessageDigest
import java.time.Instant
import java.util.UUID

class OperationPhotoCoordinator(
    private val activity: Activity,
) {
    val captureRequestCode = 7501
    val importRequestCode = 7502
    private var pending: PendingPhoto? = null

    fun capture(arguments: Any?, result: MethodChannel.Result) {
        checkNoPending(result) ?: return
        val request = PendingPhoto.from(arguments, result)
        val directory = File(activity.cacheDir, "camera_captures")
        check(directory.exists() || directory.mkdirs()) {
            "No se pudo preparar el temporal de cámara."
        }
        val file = File(directory, UUID.randomUUID().toString() + ".jpg")
        val uri =
            FileProvider.getUriForFile(
                activity,
                activity.packageName + ".fileprovider",
                file,
            )
        request.sourceUri = uri
        request.temporaryFile = file
        pending = request

        val intent =
            Intent(MediaStore.ACTION_IMAGE_CAPTURE).apply {
                putExtra(MediaStore.EXTRA_OUTPUT, uri)
                addFlags(
                    Intent.FLAG_GRANT_READ_URI_PERMISSION or
                        Intent.FLAG_GRANT_WRITE_URI_PERMISSION,
                )
            }
        try {
            activity.startActivityForResult(intent, captureRequestCode)
        } catch (error: Exception) {
            pending = null
            file.delete()
            result.error(
                "camera_unavailable",
                "No se pudo abrir la cámara.",
                error.message,
            )
        }
    }

    fun import(arguments: Any?, result: MethodChannel.Result) {
        checkNoPending(result) ?: return
        pending = PendingPhoto.from(arguments, result)
        val intent =
            Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
                addCategory(Intent.CATEGORY_OPENABLE)
                type = "image/*"
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
        activity.startActivityForResult(intent, importRequestCode)
    }

    fun saveAnnotation(arguments: Any?, result: MethodChannel.Result, export: Boolean) {
        try {
            ("UNCHECKED_CAST")
            val values = arguments as Map<String, Any?>
            result.success(PhotoFileStore(activity).storeAnnotation(values, export))
        } catch (error: Exception) {
            result.error("annotation_export_failed", "No se pudo guardar la anotación.", error.message)
        }
    }

    fun handles(requestCode: Int): Boolean {
        return requestCode == captureRequestCode || requestCode == importRequestCode
    }

    fun complete(requestCode: Int, resultCode: Int, data: Intent?) {
        val request = pending ?: return
        pending = null

        if (resultCode != Activity.RESULT_OK) {
            request.temporaryFile?.delete()
            request.result.success(null)
            return
        }

        val source =
            if (requestCode == captureRequestCode) {
                request.sourceUri
            } else {
                data?.data
            }
        if (source == null) {
            request.temporaryFile?.delete()
            request.result.error(
                "image_decode_failed",
                "Android no devolvió una imagen válida.",
                null,
            )
            return
        }

        try {
            val stored =
                PhotoFileStore(activity).store(
                    sourceUri = source,
                    interventionsRoot = request.interventionsRoot,
                    interventionFolder = request.interventionFolder,
                    operationCode = request.operationCode,
                    fileName = request.fileName,
                )
            request.result.success(stored)
        } catch (error: PhotoAlreadyExistsException) {
            request.result.error(
                "photo_already_exists",
                "La fotografía " + request.fileName + " ya existe.",
                error.message,
            )
        } catch (error: Exception) {
            request.result.error(
                "image_copy_failed",
                "No se pudo guardar la fotografía en la microSD.",
                error.message,
            )
        } finally {
            request.temporaryFile?.delete()
        }
    }

    private fun checkNoPending(result: MethodChannel.Result): Unit? {
        if (pending != null) {
            result.error(
                "photo_selection_in_progress",
                "Ya hay una captura o importación abierta.",
                null,
            )
            return null
        }
        return Unit
    }
}

private class PendingPhoto(
    val result: MethodChannel.Result,
    val interventionsRoot: Uri,
    val interventionFolder: String,
    val operationCode: String,
    val fileName: String,
) {
    var sourceUri: Uri? = null
    var temporaryFile: File? = null

    companion object {
        fun from(arguments: Any?, result: MethodChannel.Result): PendingPhoto {
            @Suppress("UNCHECKED_CAST")
            val values = arguments as? Map<String, Any?>
                ?: error("Faltan los argumentos de fotografía.")
            return PendingPhoto(
                result = result,
                interventionsRoot =
                    Uri.parse(values.requiredString("interventionsRootUri")),
                interventionFolder =
                    values.requiredString("interventionFolder"),
                operationCode = values.requiredString("operationCode"),
                fileName = values.requiredString("fileName"),
            )
        }
    }
}

private class PhotoFileStore(
    private val activity: Activity,
) {
    fun storeAnnotation(values: Map<String, Any?>, export: Boolean): Map<String, Any>? {
        val root = Uri.parse(values.requiredString("interventionsRootUri"))
        val folder = values.requiredString("interventionFolder")
        val code = values.requiredString("operationCode")
        val intervention = requireDirectory(root, folder)
        val operation = requireDirectory(requireDirectory(intervention, "01_desmontaje"), code)
        val jsonName = code + "_B_anotada.json"
        replaceBytes(intervention, operation, jsonName, "application/json", values.requiredString("json").toByteArray(Charsets.UTF_8), "01_desmontaje/" + code + "/" + jsonName)
        if (!export) return null
        val png = values["renderedPng"] as? ByteArray ?: error("Falta la imagen renderizada.")
        val bitmap = BitmapFactory.decodeByteArray(png, 0, png.size) ?: error("No se pudo decodificar el lienzo.")
        val temporary = File(activity.cacheDir, UUID.randomUUID().toString() + ".jpg")
        FileOutputStream(temporary).use { output -> check(bitmap.compress(Bitmap.CompressFormat.JPEG, 92, output)) }
        bitmap.recycle()
        val name = code + "_B_anotada.jpg"
        findChild(operation, name, null)?.let { DocumentsContract.deleteDocument(activity.contentResolver, it) }
        return try { store(Uri.fromFile(temporary), root, folder, code, name) } finally { temporary.delete() }
    }

    private fun replaceBytes(intervention: Uri, directory: Uri, name: String, mime: String, bytes: ByteArray, relativePath: String) {
        findChild(directory, name, null)?.let { DocumentsContract.deleteDocument(activity.contentResolver, it) }
        val temporary = DocumentsContract.createDocument(activity.contentResolver, directory, mime, "." + name + "." + UUID.randomUUID() + ".tmp") ?: error("No se pudo crear " + name)
        activity.contentResolver.openOutputStream(temporary, "w").use { output -> requireNotNull(output); output.write(bytes); output.flush() }
        checkNotNull(DocumentsContract.renameDocument(activity.contentResolver, temporary, name))
        val hash = MessageDigest.getInstance("SHA-256").digest(bytes).toHex()
        updateManifest(intervention, relativePath, bytes.size.toLong(), hash)
    }
    fun store(
        sourceUri: Uri,
        interventionsRoot: Uri,
        interventionFolder: String,
        operationCode: String,
        fileName: String,
    ): Map<String, Any> {
        val intervention = requireDirectory(interventionsRoot, interventionFolder)
        val disassembly = requireDirectory(intervention, "01_desmontaje")
        val operation = requireDirectory(disassembly, operationCode)
        if (findChild(operation, fileName, null) != null) {
            throw PhotoAlreadyExistsException(fileName)
        }

        val temporaryName = "." + fileName + "." + UUID.randomUUID() + ".tmp"
        val temporary =
            DocumentsContract.createDocument(
                activity.contentResolver,
                operation,
                "image/jpeg",
                temporaryName,
            ) ?: error("No se pudo crear el archivo de destino.")

        val digest = MessageDigest.getInstance("SHA-256")
        var byteSize = 0L
        try {
            activity.contentResolver.openInputStream(sourceUri).use { input ->
                requireNotNull(input) { "No se pudo abrir la imagen de origen." }
                activity.contentResolver.openOutputStream(temporary, "w").use { output ->
                    requireNotNull(output) {
                        "No se pudo abrir la imagen de destino."
                    }
                    val buffer = ByteArray(64 * 1024)
                    while (true) {
                        val count = input.read(buffer)
                        if (count < 0) break
                        output.write(buffer, 0, count)
                        digest.update(buffer, 0, count)
                        byteSize += count
                    }
                    output.flush()
                }
            }
            val finalUri =
                checkNotNull(
                    DocumentsContract.renameDocument(
                        activity.contentResolver,
                        temporary,
                        fileName,
                    ),
                ) {
                    "No se pudo finalizar la fotografía."
                }
            val dimensions = readDimensions(finalUri)
            val hash = digest.digest().toHex()
            val thumbnail = createThumbnail(finalUri, hash)
            val relativePath =
                "01_desmontaje/" +
                    operationCode +
                    "/" +
                    fileName
            updateManifest(
                intervention,
                relativePath,
                byteSize,
                hash,
            )
            return mapOf(
                "relativePath" to relativePath,
                "sha256" to hash,
                "byteSize" to byteSize,
                "width" to dimensions.first,
                "height" to dimensions.second,
                "thumbnailPath" to thumbnail.absolutePath,
                "capturedAt" to Instant.now().toString(),
            )
        } catch (error: Exception) {
            runCatching {
                DocumentsContract.deleteDocument(
                    activity.contentResolver,
                    temporary,
                )
            }
            throw error
        }
    }

    private fun readDimensions(uri: Uri): Pair<Int, Int> {
        val options = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        activity.contentResolver.openInputStream(uri).use { input ->
            BitmapFactory.decodeStream(input, null, options)
        }
        check(options.outWidth > 0 && options.outHeight > 0) {
            "No se pudieron leer las dimensiones de la imagen."
        }
        return Pair(options.outWidth, options.outHeight)
    }

    private fun createThumbnail(uri: Uri, hash: String): File {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        activity.contentResolver.openInputStream(uri).use { input ->
            BitmapFactory.decodeStream(input, null, bounds)
        }
        var sample = 1
        while (
            bounds.outWidth / sample > 1024 ||
            bounds.outHeight / sample > 1024
        ) {
            sample *= 2
        }
        val options = BitmapFactory.Options().apply { inSampleSize = sample }
        val decoded =
            activity.contentResolver.openInputStream(uri).use { input ->
                BitmapFactory.decodeStream(input, null, options)
            } ?: error("No se pudo generar la miniatura.")
        val rotation = readRotation(uri)
        val thumbnail =
            if (rotation == 0f) {
                decoded
            } else {
                Bitmap.createBitmap(
                    decoded,
                    0,
                    0,
                    decoded.width,
                    decoded.height,
                    Matrix().apply { postRotate(rotation) },
                    true,
                ).also {
                    if (it !== decoded) decoded.recycle()
                }
            }

        val directory = File(activity.cacheDir, "photo_thumbnails")
        check(directory.exists() || directory.mkdirs()) {
            "No se pudo crear la caché de miniaturas."
        }
        val file = File(directory, hash + ".jpg")
        FileOutputStream(file).use { output ->
            check(thumbnail.compress(Bitmap.CompressFormat.JPEG, 85, output)) {
                "No se pudo comprimir la miniatura."
            }
        }
        thumbnail.recycle()
        return file
    }

    private fun readRotation(uri: Uri): Float {
        return activity.contentResolver.openInputStream(uri).use { input ->
            if (input == null) return@use 0f
            when (
                ExifInterface(input).getAttributeInt(
                    ExifInterface.TAG_ORIENTATION,
                    ExifInterface.ORIENTATION_NORMAL,
                )
            ) {
                ExifInterface.ORIENTATION_ROTATE_90 -> 90f
                ExifInterface.ORIENTATION_ROTATE_180 -> 180f
                ExifInterface.ORIENTATION_ROTATE_270 -> 270f
                else -> 0f
            }
        }
    }

    private fun updateManifest(
        interventionUri: Uri,
        relativePath: String,
        size: Long,
        hash: String,
    ) {
        val manifestUri =
            findChild(interventionUri, "manifest.json", null)
                ?: error("No existe manifest.json.")
        val manifestText =
            activity.contentResolver.openInputStream(manifestUri).use { input ->
                requireNotNull(input) { "No se pudo leer manifest.json." }
                input.bufferedReader(Charsets.UTF_8).readText()
            }
        val manifest = JSONObject(manifestText)
        val existing = manifest.getJSONArray("files")
        val entries = mutableListOf<JSONObject>()
        for (index in 0 until existing.length()) {
            val item = existing.getJSONObject(index)
            if (item.getString("path") != relativePath) entries.add(item)
        }
        entries.add(
            JSONObject()
                .put("path", relativePath)
                .put("size", size)
                .put("sha256", hash),
        )
        entries.sortBy { it.getString("path") }
        val files = JSONArray()
        entries.forEach(files::put)
        manifest.put("files", files)
        manifest.put("generatedAt", Instant.now().toString())

        check(DocumentsContract.deleteDocument(activity.contentResolver, manifestUri)) {
            "No se pudo sustituir manifest.json."
        }
        val replacement =
            DocumentsContract.createDocument(
                activity.contentResolver,
                interventionUri,
                "application/json",
                "manifest.json",
            ) ?: error("No se pudo recrear manifest.json.")
        activity.contentResolver.openOutputStream(replacement, "w").use { output ->
            requireNotNull(output) { "No se pudo escribir manifest.json." }
            output.write((manifest.toString(2) + "\n").toByteArray(Charsets.UTF_8))
            output.flush()
        }
    }

    private fun requireDirectory(parent: Uri, name: String): Uri {
        return findChild(
            parent,
            name,
            DocumentsContract.Document.MIME_TYPE_DIR,
        ) ?: error("No existe la carpeta " + name + ".")
    }

    private fun findChild(parent: Uri, name: String, mimeType: String?): Uri? {
        val parentId = DocumentsContract.getDocumentId(parent)
        val children =
            DocumentsContract.buildChildDocumentsUriUsingTree(parent, parentId)
        val projection =
            arrayOf(
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE,
            )
        activity.contentResolver.query(children, projection, null, null, null)
            .use { cursor ->
                requireNotNull(cursor) { "No se pudo consultar " + parent + "." }
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
                        mimeType == null ||
                            cursor.getString(typeColumn) == mimeType
                    if (cursor.getString(nameColumn) == name && matchesType) {
                        return DocumentsContract.buildDocumentUriUsingTree(
                            parent,
                            cursor.getString(idColumn),
                        )
                    }
                }
            }
        return null
    }
}

private class PhotoAlreadyExistsException(fileName: String) :
    IllegalStateException(fileName)

private fun Map<String, Any?>.requiredString(key: String): String {
    return this[key] as? String ?: error("Falta el argumento " + key + ".")
}

private fun ByteArray.toHex(): String {
    return joinToString("") { byte -> "%02x".format(byte) }
}
