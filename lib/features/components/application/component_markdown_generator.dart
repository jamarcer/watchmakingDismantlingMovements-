import '../../interventions/domain/intervention.dart';
import '../../photos/domain/photo_asset.dart';
import '../../diagnostics/domain/diagnostic.dart';
import '../domain/component.dart';

class ComponentMarkdownGenerator {
  const ComponentMarkdownGenerator();
  String generate({
    required Intervention intervention,
    required DisassemblyOperation operation,
    required List<WatchComponent> components,
    required List<PhotoAsset> photos,
    required bool complete,
    List<DiagnosticFinding> findings = const [],
    List<CriticalItem> checklist = const [],
  }) {
    bool has(OperationPhotoKind k) => photos.any((p) => p.kind == k);
    String ph(OperationPhotoKind k, String l) => has(k)
        ? '- [$l](${k.fileNameFor(operation.code)})'
        : '- $l: pendiente.';
    final annotated = photos
        .where((photo) => photo.kind == OperationPhotoKind.annotated)
        .toList();
    String cell(String v) =>
        v.replaceAll('|', r'\|').replaceAll(RegExp(r'[\r\n]+'), ' ');
    final lines = <String>[
      '---',
      'schema_version: 1',
      'document_type: disassembly_operation',
      'intervention_id: "${intervention.id}"',
      'id: "${operation.id}"',
      'code: "${operation.code}"',
      'sequence: ${operation.sequence}',
      'status: "${complete ? 'complete' : 'draft'}"',
      'tray: "${cell(components.isEmpty ? '' : components.first.tray)}"',
      'created_at: "${operation.createdAt.toIso8601String()}"',
      'updated_at: "${DateTime.now().toIso8601String()}"',
      '---',
      '',
      '# ${operation.code} — ${operation.title}',
      '',
      '## Datos de operación',
      '',
      '| Campo | Valor |',
      '|---|---|',
      '| Orientación | ${cell(operation.orientation ?? '')} |',
      '| Bandeja | ${cell(components.isEmpty ? '' : components.first.tray)} |',
      '| Riesgo |  |',
      '',
      '## Fotografías',
      '',
      ph(OperationPhotoKind.before, 'Antes'),
      if (annotated.isEmpty)
        '- Anotada: pendiente.'
      else
        ...annotated.map(
          (photo) => '- [Anotada](' + photo.relativePath.split('/').last + ')',
        ),
      ph(OperationPhotoKind.after, 'Después'),
      ph(OperationPhotoKind.parts, 'Piezas'),
      '',
      '## Componentes',
      '',
      '| Código | Tipo | Descripción | Cantidad | Bandeja | Observaciones |',
      '|---|---|---|---:|---|---|',
      ...components.map(
        (c) =>
            '| ${c.code} | ${c.type.label} | ${cell(c.description)} | ${c.quantity} | ${cell(c.tray)} | ${cell(c.notes ?? '')} |',
      ),
      '',
    ];
    if (findings.isNotEmpty) {
      lines.addAll([
        '## Diagnóstico',
        '',
        '| Código | Zona | Categoría | Gravedad | Descripción | Evidencia | Acción |',
        '|---|---|---|---|---|---|---|',
        ...findings.map(
          (f) =>
              '| ${f.code} | ${cell(f.zone)} | ${f.category.label} | ${f.severity.label} | ${cell(f.description)} | ${f.photoAssetId == null ? 'Pendiente' : 'Adjunta'} | ${cell(f.proposedAction ?? '')} |',
        ),
        '',
      ]);
    }
    if (checklist.isNotEmpty) {
      lines.addAll([
        '## Controles críticos',
        '',
        '| Sistema | Elemento | Estado |',
        '|---|---|---|',
        ...checklist.map(
          (i) =>
              '| ${i.system.label} | ${cell(i.label)} | ${i.checked ? 'OK' : 'Pendiente'} |',
        ),
        '',
      ]);
    }
    return lines.join('\n');
  }
}
