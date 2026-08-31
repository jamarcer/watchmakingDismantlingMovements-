enum WatchType {
  manual('Manual'),
  automatic('Automático'),
  other('Otro');

  const WatchType(this.label);
  final String label;
}

enum InterventionStatus {
  draft('Borrador'),
  disassembly('En desmontaje'),
  review('Pendiente de revisión'),
  closed('Cerrada');

  const InterventionStatus(this.label);
  final String label;
}

enum DocumentState { pending, synchronized, error }

class Intervention {
  const Intervention({
    required this.id,
    required this.code,
    required this.brand,
    required this.modelReference,
    required this.calibre,
    required this.movementNumber,
    required this.watchType,
    required this.technician,
    required this.referenceOrientation,
    required this.initialState,
    required this.status,
    required this.documentState,
    required this.rootDocumentUri,
    required this.folderName,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.deletedBy,
  });

  final String id;
  final String code;
  final String brand;
  final String? modelReference;
  final String? calibre;
  final String? movementNumber;
  final WatchType watchType;
  final String technician;
  final String referenceOrientation;
  final String? initialState;
  final InterventionStatus status;
  final DocumentState documentState;
  final Uri rootDocumentUri;
  final String folderName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? deletedBy;
}

class DisassemblyOperation {
  const DisassemblyOperation({
    required this.id,
    required this.interventionId,
    required this.code,
    required this.sequence,
    required this.title,
    required this.status,
    required this.orientation,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.deletedBy,
  });

  final String id;
  final String interventionId;
  final String code;
  final int sequence;
  final String title;
  final String status;
  final String? orientation;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? deletedBy;
}

class InterventionDraft {
  const InterventionDraft({
    required this.brand,
    required this.modelReference,
    required this.calibre,
    required this.movementNumber,
    required this.watchType,
    required this.technician,
    required this.referenceOrientation,
    required this.initialState,
  });

  final String brand;
  final String? modelReference;
  final String? calibre;
  final String? movementNumber;
  final WatchType watchType;
  final String technician;
  final String referenceOrientation;
  final String? initialState;
}

class CreatedIntervention {
  const CreatedIntervention({
    required this.intervention,
    required this.firstOperation,
  });

  final Intervention intervention;
  final DisassemblyOperation firstOperation;
}

class TimelineEntry {
  const TimelineEntry({
    required this.when,
    required this.title,
    required this.detail,
    required this.kind,
    this.operationId,
  });
  final DateTime when;
  final String title;
  final String? detail;
  final String kind;
  final String? operationId;
}
