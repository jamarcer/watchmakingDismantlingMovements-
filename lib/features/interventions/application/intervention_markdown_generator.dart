import 'dart:convert';

import '../domain/intervention.dart';

class InterventionMarkdownGenerator {
  const InterventionMarkdownGenerator();

  String intervention(CreatedIntervention created) {
    final item = created.intervention;
    final operation = created.firstOperation;
    final lines = <String>[
      '---',
      'schema_version: 1',
      'document_type: intervention',
      'id: ' + _yaml(item.id),
      'code: ' + _yaml(item.code),
      'status: ' + _yaml(item.status.name),
      'brand: ' + _yaml(item.brand),
      'model_reference: ' + _yaml(item.modelReference ?? ''),
      'calibre: ' + _yaml(item.calibre ?? ''),
      'movement_number: ' + _yaml(item.movementNumber ?? ''),
      'watch_type: ' + _yaml(item.watchType.name),
      'technician: ' + _yaml(item.technician),
      'reference_orientation: ' + _yaml(item.referenceOrientation),
      'created_at: ' + _yaml(_date(item.createdAt)),
      'updated_at: ' + _yaml(_date(item.updatedAt)),
      '---',
      '',
      '# Ficha de desmontaje — ' + item.code,
      '',
      '## Identificación',
      '',
      '| Campo | Valor |',
      '|---|---|',
      '| Marca | ' + _cell(item.brand) + ' |',
      '| Modelo o referencia | ' + _cell(item.modelReference ?? '') + ' |',
      '| Calibre | ' + _cell(item.calibre ?? '') + ' |',
      '| Número de movimiento | ' + _cell(item.movementNumber ?? '') + ' |',
      '| Tipo | ' + _cell(item.watchType.label) + ' |',
      '| Técnico | ' + _cell(item.technician) + ' |',
      '| Orientación | ' + _cell(item.referenceOrientation) + ' |',
      '',
      '## Estado inicial',
      '',
      item.initialState?.trim() ?? '',
      '',
      '## Operaciones',
      '',
      '- [' +
          operation.code +
          ' — ' +
          operation.title +
          '](01_desmontaje/' +
          operation.code +
          '/' +
          operation.code +
          '.md)',
      '',
    ];
    return lines.join('\n');
  }

  String operation(CreatedIntervention created) {
    final item = created.intervention;
    final operation = created.firstOperation;
    final lines = <String>[
      '---',
      'schema_version: 1',
      'document_type: disassembly_operation',
      'intervention_id: ' + _yaml(item.id),
      'id: ' + _yaml(operation.id),
      'code: ' + _yaml(operation.code),
      'sequence: ' + operation.sequence.toString(),
      'status: "draft"',
      'tray: ""',
      'created_at: ' + _yaml(_date(operation.createdAt)),
      'updated_at: ' + _yaml(_date(operation.updatedAt)),
      '---',
      '',
      '# ' + operation.code + ' — ' + operation.title,
      '',
      '## Datos de operación',
      '',
      '| Campo | Valor |',
      '|---|---|',
      '| Orientación | ' + _cell(operation.orientation ?? '') + ' |',
      '| Bandeja |  |',
      '| Riesgo |  |',
      '',
      '## Fotografías',
      '',
      '- Antes: pendiente.',
      '- Anotada: pendiente.',
      '- Después: pendiente.',
      '- Piezas: pendiente.',
      '',
      '## Componentes',
      '',
      '| Código | Tipo | Descripción | Cantidad | Bandeja | Observaciones |',
      '|---|---|---|---:|---|---|',
      '',
    ];
    return lines.join('\n');
  }

  String _yaml(String value) => jsonEncode(value);

  String _cell(String value) =>
      value.replaceAll('|', r'\|').replaceAll(RegExp(r'[\r\n]+'), ' ');

  String _date(DateTime value) {
    final local = value.toLocal();
    final offset = local.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final base = local.toIso8601String().split('.').first;
    return base + sign + hours + ':' + minutes;
  }
}
