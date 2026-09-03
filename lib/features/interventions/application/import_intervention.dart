import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image/image.dart' as img;

import '../infrastructure/portable_intervention_repository.dart';

class ImportInterventionResult {
  const ImportInterventionResult({
    required this.code,
    required this.folder,
    required this.legacy,
  });
  final String code;
  final String folder;
  final bool legacy;
}

class ImportIntervention {
  ImportIntervention(this.repository);
  final PortableInterventionRepository repository;

  Future<ImportInterventionResult?> run(Uri interventionsRoot) async {
    if (!Platform.isLinux) {
      throw UnsupportedError(
        'La importación de directorios está disponible en Linux.',
      );
    }
    final selected = await getDirectoryPath(
      confirmButtonText: 'Importar intervención',
    );
    if (selected == null) return null;
    final source = Directory(selected);
    final exportFile = File(_join(source.path, 'intervention_export.json'));
    final legacy = !await exportFile.exists();
    await _validateManifest(source);
    final snapshot = legacy
        ? await _legacySnapshot(source)
        : jsonDecode(await exportFile.readAsString()) as Map<String, dynamic>;
    final intervention = Map<String, dynamic>.from(
      snapshot['intervention'] as Map,
    );
    final sourceCode = intervention['code'] as String;
    final code = await repository.availableCode(sourceCode);
    final root = Directory.fromUri(interventionsRoot);
    final folder = _folderName(
      code,
      intervention['brand'] as String? ?? 'sin_marca',
      intervention['calibre'] as String?,
    );
    final destination = Directory(_join(root.path, folder));
    if (await destination.exists()) {
      throw StateError('La carpeta de destino ya existe: ' + folder);
    }
    final temporary = Directory(
      _join(
        root.path,
        '.' +
            folder +
            '.import-' +
            DateTime.now().microsecondsSinceEpoch.toString(),
      ),
    );
    try {
      await _copyDirectory(source, temporary);
      final copiedExport = File(
        _join(temporary.path, 'intervention_export.json'),
      );
      intervention['code'] = code;
      intervention['folderName'] = folder;
      snapshot['intervention'] = intervention;
      await copiedExport.writeAsString(
        const JsonEncoder.withIndent('  ').convert(snapshot) + '\n',
        flush: true,
      );
      if (code != sourceCode) {
        final sheet = File(_join(temporary.path, 'ficha_intervencion.md'));
        if (await sheet.exists()) {
          await sheet.writeAsString(
            (await sheet.readAsString()).replaceAll(sourceCode, code),
            flush: true,
          );
        }
      }
      await _refreshManifest(temporary);
      await temporary.rename(destination.path);
      try {
        await repository.import(
          snapshot: snapshot,
          root: interventionsRoot,
          folder: folder,
          code: code,
        );
      } catch (_) {
        if (await destination.exists()) {
          await destination.delete(recursive: true);
        }
        rethrow;
      }
      return ImportInterventionResult(
        code: code,
        folder: folder,
        legacy: legacy,
      );
    } catch (_) {
      if (await temporary.exists()) await temporary.delete(recursive: true);
      rethrow;
    }
  }
}

Future<Map<String, dynamic>> _legacySnapshot(Directory source) async {
  final sheet = File(_join(source.path, 'ficha_intervencion.md'));
  if (!await sheet.exists()) {
    throw const FormatException('No existe ficha_intervencion.md.');
  }
  final text = await sheet.readAsString();
  final meta = _frontmatter(text);
  final code =
      meta['code'] ??
      source.path.split(Platform.pathSeparator).last.split('_').first;
  final now = DateTime.now().toUtc().toIso8601String();
  final operationMaps = <Map<String, dynamic>>[];
  final photoMaps = <Map<String, dynamic>>[];
  final componentMaps = <Map<String, dynamic>>[];
  final operationsDir = Directory(_join(source.path, '01_desmontaje'));
  if (await operationsDir.exists()) {
    await for (final entity in operationsDir.list()) {
      if (entity is! Directory) continue;
      final operationCode = entity.path.split(Platform.pathSeparator).last;
      final document = File(_join(entity.path, operationCode + '.md'));
      if (!await document.exists()) continue;
      final operationText = await document.readAsString();
      final values = _frontmatter(operationText);
      final operationId = values['id'] ?? 'legacy-' + operationCode;
      final heading = RegExp(
        r'^#\s+[^—]+—\s*(.+)$',
        multiLine: true,
      ).firstMatch(operationText);
      operationMaps.add({
        'id': operationId,
        'interventionId': meta['id'] ?? 'legacy-intervention',
        'code': operationCode,
        'sequence':
            int.tryParse(values['sequence'] ?? '') ??
            int.tryParse(operationCode.substring(1)) ??
            1,
        'title': heading?.group(1)?.trim() ?? 'Operación importada',
        'system': null,
        'description': null,
        'tray': values['tray'],
        'orientation': null,
        'notes': null,
        'status': values['status'] ?? 'draft',
        'createdAt': values['created_at'] ?? now,
        'updatedAt': values['updated_at'] ?? now,
        'deletedAt': null,
        'deletedBy': null,
      });
      photoMaps.addAll(
        await _legacyPhotos(
          entity,
          operationCode,
          operationId,
          meta['id'] ?? 'legacy-intervention',
          now,
        ),
      );
      componentMaps.addAll(
        _legacyComponents(
          operationText,
          operationId,
          meta['id'] ?? 'legacy-intervention',
          now,
        ),
      );
    }
  }
  if (operationMaps.isEmpty) {
    throw const FormatException('No se encontraron operaciones Dxx.');
  }
  operationMaps.sort(
    (a, b) => (a['sequence'] as int).compareTo(b['sequence'] as int),
  );
  return {
    'format': 'fichas_desmontaje',
    'schemaVersion': 1,
    'legacy': true,
    'exportedAt': now,
    'intervention': {
      'id': meta['id'] ?? 'legacy-intervention',
      'code': code,
      'brand': meta['brand'] ?? 'Sin marca',
      'modelReference': _emptyToNull(meta['model_reference']),
      'calibre': _emptyToNull(meta['calibre']),
      'movementNumber': _emptyToNull(meta['movement_number']),
      'watchType': meta['watch_type'] ?? 'other',
      'technician': meta['technician'] ?? 'Importación',
      'referenceOrientation': meta['reference_orientation'] ?? '',
      'initialState': _section(text, 'Estado inicial'),
      'status': meta['status'] ?? 'draft',
      'documentState': 'synchronized',
      'rootDocumentUri': '',
      'folderName': source.path.split(Platform.pathSeparator).last,
      'nextOperationNumber': (operationMaps.last['sequence'] as int) + 1,
      'nextPartNumber': 1,
      'nextScrewNumber': 1,
      'nextWheelNumber': 1,
      'nextSpringNumber': 1,
      'createdAt': meta['created_at'] ?? now,
      'updatedAt': meta['updated_at'] ?? now,
      'deletedAt': null,
      'deletedBy': null,
    },
    'operations': operationMaps,
    'photos': photoMaps,
    'annotations': [],
    'components': componentMaps,
    'findings': [],
    'checklist': [],
    'audits': [],
  };
}

Future<List<Map<String, dynamic>>> _legacyPhotos(
  Directory directory,
  String operationCode,
  String operationId,
  String interventionId,
  String fallbackDate,
) async {
  final result = <Map<String, dynamic>>[];
  final pendingSources = <Map<String, dynamic>>[];
  await for (final entity in directory.list()) {
    if (entity is! File) continue;
    final name = entity.path.split(Platform.pathSeparator).last;
    final match = RegExp(
      "^" + RegExp.escape(operationCode) + r"_([ABCD])_.*[.](jpg|jpeg|png)",
      caseSensitive: false,
    ).firstMatch(name);
    if (match == null) continue;
    final bytes = await entity.readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) continue;
    final letter = match.group(1)!.toUpperCase();
    final kind = letter == "A"
        ? "before"
        : letter == "B"
        ? "annotated"
        : letter == "C"
        ? "after"
        : "parts";
    final id = "legacy-photo-" + operationCode + "-" + letter;
    final row = <String, dynamic>{
      "id": id,
      "interventionId": interventionId,
      "operationId": operationId,
      "kind": kind,
      "relativePath": "01_desmontaje/" + operationCode + "/" + name,
      "sha256": sha256.convert(bytes).toString(),
      "byteSize": bytes.length,
      "width": decoded.width,
      "height": decoded.height,
      "thumbnailPath": entity.path,
      "capturedAt": (await entity.stat()).modified.toUtc().toIso8601String(),
      "isOriginal": kind != "annotated",
      "sourcePhotoId": null,
    };
    result.add(row);
    if (kind == "annotated") pendingSources.add(row);
  }
  final original = result
      .where((row) => row["kind"] != "annotated")
      .firstOrNull;
  for (final annotated in pendingSources) {
    annotated["sourcePhotoId"] = original?["id"];
  }
  return result;
}

List<Map<String, dynamic>> _legacyComponents(
  String markdown,
  String operationId,
  String interventionId,
  String date,
) {
  final section = _section(markdown, "Componentes");
  if (section == null) return const [];
  final result = <Map<String, dynamic>>[];
  for (final line in section.split("\n")) {
    if (!line.trim().startsWith("|") || line.contains("|---")) continue;
    final cells = line
        .split("|")
        .skip(1)
        .map((cell) => cell.trim().replaceAll(r"\|", "|"))
        .toList();
    if (cells.length < 6 || cells[0] == "Código") continue;
    final type = switch (cells[1].toLowerCase()) {
      "pieza" => "part",
      "tornillo" => "screw",
      "rueda" => "wheel",
      "muelle" => "spring",
      _ => "part",
    };
    result.add({
      "id": "legacy-component-" + operationId + "-" + cells[0],
      "interventionId": interventionId,
      "operationId": operationId,
      "code": cells[0],
      "type": type,
      "description": cells[2],
      "quantity": int.tryParse(cells[3]) ?? 1,
      "position": null,
      "orientation": null,
      "tray": cells[4],
      "notes": _emptyToNull(cells[5]),
      "createdAt": date,
      "updatedAt": date,
    });
  }
  return result;
}

Map<String, String> _frontmatter(String text) {
  final match = RegExp(r'^---\s*\n(.*?)\n---', dotAll: true).firstMatch(text);
  if (match == null) return {};
  final result = <String, String>{};
  for (final line in match.group(1)!.split('\n')) {
    final split = line.indexOf(':');
    if (split < 1) continue;
    final key = line.substring(0, split).trim();
    final raw = line.substring(split + 1).trim();
    try {
      result[key] = jsonDecode(raw) as String;
    } catch (_) {
      result[key] = raw;
    }
  }
  return result;
}

String? _emptyToNull(String? value) =>
    value == null || value.trim().isEmpty ? null : value;
String? _section(String text, String title) {
  final match = RegExp(
    '## ' + RegExp.escape(title) + r'\s*\n\s*(.*?)(?=\n## |$)',
    dotAll: true,
  ).firstMatch(text);
  return _emptyToNull(match?.group(1)?.trim());
}

Future<void> _validateManifest(Directory source) async {
  final file = File(_join(source.path, 'manifest.json'));
  if (!await file.exists()) {
    throw const FormatException('No existe manifest.json.');
  }
  final manifest =
      jsonDecode(await file.readAsString()) as Map<String, dynamic>;
  final entries = manifest['files'];
  if (entries is! List) throw const FormatException('Manifiesto sin archivos.');
  for (final value in entries) {
    final entry = Map<String, dynamic>.from(value as Map);
    final relative = entry['path'] as String;
    final target = File(_safePath(source, relative));
    if (!await target.exists()) {
      throw FormatException('Falta el archivo ' + relative);
    }
    final bytes = await target.readAsBytes();
    if (bytes.length != entry['size'] ||
        sha256.convert(bytes).toString() != entry['sha256']) {
      throw FormatException('Integridad incorrecta: ' + relative);
    }
  }
}

Future<void> _copyDirectory(Directory source, Directory target) async {
  await target.create(recursive: true);
  await for (final entity in source.list(recursive: true, followLinks: false)) {
    final relative = entity.path.substring(source.path.length + 1);
    final destination = _join(target.path, relative);
    if (entity is Directory) {
      await Directory(destination).create(recursive: true);
    } else if (entity is File) {
      await File(destination).parent.create(recursive: true);
      await entity.copy(destination);
    }
  }
}

Future<void> _refreshManifest(Directory folder) async {
  final manifestFile = File(_join(folder.path, 'manifest.json'));
  final manifest =
      jsonDecode(await manifestFile.readAsString()) as Map<String, dynamic>;
  final old = (manifest['files'] as List<dynamic>).cast<Map>();
  final entries = <Map<String, Object>>[];
  for (final raw in old) {
    final relative = raw['path'] as String;
    final file = File(_safePath(folder, relative));
    final bytes = await file.readAsBytes();
    entries.add({
      'path': relative,
      'size': bytes.length,
      'sha256': sha256.convert(bytes).toString(),
    });
  }
  final portable = File(_join(folder.path, 'intervention_export.json'));
  final portableBytes = await portable.readAsBytes();
  entries.removeWhere((entry) => entry['path'] == 'intervention_export.json');
  entries.add({
    'path': 'intervention_export.json',
    'size': portableBytes.length,
    'sha256': sha256.convert(portableBytes).toString(),
  });
  entries.sort((a, b) => (a['path'] as String).compareTo(b['path'] as String));
  manifest['files'] = entries;
  manifest['generatedAt'] = DateTime.now().toUtc().toIso8601String();
  await manifestFile.writeAsString(
    const JsonEncoder.withIndent('  ').convert(manifest) + '\n',
    flush: true,
  );
}

String _safePath(Directory root, String relative) {
  final parts = relative.split('/');
  if (parts.any((part) => part.isEmpty || part == '.' || part == '..')) {
    throw FormatException('Ruta no válida en manifiesto: ' + relative);
  }
  return [root.path, ...parts].join(Platform.pathSeparator);
}

String _folderName(String code, String brand, String? calibre) {
  final raw = [
    code,
    brand,
    calibre?.trim().isEmpty ?? true ? 'sin_calibre' : calibre!,
  ].join('_');
  final clean = raw
      .replaceAll(RegExp('[áàäâÁÀÄÂ]'), 'a')
      .replaceAll(RegExp('[éèëêÉÈËÊ]'), 'e')
      .replaceAll(RegExp('[íìïîÍÌÏÎ]'), 'i')
      .replaceAll(RegExp('[óòöôÓÒÖÔ]'), 'o')
      .replaceAll(RegExp('[úùüûÚÙÜÛ]'), 'u')
      .replaceAll(RegExp('[ñÑ]'), 'n')
      .replaceAll(RegExp(r'[^A-Za-z0-9_-]+'), '_')
      .replaceAll(RegExp(r'_+'), '_');
  return clean.length > 80 ? clean.substring(0, 80) : clean;
}

String _join(String left, String right) => left.endsWith(Platform.pathSeparator)
    ? left + right
    : left + Platform.pathSeparator + right;
