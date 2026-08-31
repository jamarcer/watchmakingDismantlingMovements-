package es.relojeria.fichasdesmontaje

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.DocumentsContract
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.io.InputStream
import java.security.MessageDigest
import java.time.Instant
import java.util.UUID
import java.util.concurrent.Executors

class BackupCoordinator(private val activity: Activity) {
    private val requestCode = 7601
    private val executor = Executors.newSingleThreadExecutor()
    private var pending: Pending? = null
    private var sink: EventChannel.EventSink? = null
    private val main = Handler(Looper.getMainLooper())
    fun streamHandler() = object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) { sink = events }
        override fun onCancel(arguments: Any?) { sink = null }
    }
    fun start(arguments: Any?, result: MethodChannel.Result) {
        if (pending != null) { result.error("backup_in_progress", "Ya hay una copia en curso.", null); return }
        @Suppress("UNCHECKED_CAST") val values = arguments as? Map<String, Any?> ?: run { result.error("backup_invalid", "Faltan los datos de la copia.", null); return }
        pending = Pending(values, result)
        activity.startActivityForResult(Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply { addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or Intent.FLAG_GRANT_PREFIX_URI_PERMISSION) }, requestCode)
    }
    fun handles(code: Int) = code == requestCode
    fun complete(code: Int, resultCode: Int, data: Intent?) {
        val request = pending ?: return; pending = null
        if (code != requestCode || resultCode != Activity.RESULT_OK || data?.data == null) { request.result.success(null); return }
        val destination = data.data!!
        runCatching { activity.contentResolver.takePersistableUriPermission(destination, data.flags and (Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION)) }
        executor.execute {
            try {
                val result = BackupFileCopier(activity) { event -> main.post { sink?.success(event) } }.copy(request.values, destination)
                main.post { request.result.success(result) }
            } catch (error: Exception) {
                main.post { sink?.success(mapOf("status" to "failed", "bytesCopied" to 0, "totalBytes" to 0, "path" to "", "error" to (error.message ?: "backup_failed"))); request.result.error("backup_failed", "No se pudo completar la copia USB.", error.message) }
            }
        }
    }
    private data class Pending(val values: Map<String, Any?>, val result: MethodChannel.Result)
}

private class BackupFileCopier(private val activity: Activity, private val emit: (Map<String, Any?>) -> Unit) {
    private val resolver get() = activity.contentResolver
    private var copied = 0L; private var total = 0L; private var files = 0
    fun copy(values: Map<String, Any?>, destinationTree: Uri): Map<String, Any> {
        val root = Uri.parse(values.requiredString("interventionsRootUri")); val folderName = values.requiredString("interventionFolder")
        val source = findChild(root, folderName, DocumentsContract.Document.MIME_TYPE_DIR) ?: error("No existe la intervención.")
        total = sizeOf(source)
        val destinationParent = DocumentsContract.buildDocumentUriUsingTree(destinationTree, DocumentsContract.getTreeDocumentId(destinationTree))
        val tempName = "." + folderName + ".partial-" + UUID.randomUUID()
        val temp = DocumentsContract.createDocument(resolver, destinationParent, DocumentsContract.Document.MIME_TYPE_DIR, tempName) ?: error("No se pudo crear la carpeta temporal USB.")
        try {
            copyDirectory(source, temp, "")
            val final = DocumentsContract.renameDocument(resolver, temp, folderName) ?: error("No se pudo finalizar la carpeta USB.")
            val manifest = findChild(source, "manifest.json", null) ?: error("No existe manifest.json.")
            val manifestHash = hash(manifest).first
            emit(mapOf("status" to "verified", "bytesCopied" to copied, "totalBytes" to total, "path" to folderName, "files" to files))
            return mapOf("destinationUri" to final.toString(), "manifestSha256" to manifestHash, "bytesCopied" to copied, "filesCopied" to files)
        } catch (error: Exception) {
            runCatching { deleteTree(temp) }; throw error
        }
    }
    private fun copyDirectory(source: Uri, target: Uri, relative: String) {
        for (node in children(source)) {
            val path = if (relative.isEmpty()) node.name else relative + "/" + node.name
            if (node.directory) { val dir = DocumentsContract.createDocument(resolver, target, DocumentsContract.Document.MIME_TYPE_DIR, node.name) ?: error("No se pudo crear $path"); copyDirectory(node.uri, dir, path) }
            else copyFile(node, target, path)
        }
    }
    private fun copyFile(node: Node, target: Uri, path: String) {
        val temp = DocumentsContract.createDocument(resolver, target, "application/octet-stream", "." + node.name + ".partial-" + UUID.randomUUID()) ?: error("No se pudo crear $path")
        val digest = MessageDigest.getInstance("SHA-256"); var size = 0L
        try {
            resolver.openInputStream(node.uri).use { input -> requireNotNull(input); resolver.openOutputStream(temp, "w").use { output -> requireNotNull(output); val buffer=ByteArray(64*1024); while(true){ val n=input.read(buffer); if(n<0) break; output.write(buffer,0,n); digest.update(buffer,0,n); size+=n; copied+=n; emit(mapOf("status" to "copying", "bytesCopied" to copied, "totalBytes" to total, "path" to path)); }; output.flush() } }
            val final = DocumentsContract.renameDocument(resolver, temp, node.name) ?: error("No se pudo finalizar $path")
            val targetHash = hash(final).first
            check(size == node.size && digest.digest().toHex() == targetHash) { "Verificación fallida: $path" }
            files++
        } catch (error: Exception) { runCatching { DocumentsContract.deleteDocument(resolver, temp) }; throw error }
    }
    private fun sizeOf(uri: Uri): Long = children(uri).sumOf { if(it.directory) sizeOf(it.uri) else it.size }
    private fun hash(uri: Uri): Pair<String,Long> { val digest=MessageDigest.getInstance("SHA-256"); var size=0L; resolver.openInputStream(uri).use { input -> requireNotNull(input); val b=ByteArray(64*1024); while(true){val n=input.read(b);if(n<0)break;digest.update(b,0,n);size+=n} }; return digest.digest().toHex() to size }
    private fun deleteTree(uri: Uri) { for(node in children(uri)) if(node.directory) deleteTree(node.uri); DocumentsContract.deleteDocument(resolver, uri) }
    private fun children(parent: Uri): List<Node> { val id=DocumentsContract.getDocumentId(parent); val child=DocumentsContract.buildChildDocumentsUriUsingTree(parent,id); val projection=arrayOf(DocumentsContract.Document.COLUMN_DOCUMENT_ID,DocumentsContract.Document.COLUMN_DISPLAY_NAME,DocumentsContract.Document.COLUMN_MIME_TYPE,DocumentsContract.Document.COLUMN_SIZE); val result=mutableListOf<Node>(); resolver.query(child,projection,null,null,null).use { c -> requireNotNull(c); val i=c.getColumnIndexOrThrow(DocumentsContract.Document.COLUMN_DOCUMENT_ID);val n=c.getColumnIndexOrThrow(DocumentsContract.Document.COLUMN_DISPLAY_NAME);val m=c.getColumnIndexOrThrow(DocumentsContract.Document.COLUMN_MIME_TYPE);val s=c.getColumnIndex(DocumentsContract.Document.COLUMN_SIZE);while(c.moveToNext()){result.add(Node(DocumentsContract.buildDocumentUriUsingTree(parent,c.getString(i)),c.getString(n),c.getString(m)==DocumentsContract.Document.MIME_TYPE_DIR,if(s>=0&&!c.isNull(s))c.getLong(s) else 0L))}}; return result }
    private fun findChild(parent: Uri,name:String,mime:String?):Uri?=children(parent).firstOrNull{it.name==name&&(mime==null||it.directory)}?.uri
    private data class Node(val uri:Uri,val name:String,val directory:Boolean,val size:Long)
    private fun Map<String,Any?>.requiredString(key:String)=this[key] as? String ?: error("Falta $key")
    private fun ByteArray.toHex()=joinToString(""){b->"%02x".format(b)}
}
