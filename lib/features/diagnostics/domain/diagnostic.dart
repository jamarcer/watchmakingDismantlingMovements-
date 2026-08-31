enum DiagnosticCategory {
  dryOil('Aceite seco'),
  excessOil('Exceso de lubricante'),
  dirt('Suciedad'),
  corrosion('Corrosión'),
  wornPivots('Pivotes desgastados'),
  damagedTeeth('Dientes o rubíes dañados'),
  play('Holguras'),
  wrongScrews('Tornillos incorrectos'),
  previousRepair('Reparaciones anteriores'),
  deformedParts('Piezas deformadas'),
  other('Otros');

  const DiagnosticCategory(this.label);
  final String label;
}

enum DiagnosticSeverity {
  info('Información'),
  low('Baja'),
  medium('Media'),
  high('Alta'),
  critical('Crítica');

  const DiagnosticSeverity(this.label);
  final String label;
}

enum CriticalSystem {
  balance('Volante y espiral'),
  escapement('Áncora'),
  train('Tren de rodaje'),
  barrel('Barrilete'),
  keyless('Remontoir y puesta en hora'),
  automatic('Sistema automático');

  const CriticalSystem(this.label);
  final String label;
}

class DiagnosticFinding {
  const DiagnosticFinding({
    required this.id,
    required this.interventionId,
    required this.operationId,
    required this.code,
    required this.zone,
    required this.category,
    required this.description,
    required this.severity,
    required this.photoAssetId,
    required this.proposedAction,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  final String id, interventionId, operationId, code, zone, description;
  final DiagnosticCategory category;
  final DiagnosticSeverity severity;
  final String? photoAssetId, proposedAction;
  final String status;
  final DateTime createdAt, updatedAt;
}

class DiagnosticDraft {
  const DiagnosticDraft({
    required this.zone,
    required this.category,
    required this.description,
    required this.severity,
    required this.photoAssetId,
    required this.proposedAction,
  });
  final String zone, description;
  final DiagnosticCategory category;
  final DiagnosticSeverity severity;
  final String? photoAssetId, proposedAction;
}

class CriticalItem {
  const CriticalItem({
    required this.id,
    required this.interventionId,
    required this.system,
    required this.itemCode,
    required this.label,
    required this.checked,
    required this.notes,
    required this.updatedAt,
  });
  final String id, interventionId, itemCode, label;
  final CriticalSystem system;
  final bool checked;
  final String? notes;
  final DateTime updatedAt;
}

class DiagnosticCompleteness {
  const DiagnosticCompleteness({
    required this.findings,
    required this.criticalItems,
  });
  final List<DiagnosticFinding> findings;
  final List<CriticalItem> criticalItems;
  int get findingsWithoutEvidence =>
      findings.where((f) => f.photoAssetId == null).length;
  int get pendingCriticalItems => criticalItems.where((i) => !i.checked).length;
}
