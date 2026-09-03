import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import '../../features/backups/domain/backup.dart';
import '../../features/interventions/domain/intervention.dart';
import '../../features/photos/domain/photo_asset.dart';
import '../../features/storage/domain/document_storage_status.dart';

const _interventions = 'intervenciones', _disassembly = '01_desmontaje';
final _progress = StreamController<BackupProgress>.broadcast();
Stream<BackupProgress> get linuxBackupProgress => _progress.stream;

class LinuxFileServices {
  const LinuxFileServices();

  Future<DocumentStorageStatus?> getSavedRoot() async {
    final file = _configFile();
    if (!await file.exists()) return null;
    final path = (await file.readAsString()).trim();
    return path.isEmpty ? null : _status(path);
  }

  Future<DocumentStorageStatus?> chooseRoot() async {
    final path = await getDirectoryPath(
      confirmButtonText: 'Seleccionar carpeta documental',
    );
    if (path == null) return null;
    final root = Directory(path).absolute;
    if (!await root.exists()) {
      throw PlatformException(
        code: 'storage_not_available',
        message: 'La carpeta seleccionada no está disponible.',
      );
    }
    await _atomicWrite(_configFile(), utf8.encode(root.path));
    return _status(root.path);
  }

  Future<void> writeIntervention({
    required CreatedIntervention created,
    required String interventionMarkdown,
    required String operationMarkdown,
  }) async {
    final intervention = _child(
      _fromUri(created.intervention.rootDocumentUri),
      created.intervention.folderName,
    );
    final code = created.firstOperation.code;
    final operation = _child(_child(intervention, _disassembly), code);
    final entries = [
      await _writeEntry(
        intervention,
        'ficha_intervencion.md',
        utf8.encode(interventionMarkdown),
        'ficha_intervencion.md',
      ),
      await _writeEntry(
        operation,
        '$code.md',
        utf8.encode(operationMarkdown),
        '$_disassembly/$code/$code.md',
      ),
    ];
    await _newManifest(
      intervention,
      created.intervention.id,
      created.intervention.updatedAt,
      entries,
    );
  }

  Future<void> updateOperation({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required String markdown,
  }) async {
    final intervention = _child(
      _fromUri(interventionsRoot),
      interventionFolder,
    );
    final operation = _child(_child(intervention, _disassembly), operationCode);
    final relative = '$_disassembly/$operationCode/$operationCode.md';
    await _updateManifest(
      intervention,
      await _writeEntry(
        operation,
        '$operationCode.md',
        utf8.encode(markdown),
        relative,
      ),
    );
  }

  Future<CapturedPhoto?> importPhoto({
    required Uri interventionsRoot,
    required String interventionFolder,
    required String operationCode,
    required OperationPhotoKind kind,
  }) async {
    const types = XTypeGroup(
      label: 'Imágenes',
      extensions: ['jpg', 'jpeg', 'png', 'webp', 'bmp', 'gif', 'tif', 'tiff'],
    );
    final selected = await openFile(
      acceptedTypeGroups: const [types],
      confirmButtonText: 'Importar fotografía',
    );
    if (selected == null) return null;
    return _storeImage(
      root: interventionsRoot,
      folder: interventionFolder,
      code: operationCode,
      name: kind.fileNameFor(operationCode),
      bytes: await selected.readAsBytes(),
      replace: false,
    );
  }

  Future<void> saveAnnotationDraft({
    required Uri root,
    required String folder,
    required String operationCode,
    required OperationPhotoKind sourceKind,
    required String json,
  }) async {
    final intervention = _child(_fromUri(root), folder);
    final operation = _child(_child(intervention, _disassembly), operationCode);
    final name = '${sourceKind.annotationFileStemFor(operationCode)}.json';
    final entry = await _writeEntry(
      operation,
      name,
      utf8.encode(json),
      '$_disassembly/$operationCode/$name',
    );
    await _updateManifest(intervention, entry);
  }

  Future<CapturedPhoto> exportAnnotation({
    required Uri root,
    required String folder,
    required String operationCode,
    required OperationPhotoKind sourceKind,
    required String json,
    required Uint8List renderedPng,
  }) async {
    await saveAnnotationDraft(
      root: root,
      folder: folder,
      operationCode: operationCode,
      sourceKind: sourceKind,
      json: json,
    );
    return _storeImage(
      root: root,
      folder: folder,
      code: operationCode,
      name: '${sourceKind.annotationFileStemFor(operationCode)}.jpg',
      bytes: renderedPng,
      replace: true,
    );
  }

  Future<BackupResult?> backup({
    required Uri interventionsRoot,
    required String interventionFolder,
  }) async {
    final selected = await getDirectoryPath(
      confirmButtonText: 'Seleccionar destino de la copia',
    );
    if (selected == null) return null;
    final source = _child(_fromUri(interventionsRoot), interventionFolder);
    final destination = _child(Directory(selected), interventionFolder);
    if (!await source.exists()) {
      throw PlatformException(
        code: 'backup_source_missing',
        message: 'No existe la carpeta de la intervención.',
      );
    }
    if (await destination.exists()) {
      throw PlatformException(
        code: 'backup_destination_exists',
        message: 'Ya existe una copia llamada $interventionFolder.',
      );
    }
    final files = await _files(source);
    final total = files.fold<int>(0, (sum, file) => sum + file.lengthSync());
    final temporary = _child(
      Directory(selected),
      '.$interventionFolder.partial-${DateTime.now().microsecondsSinceEpoch}',
    );
    var copied = 0, count = 0;
    try {
      await temporary.create(recursive: true);
      for (final file in files) {
        final relative = _relative(source.path, file.path);
        final target = File(_join(temporary.path, relative));
        await target.parent.create(recursive: true);
        await file.copy(target.path);
        if (await _fileHash(file) != await _fileHash(target) ||
            await file.length() != await target.length()) {
          throw StateError('Verificación fallida: $relative');
        }
        copied += await file.length();
        count++;
        _progress.add(
          BackupProgress(
            status: BackupStatus.running,
            bytesCopied: copied,
            totalBytes: total,
            path: relative,
          ),
        );
      }
      await temporary.rename(destination.path);
      final manifest = File(_join(source.path, 'manifest.json'));
      if (!await manifest.exists()) {
        throw StateError('No existe manifest.json.');
      }
      final manifestHash = await _fileHash(manifest);
      _progress.add(
        BackupProgress(
          status: BackupStatus.verified,
          bytesCopied: copied,
          totalBytes: total,
          path: interventionFolder,
        ),
      );
      return BackupResult(
        destinationUri: destination.absolute.uri,
        manifestSha256: manifestHash,
        bytesCopied: copied,
        filesCopied: count,
      );
    } catch (error) {
      if (await temporary.exists()) await temporary.delete(recursive: true);
      _progress.add(
        BackupProgress(
          status: BackupStatus.failed,
          bytesCopied: copied,
          totalBytes: total,
          path: '',
          error: error.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> writePortableExport({
    required Uri root,
    required String folder,
    required String json,
  }) async {
    final intervention = _child(_fromUri(root), folder);
    final entry = await _writeEntry(
      intervention,
      'intervention_export.json',
      utf8.encode(json),
      'intervention_export.json',
    );
    await _updateManifest(intervention, entry);
  }

  Future<DocumentStorageStatus> _status(String path) async {
    final root = Directory(path).absolute;
    if (!await root.exists()) {
      throw PlatformException(
        code: 'storage_not_available',
        message: 'La carpeta documental configurada no está disponible.',
      );
    }
    final interventionRoot = _child(root, _interventions);
    await interventionRoot.create(recursive: true);
    return DocumentStorageStatus(
      documentRoot: root.uri,
      interventionsRoot: interventionRoot.uri,
      availableBytes: await _availableBytes(root.path),
    );
  }

  Future<CapturedPhoto> _storeImage({
    required Uri root,
    required String folder,
    required String code,
    required String name,
    required Uint8List bytes,
    required bool replace,
  }) async {
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw PlatformException(
        code: 'image_decode_failed',
        message: 'El archivo seleccionado no contiene una imagen válida.',
      );
    }
    final normalized = img.bakeOrientation(decoded);
    final jpeg = Uint8List.fromList(img.encodeJpg(normalized, quality: 92));
    final intervention = _child(_fromUri(root), folder);
    final operation = _child(_child(intervention, _disassembly), code);
    await operation.create(recursive: true);
    final destination = File(_join(operation.path, name));
    if (!replace && await destination.exists()) {
      throw PlatformException(
        code: 'photo_already_exists',
        message: 'La fotografía $name ya existe.',
      );
    }
    await _atomicWrite(destination, jpeg);
    final hash = sha256.convert(jpeg).toString();
    final thumbnail = File(
      _join(_join(_cacheDirectory().path, 'photo_thumbnails'), '$hash.jpg'),
    );
    final thumb = normalized.width > 1024 || normalized.height > 1024
        ? img.copyResize(
            normalized,
            width: normalized.width >= normalized.height ? 1024 : null,
            height: normalized.height > normalized.width ? 1024 : null,
          )
        : normalized;
    await _atomicWrite(thumbnail, img.encodeJpg(thumb, quality: 85));
    final relative = '$_disassembly/$code/$name';
    await _updateManifest(intervention, _Entry(relative, jpeg.length, hash));
    return CapturedPhoto(
      relativePath: relative,
      sha256: hash,
      byteSize: jpeg.length,
      width: normalized.width,
      height: normalized.height,
      thumbnailPath: thumbnail.path,
      capturedAt: DateTime.now().toUtc(),
    );
  }
}

Directory _fromUri(Uri uri) {
  if (uri.scheme != 'file') {
    throw PlatformException(
      code: 'unsupported_document_uri',
      message: 'Linux requiere una ruta de archivo local.',
      details: uri.toString(),
    );
  }
  return Directory(uri.toFilePath());
}

Directory _child(Directory parent, String segment) {
  if (segment.isEmpty ||
      segment == '.' ||
      segment == '..' ||
      segment.contains('/') ||
      segment.contains(String.fromCharCode(92))) {
    throw ArgumentError.value(segment, 'segment', 'Nombre no válido');
  }
  return Directory(_join(parent.path, segment));
}

String _join(String left, String right) => left.endsWith(Platform.pathSeparator)
    ? '$left$right'
    : '$left${Platform.pathSeparator}$right';

String _relative(String root, String path) {
  final prefix = root.endsWith(Platform.pathSeparator)
      ? root
      : '$root${Platform.pathSeparator}';
  if (!path.startsWith(prefix)) throw ArgumentError('Ruta fuera del origen.');
  return path.substring(prefix.length).replaceAll(Platform.pathSeparator, '/');
}

Directory _configDirectory() {
  final xdg = Platform.environment['XDG_CONFIG_HOME'];
  if (xdg != null && xdg.isNotEmpty) {
    return Directory(_join(xdg, 'fichas_desmontaje'));
  }
  final home = Platform.environment['HOME'];
  if (home == null || home.isEmpty) {
    throw StateError('No se encontró el directorio del usuario.');
  }
  return Directory(_join(_join(home, '.config'), 'fichas_desmontaje'));
}

Directory _cacheDirectory() {
  final xdg = Platform.environment['XDG_CACHE_HOME'];
  if (xdg != null && xdg.isNotEmpty) {
    return Directory(_join(xdg, 'fichas_desmontaje'));
  }
  final home = Platform.environment['HOME'];
  return home == null || home.isEmpty
      ? Directory.systemTemp
      : Directory(_join(_join(home, '.cache'), 'fichas_desmontaje'));
}

File _configFile() => File(_join(_configDirectory().path, 'document_root'));

Future<int?> _availableBytes(String path) async {
  try {
    final result = await Process.run('df', ['-Pk', path]);
    if (result.exitCode != 0) return null;
    final lines = (result.stdout as String).trim().split('\n');
    if (lines.length < 2) return null;
    final columns = lines.last.trim().split(RegExp(r'\s+'));
    final kb = columns.length < 4 ? null : int.tryParse(columns[3]);
    return kb == null ? null : kb * 1024;
  } catch (_) {
    return null;
  }
}

Future<List<File>> _files(Directory root) async {
  final result = <File>[];
  await for (final entity in root.list(recursive: true, followLinks: false)) {
    if (entity is File) result.add(entity);
  }
  result.sort((a, b) => a.path.compareTo(b.path));
  return result;
}

Future<String> _fileHash(File file) async =>
    sha256.convert(await file.readAsBytes()).toString();

Future<void> _atomicWrite(File destination, List<int> bytes) async {
  await destination.parent.create(recursive: true);
  final temporary = File(
    '${destination.path}.${DateTime.now().microsecondsSinceEpoch}.tmp',
  );
  try {
    await temporary.writeAsBytes(bytes, flush: true);
    if (await destination.exists()) await destination.delete();
    await temporary.rename(destination.path);
  } finally {
    if (await temporary.exists()) await temporary.delete();
  }
}

Future<_Entry> _writeEntry(
  Directory directory,
  String name,
  List<int> bytes,
  String relative,
) async {
  await directory.create(recursive: true);
  await _atomicWrite(File(_join(directory.path, name)), bytes);
  return _Entry(relative, bytes.length, sha256.convert(bytes).toString());
}

Future<void> _newManifest(
  Directory intervention,
  String id,
  DateTime generatedAt,
  List<_Entry> entries,
) async {
  entries.sort((a, b) => a.path.compareTo(b.path));
  await _writeManifest(intervention, {
    'schemaVersion': 1,
    'interventionId': id,
    'generatedAt': generatedAt.toUtc().toIso8601String(),
    'files': entries.map((entry) => entry.toJson()).toList(),
  });
}

Future<void> _updateManifest(Directory intervention, _Entry updated) async {
  final file = File(_join(intervention.path, 'manifest.json'));
  if (!await file.exists()) throw StateError('No existe manifest.json.');
  final document =
      jsonDecode(await file.readAsString()) as Map<String, dynamic>;
  final entries =
      (document['files'] as List<dynamic>? ?? const [])
          .map((value) => Map<String, dynamic>.from(value as Map))
          .where((entry) => entry['path'] != updated.path)
          .toList()
        ..add(updated.toJson())
        ..sort((a, b) => (a['path'] as String).compareTo(b['path'] as String));
  document['files'] = entries;
  document['generatedAt'] = DateTime.now().toUtc().toIso8601String();
  await _writeManifest(intervention, document);
}

Future<void> _writeManifest(
  Directory intervention,
  Map<String, dynamic> document,
) async {
  const encoder = JsonEncoder.withIndent('  ');
  await _atomicWrite(
    File(_join(intervention.path, 'manifest.json')),
    utf8.encode('${encoder.convert(document)}\n'),
  );
}

class _Entry {
  const _Entry(this.path, this.size, this.hash);
  final String path;
  final int size;
  final String hash;
  Map<String, Object> toJson() => {'path': path, 'size': size, 'sha256': hash};
}
