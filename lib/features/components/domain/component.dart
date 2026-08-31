enum ComponentType {
  part('P', 'Pieza'),
  screw('T', 'Tornillo'),
  wheel('R', 'Rueda'),
  spring('M', 'Muelle');

  const ComponentType(this.prefix, this.label);
  final String prefix;
  final String label;
}

class WatchComponent {
  const WatchComponent({
    required this.id,
    required this.interventionId,
    required this.operationId,
    required this.code,
    required this.type,
    required this.description,
    required this.quantity,
    required this.position,
    required this.orientation,
    required this.tray,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  final String id, interventionId, operationId, code, description, tray;
  final ComponentType type;
  final int quantity;
  final String? position, orientation, notes;
  final DateTime createdAt, updatedAt;
}

class ComponentDraft {
  const ComponentDraft({
    required this.type,
    required this.description,
    required this.quantity,
    required this.position,
    required this.orientation,
    required this.tray,
    required this.notes,
  });
  final ComponentType type;
  final String description, tray;
  final int quantity;
  final String? position, orientation, notes;
}

class OperationCompleteness {
  const OperationCompleteness({
    required this.hasTitle,
    required this.hasBeforePhoto,
    required this.hasAfterPhoto,
    required this.allComponentsLocated,
    required this.hasAnnotatedPhoto,
    required this.hasPartsPhoto,
  });
  final bool hasTitle,
      hasBeforePhoto,
      hasAfterPhoto,
      allComponentsLocated,
      hasAnnotatedPhoto,
      hasPartsPhoto;
  bool get canComplete =>
      hasTitle && hasBeforePhoto && hasAfterPhoto && allComponentsLocated;
  List<String> get blockers => [
    if (!hasTitle) 'Título de la operación',
    if (!hasBeforePhoto) 'Fotografía A · Antes',
    if (!hasAfterPhoto) 'Fotografía C · Después',
    if (!allComponentsLocated) 'Bandeja de todos los componentes',
  ];
  List<String> get recommendations => [
    if (!hasAnnotatedPhoto) 'Fotografía B · Anotada',
    if (!hasPartsPhoto) 'Fotografía D · Piezas',
  ];
}
