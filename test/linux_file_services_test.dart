import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fichas_desmontaje/core/platform/linux_file_services.dart';
import 'package:fichas_desmontaje/features/interventions/domain/intervention.dart';
import 'package:fichas_desmontaje/features/photos/domain/photo_asset.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

void main() {
  test('genera documentos, anotaciones e imagen con manifiesto compatible', () async {
    final temporary = await Directory.systemTemp.createTemp(
      'fichas_linux_test_',
    );
    addTearDown(() async {
      if (await temporary.exists()) await temporary.delete(recursive: true);
    });
    final interventions = Directory(
      '${temporary.path}${Platform.pathSeparator}intervenciones',
    );
    await interventions.create(recursive: true);
    final now = DateTime.utc(2026, 9, 2);
    final intervention = Intervention(
      id: 'intervention-1',
      code: 'I001',
      brand: 'Marca',
      modelReference: null,
      calibre: null,
      movementNumber: null,
      watchType: WatchType.manual,
      technician: 'Técnico',
      referenceOrientation: '12',
      initialState: null,
      status: InterventionStatus.draft,
      documentState: DocumentState.synchronized,
      rootDocumentUri: interventions.uri,
      folderName: 'I001_marca',
      createdAt: now,
      updatedAt: now,
    );
    final operation = DisassemblyOperation(
      id: 'operation-1',
      interventionId: intervention.id,
      code: 'D01',
      sequence: 1,
      title: 'Apertura',
      status: 'pending',
      orientation: null,
      createdAt: now,
      updatedAt: now,
    );
    const services = LinuxFileServices();
    await services.writeIntervention(
      created: CreatedIntervention(
        intervention: intervention,
        firstOperation: operation,
      ),
      interventionMarkdown: '# Ficha',
      operationMarkdown: '# D01',
    );
    await services.updateOperation(
      interventionsRoot: interventions.uri,
      interventionFolder: intervention.folderName,
      operationCode: operation.code,
      markdown: '# D01 actualizada',
    );
    await services.saveAnnotationDraft(
      root: interventions.uri,
      folder: intervention.folderName,
      operationCode: operation.code,
      sourceKind: OperationPhotoKind.after,
      json: '{"elements":[]}',
    );
    final png = Uint8List.fromList(
      img.encodePng(img.Image(width: 8, height: 6)),
    );
    final exported = await services.exportAnnotation(
      root: interventions.uri,
      folder: intervention.folderName,
      operationCode: operation.code,
      sourceKind: OperationPhotoKind.after,
      json: '{"elements":[]}',
      renderedPng: png,
    );

    final folder = Directory(
      '${interventions.path}${Platform.pathSeparator}${intervention.folderName}',
    );
    expect(
      await File(
        '${folder.path}${Platform.pathSeparator}01_desmontaje'
        '${Platform.pathSeparator}D01${Platform.pathSeparator}D01.md',
      ).readAsString(),
      '# D01 actualizada',
    );
    expect(exported.relativePath, '01_desmontaje/D01/D01_C_anotada.jpg');
    expect(await File(exported.thumbnailPath).exists(), isTrue);
    final manifest = jsonDecode(
      await File('${folder.path}${Platform.pathSeparator}manifest.json')
          .readAsString(),
    ) as Map<String, dynamic>;
    final paths = (manifest['files'] as List<dynamic>)
        .map((entry) => (entry as Map<String, dynamic>)['path'])
        .toSet();
    expect(paths, contains('ficha_intervencion.md'));
    expect(paths, contains('01_desmontaje/D01/D01.md'));
    expect(paths, contains('01_desmontaje/D01/D01_C_anotada.json'));
    expect(paths, contains('01_desmontaje/D01/D01_C_anotada.jpg'));
  });
}
