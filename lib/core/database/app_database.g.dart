// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $InterventionsTable extends Interventions
    with TableInfo<$InterventionsTable, Intervention> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterventionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelReferenceMeta = const VerificationMeta(
    'modelReference',
  );
  @override
  late final GeneratedColumn<String> modelReference = GeneratedColumn<String>(
    'model_reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calibreMeta = const VerificationMeta(
    'calibre',
  );
  @override
  late final GeneratedColumn<String> calibre = GeneratedColumn<String>(
    'calibre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _movementNumberMeta = const VerificationMeta(
    'movementNumber',
  );
  @override
  late final GeneratedColumn<String> movementNumber = GeneratedColumn<String>(
    'movement_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _watchTypeMeta = const VerificationMeta(
    'watchType',
  );
  @override
  late final GeneratedColumn<String> watchType = GeneratedColumn<String>(
    'watch_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _technicianMeta = const VerificationMeta(
    'technician',
  );
  @override
  late final GeneratedColumn<String> technician = GeneratedColumn<String>(
    'technician',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceOrientationMeta =
      const VerificationMeta('referenceOrientation');
  @override
  late final GeneratedColumn<String> referenceOrientation =
      GeneratedColumn<String>(
        'reference_orientation',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _initialStateMeta = const VerificationMeta(
    'initialState',
  );
  @override
  late final GeneratedColumn<String> initialState = GeneratedColumn<String>(
    'initial_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentStateMeta = const VerificationMeta(
    'documentState',
  );
  @override
  late final GeneratedColumn<String> documentState = GeneratedColumn<String>(
    'document_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rootDocumentUriMeta = const VerificationMeta(
    'rootDocumentUri',
  );
  @override
  late final GeneratedColumn<String> rootDocumentUri = GeneratedColumn<String>(
    'root_document_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _folderNameMeta = const VerificationMeta(
    'folderName',
  );
  @override
  late final GeneratedColumn<String> folderName = GeneratedColumn<String>(
    'folder_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextOperationNumberMeta =
      const VerificationMeta('nextOperationNumber');
  @override
  late final GeneratedColumn<int> nextOperationNumber = GeneratedColumn<int>(
    'next_operation_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  static const VerificationMeta _nextPartNumberMeta = const VerificationMeta(
    'nextPartNumber',
  );
  @override
  late final GeneratedColumn<int> nextPartNumber = GeneratedColumn<int>(
    'next_part_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nextScrewNumberMeta = const VerificationMeta(
    'nextScrewNumber',
  );
  @override
  late final GeneratedColumn<int> nextScrewNumber = GeneratedColumn<int>(
    'next_screw_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nextWheelNumberMeta = const VerificationMeta(
    'nextWheelNumber',
  );
  @override
  late final GeneratedColumn<int> nextWheelNumber = GeneratedColumn<int>(
    'next_wheel_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nextSpringNumberMeta = const VerificationMeta(
    'nextSpringNumber',
  );
  @override
  late final GeneratedColumn<int> nextSpringNumber = GeneratedColumn<int>(
    'next_spring_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedByMeta = const VerificationMeta(
    'deletedBy',
  );
  @override
  late final GeneratedColumn<String> deletedBy = GeneratedColumn<String>(
    'deleted_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    brand,
    modelReference,
    calibre,
    movementNumber,
    watchType,
    technician,
    referenceOrientation,
    initialState,
    status,
    documentState,
    rootDocumentUri,
    folderName,
    nextOperationNumber,
    nextPartNumber,
    nextScrewNumber,
    nextWheelNumber,
    nextSpringNumber,
    createdAt,
    updatedAt,
    deletedAt,
    deletedBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interventions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Intervention> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('model_reference')) {
      context.handle(
        _modelReferenceMeta,
        modelReference.isAcceptableOrUnknown(
          data['model_reference']!,
          _modelReferenceMeta,
        ),
      );
    }
    if (data.containsKey('calibre')) {
      context.handle(
        _calibreMeta,
        calibre.isAcceptableOrUnknown(data['calibre']!, _calibreMeta),
      );
    }
    if (data.containsKey('movement_number')) {
      context.handle(
        _movementNumberMeta,
        movementNumber.isAcceptableOrUnknown(
          data['movement_number']!,
          _movementNumberMeta,
        ),
      );
    }
    if (data.containsKey('watch_type')) {
      context.handle(
        _watchTypeMeta,
        watchType.isAcceptableOrUnknown(data['watch_type']!, _watchTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_watchTypeMeta);
    }
    if (data.containsKey('technician')) {
      context.handle(
        _technicianMeta,
        technician.isAcceptableOrUnknown(data['technician']!, _technicianMeta),
      );
    } else if (isInserting) {
      context.missing(_technicianMeta);
    }
    if (data.containsKey('reference_orientation')) {
      context.handle(
        _referenceOrientationMeta,
        referenceOrientation.isAcceptableOrUnknown(
          data['reference_orientation']!,
          _referenceOrientationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_referenceOrientationMeta);
    }
    if (data.containsKey('initial_state')) {
      context.handle(
        _initialStateMeta,
        initialState.isAcceptableOrUnknown(
          data['initial_state']!,
          _initialStateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('document_state')) {
      context.handle(
        _documentStateMeta,
        documentState.isAcceptableOrUnknown(
          data['document_state']!,
          _documentStateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_documentStateMeta);
    }
    if (data.containsKey('root_document_uri')) {
      context.handle(
        _rootDocumentUriMeta,
        rootDocumentUri.isAcceptableOrUnknown(
          data['root_document_uri']!,
          _rootDocumentUriMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rootDocumentUriMeta);
    }
    if (data.containsKey('folder_name')) {
      context.handle(
        _folderNameMeta,
        folderName.isAcceptableOrUnknown(data['folder_name']!, _folderNameMeta),
      );
    } else if (isInserting) {
      context.missing(_folderNameMeta);
    }
    if (data.containsKey('next_operation_number')) {
      context.handle(
        _nextOperationNumberMeta,
        nextOperationNumber.isAcceptableOrUnknown(
          data['next_operation_number']!,
          _nextOperationNumberMeta,
        ),
      );
    }
    if (data.containsKey('next_part_number')) {
      context.handle(
        _nextPartNumberMeta,
        nextPartNumber.isAcceptableOrUnknown(
          data['next_part_number']!,
          _nextPartNumberMeta,
        ),
      );
    }
    if (data.containsKey('next_screw_number')) {
      context.handle(
        _nextScrewNumberMeta,
        nextScrewNumber.isAcceptableOrUnknown(
          data['next_screw_number']!,
          _nextScrewNumberMeta,
        ),
      );
    }
    if (data.containsKey('next_wheel_number')) {
      context.handle(
        _nextWheelNumberMeta,
        nextWheelNumber.isAcceptableOrUnknown(
          data['next_wheel_number']!,
          _nextWheelNumberMeta,
        ),
      );
    }
    if (data.containsKey('next_spring_number')) {
      context.handle(
        _nextSpringNumberMeta,
        nextSpringNumber.isAcceptableOrUnknown(
          data['next_spring_number']!,
          _nextSpringNumberMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('deleted_by')) {
      context.handle(
        _deletedByMeta,
        deletedBy.isAcceptableOrUnknown(data['deleted_by']!, _deletedByMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Intervention map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Intervention(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      )!,
      modelReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_reference'],
      ),
      calibre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calibre'],
      ),
      movementNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}movement_number'],
      ),
      watchType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}watch_type'],
      )!,
      technician: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}technician'],
      )!,
      referenceOrientation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_orientation'],
      )!,
      initialState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}initial_state'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      documentState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_state'],
      )!,
      rootDocumentUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}root_document_uri'],
      )!,
      folderName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}folder_name'],
      )!,
      nextOperationNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_operation_number'],
      )!,
      nextPartNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_part_number'],
      )!,
      nextScrewNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_screw_number'],
      )!,
      nextWheelNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_wheel_number'],
      )!,
      nextSpringNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_spring_number'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      deletedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_by'],
      ),
    );
  }

  @override
  $InterventionsTable createAlias(String alias) {
    return $InterventionsTable(attachedDatabase, alias);
  }
}

class Intervention extends DataClass implements Insertable<Intervention> {
  final String id;
  final String code;
  final String brand;
  final String? modelReference;
  final String? calibre;
  final String? movementNumber;
  final String watchType;
  final String technician;
  final String referenceOrientation;
  final String? initialState;
  final String status;
  final String documentState;
  final String rootDocumentUri;
  final String folderName;
  final int nextOperationNumber;
  final int nextPartNumber;
  final int nextScrewNumber;
  final int nextWheelNumber;
  final int nextSpringNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? deletedBy;
  const Intervention({
    required this.id,
    required this.code,
    required this.brand,
    this.modelReference,
    this.calibre,
    this.movementNumber,
    required this.watchType,
    required this.technician,
    required this.referenceOrientation,
    this.initialState,
    required this.status,
    required this.documentState,
    required this.rootDocumentUri,
    required this.folderName,
    required this.nextOperationNumber,
    required this.nextPartNumber,
    required this.nextScrewNumber,
    required this.nextWheelNumber,
    required this.nextSpringNumber,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.deletedBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['brand'] = Variable<String>(brand);
    if (!nullToAbsent || modelReference != null) {
      map['model_reference'] = Variable<String>(modelReference);
    }
    if (!nullToAbsent || calibre != null) {
      map['calibre'] = Variable<String>(calibre);
    }
    if (!nullToAbsent || movementNumber != null) {
      map['movement_number'] = Variable<String>(movementNumber);
    }
    map['watch_type'] = Variable<String>(watchType);
    map['technician'] = Variable<String>(technician);
    map['reference_orientation'] = Variable<String>(referenceOrientation);
    if (!nullToAbsent || initialState != null) {
      map['initial_state'] = Variable<String>(initialState);
    }
    map['status'] = Variable<String>(status);
    map['document_state'] = Variable<String>(documentState);
    map['root_document_uri'] = Variable<String>(rootDocumentUri);
    map['folder_name'] = Variable<String>(folderName);
    map['next_operation_number'] = Variable<int>(nextOperationNumber);
    map['next_part_number'] = Variable<int>(nextPartNumber);
    map['next_screw_number'] = Variable<int>(nextScrewNumber);
    map['next_wheel_number'] = Variable<int>(nextWheelNumber);
    map['next_spring_number'] = Variable<int>(nextSpringNumber);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    return map;
  }

  InterventionsCompanion toCompanion(bool nullToAbsent) {
    return InterventionsCompanion(
      id: Value(id),
      code: Value(code),
      brand: Value(brand),
      modelReference: modelReference == null && nullToAbsent
          ? const Value.absent()
          : Value(modelReference),
      calibre: calibre == null && nullToAbsent
          ? const Value.absent()
          : Value(calibre),
      movementNumber: movementNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(movementNumber),
      watchType: Value(watchType),
      technician: Value(technician),
      referenceOrientation: Value(referenceOrientation),
      initialState: initialState == null && nullToAbsent
          ? const Value.absent()
          : Value(initialState),
      status: Value(status),
      documentState: Value(documentState),
      rootDocumentUri: Value(rootDocumentUri),
      folderName: Value(folderName),
      nextOperationNumber: Value(nextOperationNumber),
      nextPartNumber: Value(nextPartNumber),
      nextScrewNumber: Value(nextScrewNumber),
      nextWheelNumber: Value(nextWheelNumber),
      nextSpringNumber: Value(nextSpringNumber),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
    );
  }

  factory Intervention.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Intervention(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      brand: serializer.fromJson<String>(json['brand']),
      modelReference: serializer.fromJson<String?>(json['modelReference']),
      calibre: serializer.fromJson<String?>(json['calibre']),
      movementNumber: serializer.fromJson<String?>(json['movementNumber']),
      watchType: serializer.fromJson<String>(json['watchType']),
      technician: serializer.fromJson<String>(json['technician']),
      referenceOrientation: serializer.fromJson<String>(
        json['referenceOrientation'],
      ),
      initialState: serializer.fromJson<String?>(json['initialState']),
      status: serializer.fromJson<String>(json['status']),
      documentState: serializer.fromJson<String>(json['documentState']),
      rootDocumentUri: serializer.fromJson<String>(json['rootDocumentUri']),
      folderName: serializer.fromJson<String>(json['folderName']),
      nextOperationNumber: serializer.fromJson<int>(
        json['nextOperationNumber'],
      ),
      nextPartNumber: serializer.fromJson<int>(json['nextPartNumber']),
      nextScrewNumber: serializer.fromJson<int>(json['nextScrewNumber']),
      nextWheelNumber: serializer.fromJson<int>(json['nextWheelNumber']),
      nextSpringNumber: serializer.fromJson<int>(json['nextSpringNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      deletedBy: serializer.fromJson<String?>(json['deletedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'brand': serializer.toJson<String>(brand),
      'modelReference': serializer.toJson<String?>(modelReference),
      'calibre': serializer.toJson<String?>(calibre),
      'movementNumber': serializer.toJson<String?>(movementNumber),
      'watchType': serializer.toJson<String>(watchType),
      'technician': serializer.toJson<String>(technician),
      'referenceOrientation': serializer.toJson<String>(referenceOrientation),
      'initialState': serializer.toJson<String?>(initialState),
      'status': serializer.toJson<String>(status),
      'documentState': serializer.toJson<String>(documentState),
      'rootDocumentUri': serializer.toJson<String>(rootDocumentUri),
      'folderName': serializer.toJson<String>(folderName),
      'nextOperationNumber': serializer.toJson<int>(nextOperationNumber),
      'nextPartNumber': serializer.toJson<int>(nextPartNumber),
      'nextScrewNumber': serializer.toJson<int>(nextScrewNumber),
      'nextWheelNumber': serializer.toJson<int>(nextWheelNumber),
      'nextSpringNumber': serializer.toJson<int>(nextSpringNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'deletedBy': serializer.toJson<String?>(deletedBy),
    };
  }

  Intervention copyWith({
    String? id,
    String? code,
    String? brand,
    Value<String?> modelReference = const Value.absent(),
    Value<String?> calibre = const Value.absent(),
    Value<String?> movementNumber = const Value.absent(),
    String? watchType,
    String? technician,
    String? referenceOrientation,
    Value<String?> initialState = const Value.absent(),
    String? status,
    String? documentState,
    String? rootDocumentUri,
    String? folderName,
    int? nextOperationNumber,
    int? nextPartNumber,
    int? nextScrewNumber,
    int? nextWheelNumber,
    int? nextSpringNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> deletedBy = const Value.absent(),
  }) => Intervention(
    id: id ?? this.id,
    code: code ?? this.code,
    brand: brand ?? this.brand,
    modelReference: modelReference.present
        ? modelReference.value
        : this.modelReference,
    calibre: calibre.present ? calibre.value : this.calibre,
    movementNumber: movementNumber.present
        ? movementNumber.value
        : this.movementNumber,
    watchType: watchType ?? this.watchType,
    technician: technician ?? this.technician,
    referenceOrientation: referenceOrientation ?? this.referenceOrientation,
    initialState: initialState.present ? initialState.value : this.initialState,
    status: status ?? this.status,
    documentState: documentState ?? this.documentState,
    rootDocumentUri: rootDocumentUri ?? this.rootDocumentUri,
    folderName: folderName ?? this.folderName,
    nextOperationNumber: nextOperationNumber ?? this.nextOperationNumber,
    nextPartNumber: nextPartNumber ?? this.nextPartNumber,
    nextScrewNumber: nextScrewNumber ?? this.nextScrewNumber,
    nextWheelNumber: nextWheelNumber ?? this.nextWheelNumber,
    nextSpringNumber: nextSpringNumber ?? this.nextSpringNumber,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    deletedBy: deletedBy.present ? deletedBy.value : this.deletedBy,
  );
  Intervention copyWithCompanion(InterventionsCompanion data) {
    return Intervention(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      brand: data.brand.present ? data.brand.value : this.brand,
      modelReference: data.modelReference.present
          ? data.modelReference.value
          : this.modelReference,
      calibre: data.calibre.present ? data.calibre.value : this.calibre,
      movementNumber: data.movementNumber.present
          ? data.movementNumber.value
          : this.movementNumber,
      watchType: data.watchType.present ? data.watchType.value : this.watchType,
      technician: data.technician.present
          ? data.technician.value
          : this.technician,
      referenceOrientation: data.referenceOrientation.present
          ? data.referenceOrientation.value
          : this.referenceOrientation,
      initialState: data.initialState.present
          ? data.initialState.value
          : this.initialState,
      status: data.status.present ? data.status.value : this.status,
      documentState: data.documentState.present
          ? data.documentState.value
          : this.documentState,
      rootDocumentUri: data.rootDocumentUri.present
          ? data.rootDocumentUri.value
          : this.rootDocumentUri,
      folderName: data.folderName.present
          ? data.folderName.value
          : this.folderName,
      nextOperationNumber: data.nextOperationNumber.present
          ? data.nextOperationNumber.value
          : this.nextOperationNumber,
      nextPartNumber: data.nextPartNumber.present
          ? data.nextPartNumber.value
          : this.nextPartNumber,
      nextScrewNumber: data.nextScrewNumber.present
          ? data.nextScrewNumber.value
          : this.nextScrewNumber,
      nextWheelNumber: data.nextWheelNumber.present
          ? data.nextWheelNumber.value
          : this.nextWheelNumber,
      nextSpringNumber: data.nextSpringNumber.present
          ? data.nextSpringNumber.value
          : this.nextSpringNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      deletedBy: data.deletedBy.present ? data.deletedBy.value : this.deletedBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Intervention(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('brand: $brand, ')
          ..write('modelReference: $modelReference, ')
          ..write('calibre: $calibre, ')
          ..write('movementNumber: $movementNumber, ')
          ..write('watchType: $watchType, ')
          ..write('technician: $technician, ')
          ..write('referenceOrientation: $referenceOrientation, ')
          ..write('initialState: $initialState, ')
          ..write('status: $status, ')
          ..write('documentState: $documentState, ')
          ..write('rootDocumentUri: $rootDocumentUri, ')
          ..write('folderName: $folderName, ')
          ..write('nextOperationNumber: $nextOperationNumber, ')
          ..write('nextPartNumber: $nextPartNumber, ')
          ..write('nextScrewNumber: $nextScrewNumber, ')
          ..write('nextWheelNumber: $nextWheelNumber, ')
          ..write('nextSpringNumber: $nextSpringNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('deletedBy: $deletedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    code,
    brand,
    modelReference,
    calibre,
    movementNumber,
    watchType,
    technician,
    referenceOrientation,
    initialState,
    status,
    documentState,
    rootDocumentUri,
    folderName,
    nextOperationNumber,
    nextPartNumber,
    nextScrewNumber,
    nextWheelNumber,
    nextSpringNumber,
    createdAt,
    updatedAt,
    deletedAt,
    deletedBy,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Intervention &&
          other.id == this.id &&
          other.code == this.code &&
          other.brand == this.brand &&
          other.modelReference == this.modelReference &&
          other.calibre == this.calibre &&
          other.movementNumber == this.movementNumber &&
          other.watchType == this.watchType &&
          other.technician == this.technician &&
          other.referenceOrientation == this.referenceOrientation &&
          other.initialState == this.initialState &&
          other.status == this.status &&
          other.documentState == this.documentState &&
          other.rootDocumentUri == this.rootDocumentUri &&
          other.folderName == this.folderName &&
          other.nextOperationNumber == this.nextOperationNumber &&
          other.nextPartNumber == this.nextPartNumber &&
          other.nextScrewNumber == this.nextScrewNumber &&
          other.nextWheelNumber == this.nextWheelNumber &&
          other.nextSpringNumber == this.nextSpringNumber &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.deletedBy == this.deletedBy);
}

class InterventionsCompanion extends UpdateCompanion<Intervention> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> brand;
  final Value<String?> modelReference;
  final Value<String?> calibre;
  final Value<String?> movementNumber;
  final Value<String> watchType;
  final Value<String> technician;
  final Value<String> referenceOrientation;
  final Value<String?> initialState;
  final Value<String> status;
  final Value<String> documentState;
  final Value<String> rootDocumentUri;
  final Value<String> folderName;
  final Value<int> nextOperationNumber;
  final Value<int> nextPartNumber;
  final Value<int> nextScrewNumber;
  final Value<int> nextWheelNumber;
  final Value<int> nextSpringNumber;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> deletedBy;
  final Value<int> rowid;
  const InterventionsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.brand = const Value.absent(),
    this.modelReference = const Value.absent(),
    this.calibre = const Value.absent(),
    this.movementNumber = const Value.absent(),
    this.watchType = const Value.absent(),
    this.technician = const Value.absent(),
    this.referenceOrientation = const Value.absent(),
    this.initialState = const Value.absent(),
    this.status = const Value.absent(),
    this.documentState = const Value.absent(),
    this.rootDocumentUri = const Value.absent(),
    this.folderName = const Value.absent(),
    this.nextOperationNumber = const Value.absent(),
    this.nextPartNumber = const Value.absent(),
    this.nextScrewNumber = const Value.absent(),
    this.nextWheelNumber = const Value.absent(),
    this.nextSpringNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InterventionsCompanion.insert({
    required String id,
    required String code,
    required String brand,
    this.modelReference = const Value.absent(),
    this.calibre = const Value.absent(),
    this.movementNumber = const Value.absent(),
    required String watchType,
    required String technician,
    required String referenceOrientation,
    this.initialState = const Value.absent(),
    required String status,
    required String documentState,
    required String rootDocumentUri,
    required String folderName,
    this.nextOperationNumber = const Value.absent(),
    this.nextPartNumber = const Value.absent(),
    this.nextScrewNumber = const Value.absent(),
    this.nextWheelNumber = const Value.absent(),
    this.nextSpringNumber = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       brand = Value(brand),
       watchType = Value(watchType),
       technician = Value(technician),
       referenceOrientation = Value(referenceOrientation),
       status = Value(status),
       documentState = Value(documentState),
       rootDocumentUri = Value(rootDocumentUri),
       folderName = Value(folderName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Intervention> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? brand,
    Expression<String>? modelReference,
    Expression<String>? calibre,
    Expression<String>? movementNumber,
    Expression<String>? watchType,
    Expression<String>? technician,
    Expression<String>? referenceOrientation,
    Expression<String>? initialState,
    Expression<String>? status,
    Expression<String>? documentState,
    Expression<String>? rootDocumentUri,
    Expression<String>? folderName,
    Expression<int>? nextOperationNumber,
    Expression<int>? nextPartNumber,
    Expression<int>? nextScrewNumber,
    Expression<int>? nextWheelNumber,
    Expression<int>? nextSpringNumber,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? deletedBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (brand != null) 'brand': brand,
      if (modelReference != null) 'model_reference': modelReference,
      if (calibre != null) 'calibre': calibre,
      if (movementNumber != null) 'movement_number': movementNumber,
      if (watchType != null) 'watch_type': watchType,
      if (technician != null) 'technician': technician,
      if (referenceOrientation != null)
        'reference_orientation': referenceOrientation,
      if (initialState != null) 'initial_state': initialState,
      if (status != null) 'status': status,
      if (documentState != null) 'document_state': documentState,
      if (rootDocumentUri != null) 'root_document_uri': rootDocumentUri,
      if (folderName != null) 'folder_name': folderName,
      if (nextOperationNumber != null)
        'next_operation_number': nextOperationNumber,
      if (nextPartNumber != null) 'next_part_number': nextPartNumber,
      if (nextScrewNumber != null) 'next_screw_number': nextScrewNumber,
      if (nextWheelNumber != null) 'next_wheel_number': nextWheelNumber,
      if (nextSpringNumber != null) 'next_spring_number': nextSpringNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InterventionsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? brand,
    Value<String?>? modelReference,
    Value<String?>? calibre,
    Value<String?>? movementNumber,
    Value<String>? watchType,
    Value<String>? technician,
    Value<String>? referenceOrientation,
    Value<String?>? initialState,
    Value<String>? status,
    Value<String>? documentState,
    Value<String>? rootDocumentUri,
    Value<String>? folderName,
    Value<int>? nextOperationNumber,
    Value<int>? nextPartNumber,
    Value<int>? nextScrewNumber,
    Value<int>? nextWheelNumber,
    Value<int>? nextSpringNumber,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? deletedBy,
    Value<int>? rowid,
  }) {
    return InterventionsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      brand: brand ?? this.brand,
      modelReference: modelReference ?? this.modelReference,
      calibre: calibre ?? this.calibre,
      movementNumber: movementNumber ?? this.movementNumber,
      watchType: watchType ?? this.watchType,
      technician: technician ?? this.technician,
      referenceOrientation: referenceOrientation ?? this.referenceOrientation,
      initialState: initialState ?? this.initialState,
      status: status ?? this.status,
      documentState: documentState ?? this.documentState,
      rootDocumentUri: rootDocumentUri ?? this.rootDocumentUri,
      folderName: folderName ?? this.folderName,
      nextOperationNumber: nextOperationNumber ?? this.nextOperationNumber,
      nextPartNumber: nextPartNumber ?? this.nextPartNumber,
      nextScrewNumber: nextScrewNumber ?? this.nextScrewNumber,
      nextWheelNumber: nextWheelNumber ?? this.nextWheelNumber,
      nextSpringNumber: nextSpringNumber ?? this.nextSpringNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      deletedBy: deletedBy ?? this.deletedBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (modelReference.present) {
      map['model_reference'] = Variable<String>(modelReference.value);
    }
    if (calibre.present) {
      map['calibre'] = Variable<String>(calibre.value);
    }
    if (movementNumber.present) {
      map['movement_number'] = Variable<String>(movementNumber.value);
    }
    if (watchType.present) {
      map['watch_type'] = Variable<String>(watchType.value);
    }
    if (technician.present) {
      map['technician'] = Variable<String>(technician.value);
    }
    if (referenceOrientation.present) {
      map['reference_orientation'] = Variable<String>(
        referenceOrientation.value,
      );
    }
    if (initialState.present) {
      map['initial_state'] = Variable<String>(initialState.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (documentState.present) {
      map['document_state'] = Variable<String>(documentState.value);
    }
    if (rootDocumentUri.present) {
      map['root_document_uri'] = Variable<String>(rootDocumentUri.value);
    }
    if (folderName.present) {
      map['folder_name'] = Variable<String>(folderName.value);
    }
    if (nextOperationNumber.present) {
      map['next_operation_number'] = Variable<int>(nextOperationNumber.value);
    }
    if (nextPartNumber.present) {
      map['next_part_number'] = Variable<int>(nextPartNumber.value);
    }
    if (nextScrewNumber.present) {
      map['next_screw_number'] = Variable<int>(nextScrewNumber.value);
    }
    if (nextWheelNumber.present) {
      map['next_wheel_number'] = Variable<int>(nextWheelNumber.value);
    }
    if (nextSpringNumber.present) {
      map['next_spring_number'] = Variable<int>(nextSpringNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterventionsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('brand: $brand, ')
          ..write('modelReference: $modelReference, ')
          ..write('calibre: $calibre, ')
          ..write('movementNumber: $movementNumber, ')
          ..write('watchType: $watchType, ')
          ..write('technician: $technician, ')
          ..write('referenceOrientation: $referenceOrientation, ')
          ..write('initialState: $initialState, ')
          ..write('status: $status, ')
          ..write('documentState: $documentState, ')
          ..write('rootDocumentUri: $rootDocumentUri, ')
          ..write('folderName: $folderName, ')
          ..write('nextOperationNumber: $nextOperationNumber, ')
          ..write('nextPartNumber: $nextPartNumber, ')
          ..write('nextScrewNumber: $nextScrewNumber, ')
          ..write('nextWheelNumber: $nextWheelNumber, ')
          ..write('nextSpringNumber: $nextSpringNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DisassemblyOperationsTable extends DisassemblyOperations
    with TableInfo<$DisassemblyOperationsTable, DisassemblyOperation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DisassemblyOperationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sequenceMeta = const VerificationMeta(
    'sequence',
  );
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
    'sequence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _systemMeta = const VerificationMeta('system');
  @override
  late final GeneratedColumn<String> system = GeneratedColumn<String>(
    'system',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trayMeta = const VerificationMeta('tray');
  @override
  late final GeneratedColumn<String> tray = GeneratedColumn<String>(
    'tray',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orientationMeta = const VerificationMeta(
    'orientation',
  );
  @override
  late final GeneratedColumn<String> orientation = GeneratedColumn<String>(
    'orientation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedByMeta = const VerificationMeta(
    'deletedBy',
  );
  @override
  late final GeneratedColumn<String> deletedBy = GeneratedColumn<String>(
    'deleted_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    code,
    sequence,
    title,
    system,
    description,
    tray,
    orientation,
    notes,
    status,
    createdAt,
    updatedAt,
    deletedAt,
    deletedBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'disassembly_operations';
  @override
  VerificationContext validateIntegrity(
    Insertable<DisassemblyOperation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('sequence')) {
      context.handle(
        _sequenceMeta,
        sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta),
      );
    } else if (isInserting) {
      context.missing(_sequenceMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('system')) {
      context.handle(
        _systemMeta,
        system.isAcceptableOrUnknown(data['system']!, _systemMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('tray')) {
      context.handle(
        _trayMeta,
        tray.isAcceptableOrUnknown(data['tray']!, _trayMeta),
      );
    }
    if (data.containsKey('orientation')) {
      context.handle(
        _orientationMeta,
        orientation.isAcceptableOrUnknown(
          data['orientation']!,
          _orientationMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('deleted_by')) {
      context.handle(
        _deletedByMeta,
        deletedBy.isAcceptableOrUnknown(data['deleted_by']!, _deletedByMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DisassemblyOperation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DisassemblyOperation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      sequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      system: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}system'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      tray: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tray'],
      ),
      orientation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}orientation'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      deletedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_by'],
      ),
    );
  }

  @override
  $DisassemblyOperationsTable createAlias(String alias) {
    return $DisassemblyOperationsTable(attachedDatabase, alias);
  }
}

class DisassemblyOperation extends DataClass
    implements Insertable<DisassemblyOperation> {
  final String id;
  final String interventionId;
  final String code;
  final int sequence;
  final String title;
  final String? system;
  final String? description;
  final String? tray;
  final String? orientation;
  final String? notes;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? deletedBy;
  const DisassemblyOperation({
    required this.id,
    required this.interventionId,
    required this.code,
    required this.sequence,
    required this.title,
    this.system,
    this.description,
    this.tray,
    this.orientation,
    this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.deletedBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['code'] = Variable<String>(code);
    map['sequence'] = Variable<int>(sequence);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || system != null) {
      map['system'] = Variable<String>(system);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || tray != null) {
      map['tray'] = Variable<String>(tray);
    }
    if (!nullToAbsent || orientation != null) {
      map['orientation'] = Variable<String>(orientation);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    return map;
  }

  DisassemblyOperationsCompanion toCompanion(bool nullToAbsent) {
    return DisassemblyOperationsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      code: Value(code),
      sequence: Value(sequence),
      title: Value(title),
      system: system == null && nullToAbsent
          ? const Value.absent()
          : Value(system),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      tray: tray == null && nullToAbsent ? const Value.absent() : Value(tray),
      orientation: orientation == null && nullToAbsent
          ? const Value.absent()
          : Value(orientation),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
    );
  }

  factory DisassemblyOperation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DisassemblyOperation(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      code: serializer.fromJson<String>(json['code']),
      sequence: serializer.fromJson<int>(json['sequence']),
      title: serializer.fromJson<String>(json['title']),
      system: serializer.fromJson<String?>(json['system']),
      description: serializer.fromJson<String?>(json['description']),
      tray: serializer.fromJson<String?>(json['tray']),
      orientation: serializer.fromJson<String?>(json['orientation']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      deletedBy: serializer.fromJson<String?>(json['deletedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'code': serializer.toJson<String>(code),
      'sequence': serializer.toJson<int>(sequence),
      'title': serializer.toJson<String>(title),
      'system': serializer.toJson<String?>(system),
      'description': serializer.toJson<String?>(description),
      'tray': serializer.toJson<String?>(tray),
      'orientation': serializer.toJson<String?>(orientation),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'deletedBy': serializer.toJson<String?>(deletedBy),
    };
  }

  DisassemblyOperation copyWith({
    String? id,
    String? interventionId,
    String? code,
    int? sequence,
    String? title,
    Value<String?> system = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> tray = const Value.absent(),
    Value<String?> orientation = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> deletedBy = const Value.absent(),
  }) => DisassemblyOperation(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    code: code ?? this.code,
    sequence: sequence ?? this.sequence,
    title: title ?? this.title,
    system: system.present ? system.value : this.system,
    description: description.present ? description.value : this.description,
    tray: tray.present ? tray.value : this.tray,
    orientation: orientation.present ? orientation.value : this.orientation,
    notes: notes.present ? notes.value : this.notes,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    deletedBy: deletedBy.present ? deletedBy.value : this.deletedBy,
  );
  DisassemblyOperation copyWithCompanion(DisassemblyOperationsCompanion data) {
    return DisassemblyOperation(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      code: data.code.present ? data.code.value : this.code,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      title: data.title.present ? data.title.value : this.title,
      system: data.system.present ? data.system.value : this.system,
      description: data.description.present
          ? data.description.value
          : this.description,
      tray: data.tray.present ? data.tray.value : this.tray,
      orientation: data.orientation.present
          ? data.orientation.value
          : this.orientation,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      deletedBy: data.deletedBy.present ? data.deletedBy.value : this.deletedBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DisassemblyOperation(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('code: $code, ')
          ..write('sequence: $sequence, ')
          ..write('title: $title, ')
          ..write('system: $system, ')
          ..write('description: $description, ')
          ..write('tray: $tray, ')
          ..write('orientation: $orientation, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('deletedBy: $deletedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    code,
    sequence,
    title,
    system,
    description,
    tray,
    orientation,
    notes,
    status,
    createdAt,
    updatedAt,
    deletedAt,
    deletedBy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DisassemblyOperation &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.code == this.code &&
          other.sequence == this.sequence &&
          other.title == this.title &&
          other.system == this.system &&
          other.description == this.description &&
          other.tray == this.tray &&
          other.orientation == this.orientation &&
          other.notes == this.notes &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.deletedBy == this.deletedBy);
}

class DisassemblyOperationsCompanion
    extends UpdateCompanion<DisassemblyOperation> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> code;
  final Value<int> sequence;
  final Value<String> title;
  final Value<String?> system;
  final Value<String?> description;
  final Value<String?> tray;
  final Value<String?> orientation;
  final Value<String?> notes;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> deletedBy;
  final Value<int> rowid;
  const DisassemblyOperationsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.code = const Value.absent(),
    this.sequence = const Value.absent(),
    this.title = const Value.absent(),
    this.system = const Value.absent(),
    this.description = const Value.absent(),
    this.tray = const Value.absent(),
    this.orientation = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DisassemblyOperationsCompanion.insert({
    required String id,
    required String interventionId,
    required String code,
    required int sequence,
    required String title,
    this.system = const Value.absent(),
    this.description = const Value.absent(),
    this.tray = const Value.absent(),
    this.orientation = const Value.absent(),
    this.notes = const Value.absent(),
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       code = Value(code),
       sequence = Value(sequence),
       title = Value(title),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DisassemblyOperation> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? code,
    Expression<int>? sequence,
    Expression<String>? title,
    Expression<String>? system,
    Expression<String>? description,
    Expression<String>? tray,
    Expression<String>? orientation,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? deletedBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (code != null) 'code': code,
      if (sequence != null) 'sequence': sequence,
      if (title != null) 'title': title,
      if (system != null) 'system': system,
      if (description != null) 'description': description,
      if (tray != null) 'tray': tray,
      if (orientation != null) 'orientation': orientation,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DisassemblyOperationsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? code,
    Value<int>? sequence,
    Value<String>? title,
    Value<String?>? system,
    Value<String?>? description,
    Value<String?>? tray,
    Value<String?>? orientation,
    Value<String?>? notes,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? deletedBy,
    Value<int>? rowid,
  }) {
    return DisassemblyOperationsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      code: code ?? this.code,
      sequence: sequence ?? this.sequence,
      title: title ?? this.title,
      system: system ?? this.system,
      description: description ?? this.description,
      tray: tray ?? this.tray,
      orientation: orientation ?? this.orientation,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      deletedBy: deletedBy ?? this.deletedBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (system.present) {
      map['system'] = Variable<String>(system.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (tray.present) {
      map['tray'] = Variable<String>(tray.value);
    }
    if (orientation.present) {
      map['orientation'] = Variable<String>(orientation.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DisassemblyOperationsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('code: $code, ')
          ..write('sequence: $sequence, ')
          ..write('title: $title, ')
          ..write('system: $system, ')
          ..write('description: $description, ')
          ..write('tray: $tray, ')
          ..write('orientation: $orientation, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotoAssetsTable extends PhotoAssets
    with TableInfo<$PhotoAssetsTable, PhotoAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES disassembly_operations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
    'sha256',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _byteSizeMeta = const VerificationMeta(
    'byteSize',
  );
  @override
  late final GeneratedColumn<int> byteSize = GeneratedColumn<int>(
    'byte_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capturedAtMeta = const VerificationMeta(
    'capturedAt',
  );
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
    'captured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isOriginalMeta = const VerificationMeta(
    'isOriginal',
  );
  @override
  late final GeneratedColumn<bool> isOriginal = GeneratedColumn<bool>(
    'is_original',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_original" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sourcePhotoIdMeta = const VerificationMeta(
    'sourcePhotoId',
  );
  @override
  late final GeneratedColumn<String> sourcePhotoId = GeneratedColumn<String>(
    'source_photo_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    operationId,
    kind,
    relativePath,
    sha256,
    byteSize,
    width,
    height,
    thumbnailPath,
    capturedAt,
    isOriginal,
    sourcePhotoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(
        _sha256Meta,
        sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta),
      );
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    if (data.containsKey('byte_size')) {
      context.handle(
        _byteSizeMeta,
        byteSize.isAcceptableOrUnknown(data['byte_size']!, _byteSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_byteSizeMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_thumbnailPathMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
        _capturedAtMeta,
        capturedAt.isAcceptableOrUnknown(data['captured_at']!, _capturedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('is_original')) {
      context.handle(
        _isOriginalMeta,
        isOriginal.isAcceptableOrUnknown(data['is_original']!, _isOriginalMeta),
      );
    }
    if (data.containsKey('source_photo_id')) {
      context.handle(
        _sourcePhotoIdMeta,
        sourcePhotoId.isAcceptableOrUnknown(
          data['source_photo_id']!,
          _sourcePhotoIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoAsset(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      relativePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relative_path'],
      )!,
      sha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sha256'],
      )!,
      byteSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}byte_size'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      thumbnailPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      )!,
      capturedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}captured_at'],
      )!,
      isOriginal: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_original'],
      )!,
      sourcePhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_photo_id'],
      ),
    );
  }

  @override
  $PhotoAssetsTable createAlias(String alias) {
    return $PhotoAssetsTable(attachedDatabase, alias);
  }
}

class PhotoAsset extends DataClass implements Insertable<PhotoAsset> {
  final String id;
  final String interventionId;
  final String operationId;
  final String kind;
  final String relativePath;
  final String sha256;
  final int byteSize;
  final int width;
  final int height;
  final String thumbnailPath;
  final DateTime capturedAt;
  final bool isOriginal;
  final String? sourcePhotoId;
  const PhotoAsset({
    required this.id,
    required this.interventionId,
    required this.operationId,
    required this.kind,
    required this.relativePath,
    required this.sha256,
    required this.byteSize,
    required this.width,
    required this.height,
    required this.thumbnailPath,
    required this.capturedAt,
    required this.isOriginal,
    this.sourcePhotoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['operation_id'] = Variable<String>(operationId);
    map['kind'] = Variable<String>(kind);
    map['relative_path'] = Variable<String>(relativePath);
    map['sha256'] = Variable<String>(sha256);
    map['byte_size'] = Variable<int>(byteSize);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['thumbnail_path'] = Variable<String>(thumbnailPath);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    map['is_original'] = Variable<bool>(isOriginal);
    if (!nullToAbsent || sourcePhotoId != null) {
      map['source_photo_id'] = Variable<String>(sourcePhotoId);
    }
    return map;
  }

  PhotoAssetsCompanion toCompanion(bool nullToAbsent) {
    return PhotoAssetsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      operationId: Value(operationId),
      kind: Value(kind),
      relativePath: Value(relativePath),
      sha256: Value(sha256),
      byteSize: Value(byteSize),
      width: Value(width),
      height: Value(height),
      thumbnailPath: Value(thumbnailPath),
      capturedAt: Value(capturedAt),
      isOriginal: Value(isOriginal),
      sourcePhotoId: sourcePhotoId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourcePhotoId),
    );
  }

  factory PhotoAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoAsset(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      operationId: serializer.fromJson<String>(json['operationId']),
      kind: serializer.fromJson<String>(json['kind']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      sha256: serializer.fromJson<String>(json['sha256']),
      byteSize: serializer.fromJson<int>(json['byteSize']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      thumbnailPath: serializer.fromJson<String>(json['thumbnailPath']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      isOriginal: serializer.fromJson<bool>(json['isOriginal']),
      sourcePhotoId: serializer.fromJson<String?>(json['sourcePhotoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'operationId': serializer.toJson<String>(operationId),
      'kind': serializer.toJson<String>(kind),
      'relativePath': serializer.toJson<String>(relativePath),
      'sha256': serializer.toJson<String>(sha256),
      'byteSize': serializer.toJson<int>(byteSize),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'thumbnailPath': serializer.toJson<String>(thumbnailPath),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'isOriginal': serializer.toJson<bool>(isOriginal),
      'sourcePhotoId': serializer.toJson<String?>(sourcePhotoId),
    };
  }

  PhotoAsset copyWith({
    String? id,
    String? interventionId,
    String? operationId,
    String? kind,
    String? relativePath,
    String? sha256,
    int? byteSize,
    int? width,
    int? height,
    String? thumbnailPath,
    DateTime? capturedAt,
    bool? isOriginal,
    Value<String?> sourcePhotoId = const Value.absent(),
  }) => PhotoAsset(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    operationId: operationId ?? this.operationId,
    kind: kind ?? this.kind,
    relativePath: relativePath ?? this.relativePath,
    sha256: sha256 ?? this.sha256,
    byteSize: byteSize ?? this.byteSize,
    width: width ?? this.width,
    height: height ?? this.height,
    thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    capturedAt: capturedAt ?? this.capturedAt,
    isOriginal: isOriginal ?? this.isOriginal,
    sourcePhotoId: sourcePhotoId.present
        ? sourcePhotoId.value
        : this.sourcePhotoId,
  );
  PhotoAsset copyWithCompanion(PhotoAssetsCompanion data) {
    return PhotoAsset(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      kind: data.kind.present ? data.kind.value : this.kind,
      relativePath: data.relativePath.present
          ? data.relativePath.value
          : this.relativePath,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      byteSize: data.byteSize.present ? data.byteSize.value : this.byteSize,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      capturedAt: data.capturedAt.present
          ? data.capturedAt.value
          : this.capturedAt,
      isOriginal: data.isOriginal.present
          ? data.isOriginal.value
          : this.isOriginal,
      sourcePhotoId: data.sourcePhotoId.present
          ? data.sourcePhotoId.value
          : this.sourcePhotoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoAsset(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('operationId: $operationId, ')
          ..write('kind: $kind, ')
          ..write('relativePath: $relativePath, ')
          ..write('sha256: $sha256, ')
          ..write('byteSize: $byteSize, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('isOriginal: $isOriginal, ')
          ..write('sourcePhotoId: $sourcePhotoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    operationId,
    kind,
    relativePath,
    sha256,
    byteSize,
    width,
    height,
    thumbnailPath,
    capturedAt,
    isOriginal,
    sourcePhotoId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoAsset &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.operationId == this.operationId &&
          other.kind == this.kind &&
          other.relativePath == this.relativePath &&
          other.sha256 == this.sha256 &&
          other.byteSize == this.byteSize &&
          other.width == this.width &&
          other.height == this.height &&
          other.thumbnailPath == this.thumbnailPath &&
          other.capturedAt == this.capturedAt &&
          other.isOriginal == this.isOriginal &&
          other.sourcePhotoId == this.sourcePhotoId);
}

class PhotoAssetsCompanion extends UpdateCompanion<PhotoAsset> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> operationId;
  final Value<String> kind;
  final Value<String> relativePath;
  final Value<String> sha256;
  final Value<int> byteSize;
  final Value<int> width;
  final Value<int> height;
  final Value<String> thumbnailPath;
  final Value<DateTime> capturedAt;
  final Value<bool> isOriginal;
  final Value<String?> sourcePhotoId;
  final Value<int> rowid;
  const PhotoAssetsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.operationId = const Value.absent(),
    this.kind = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.isOriginal = const Value.absent(),
    this.sourcePhotoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotoAssetsCompanion.insert({
    required String id,
    required String interventionId,
    required String operationId,
    required String kind,
    required String relativePath,
    required String sha256,
    required int byteSize,
    required int width,
    required int height,
    required String thumbnailPath,
    required DateTime capturedAt,
    this.isOriginal = const Value.absent(),
    this.sourcePhotoId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       operationId = Value(operationId),
       kind = Value(kind),
       relativePath = Value(relativePath),
       sha256 = Value(sha256),
       byteSize = Value(byteSize),
       width = Value(width),
       height = Value(height),
       thumbnailPath = Value(thumbnailPath),
       capturedAt = Value(capturedAt);
  static Insertable<PhotoAsset> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? operationId,
    Expression<String>? kind,
    Expression<String>? relativePath,
    Expression<String>? sha256,
    Expression<int>? byteSize,
    Expression<int>? width,
    Expression<int>? height,
    Expression<String>? thumbnailPath,
    Expression<DateTime>? capturedAt,
    Expression<bool>? isOriginal,
    Expression<String>? sourcePhotoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (operationId != null) 'operation_id': operationId,
      if (kind != null) 'kind': kind,
      if (relativePath != null) 'relative_path': relativePath,
      if (sha256 != null) 'sha256': sha256,
      if (byteSize != null) 'byte_size': byteSize,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (isOriginal != null) 'is_original': isOriginal,
      if (sourcePhotoId != null) 'source_photo_id': sourcePhotoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotoAssetsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? operationId,
    Value<String>? kind,
    Value<String>? relativePath,
    Value<String>? sha256,
    Value<int>? byteSize,
    Value<int>? width,
    Value<int>? height,
    Value<String>? thumbnailPath,
    Value<DateTime>? capturedAt,
    Value<bool>? isOriginal,
    Value<String?>? sourcePhotoId,
    Value<int>? rowid,
  }) {
    return PhotoAssetsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      operationId: operationId ?? this.operationId,
      kind: kind ?? this.kind,
      relativePath: relativePath ?? this.relativePath,
      sha256: sha256 ?? this.sha256,
      byteSize: byteSize ?? this.byteSize,
      width: width ?? this.width,
      height: height ?? this.height,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      capturedAt: capturedAt ?? this.capturedAt,
      isOriginal: isOriginal ?? this.isOriginal,
      sourcePhotoId: sourcePhotoId ?? this.sourcePhotoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (byteSize.present) {
      map['byte_size'] = Variable<int>(byteSize.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (isOriginal.present) {
      map['is_original'] = Variable<bool>(isOriginal.value);
    }
    if (sourcePhotoId.present) {
      map['source_photo_id'] = Variable<String>(sourcePhotoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoAssetsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('operationId: $operationId, ')
          ..write('kind: $kind, ')
          ..write('relativePath: $relativePath, ')
          ..write('sha256: $sha256, ')
          ..write('byteSize: $byteSize, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('isOriginal: $isOriginal, ')
          ..write('sourcePhotoId: $sourcePhotoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnnotationDocumentsTable extends AnnotationDocuments
    with TableInfo<$AnnotationDocumentsTable, AnnotationDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnnotationDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourcePhotoIdMeta = const VerificationMeta(
    'sourcePhotoId',
  );
  @override
  late final GeneratedColumn<String> sourcePhotoId = GeneratedColumn<String>(
    'source_photo_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES photo_assets (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _canvasWidthMeta = const VerificationMeta(
    'canvasWidth',
  );
  @override
  late final GeneratedColumn<int> canvasWidth = GeneratedColumn<int>(
    'canvas_width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _canvasHeightMeta = const VerificationMeta(
    'canvasHeight',
  );
  @override
  late final GeneratedColumn<int> canvasHeight = GeneratedColumn<int>(
    'canvas_height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _elementsJsonMeta = const VerificationMeta(
    'elementsJson',
  );
  @override
  late final GeneratedColumn<String> elementsJson = GeneratedColumn<String>(
    'elements_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _renderedPhotoIdMeta = const VerificationMeta(
    'renderedPhotoId',
  );
  @override
  late final GeneratedColumn<String> renderedPhotoId = GeneratedColumn<String>(
    'rendered_photo_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourcePhotoId,
    canvasWidth,
    canvasHeight,
    elementsJson,
    renderedPhotoId,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'annotation_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnnotationDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source_photo_id')) {
      context.handle(
        _sourcePhotoIdMeta,
        sourcePhotoId.isAcceptableOrUnknown(
          data['source_photo_id']!,
          _sourcePhotoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourcePhotoIdMeta);
    }
    if (data.containsKey('canvas_width')) {
      context.handle(
        _canvasWidthMeta,
        canvasWidth.isAcceptableOrUnknown(
          data['canvas_width']!,
          _canvasWidthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_canvasWidthMeta);
    }
    if (data.containsKey('canvas_height')) {
      context.handle(
        _canvasHeightMeta,
        canvasHeight.isAcceptableOrUnknown(
          data['canvas_height']!,
          _canvasHeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_canvasHeightMeta);
    }
    if (data.containsKey('elements_json')) {
      context.handle(
        _elementsJsonMeta,
        elementsJson.isAcceptableOrUnknown(
          data['elements_json']!,
          _elementsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_elementsJsonMeta);
    }
    if (data.containsKey('rendered_photo_id')) {
      context.handle(
        _renderedPhotoIdMeta,
        renderedPhotoId.isAcceptableOrUnknown(
          data['rendered_photo_id']!,
          _renderedPhotoIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnnotationDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnnotationDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sourcePhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_photo_id'],
      )!,
      canvasWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}canvas_width'],
      )!,
      canvasHeight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}canvas_height'],
      )!,
      elementsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}elements_json'],
      )!,
      renderedPhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rendered_photo_id'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnnotationDocumentsTable createAlias(String alias) {
    return $AnnotationDocumentsTable(attachedDatabase, alias);
  }
}

class AnnotationDocument extends DataClass
    implements Insertable<AnnotationDocument> {
  final String id;
  final String sourcePhotoId;
  final int canvasWidth;
  final int canvasHeight;
  final String elementsJson;
  final String? renderedPhotoId;
  final DateTime updatedAt;
  const AnnotationDocument({
    required this.id,
    required this.sourcePhotoId,
    required this.canvasWidth,
    required this.canvasHeight,
    required this.elementsJson,
    this.renderedPhotoId,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source_photo_id'] = Variable<String>(sourcePhotoId);
    map['canvas_width'] = Variable<int>(canvasWidth);
    map['canvas_height'] = Variable<int>(canvasHeight);
    map['elements_json'] = Variable<String>(elementsJson);
    if (!nullToAbsent || renderedPhotoId != null) {
      map['rendered_photo_id'] = Variable<String>(renderedPhotoId);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AnnotationDocumentsCompanion toCompanion(bool nullToAbsent) {
    return AnnotationDocumentsCompanion(
      id: Value(id),
      sourcePhotoId: Value(sourcePhotoId),
      canvasWidth: Value(canvasWidth),
      canvasHeight: Value(canvasHeight),
      elementsJson: Value(elementsJson),
      renderedPhotoId: renderedPhotoId == null && nullToAbsent
          ? const Value.absent()
          : Value(renderedPhotoId),
      updatedAt: Value(updatedAt),
    );
  }

  factory AnnotationDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnnotationDocument(
      id: serializer.fromJson<String>(json['id']),
      sourcePhotoId: serializer.fromJson<String>(json['sourcePhotoId']),
      canvasWidth: serializer.fromJson<int>(json['canvasWidth']),
      canvasHeight: serializer.fromJson<int>(json['canvasHeight']),
      elementsJson: serializer.fromJson<String>(json['elementsJson']),
      renderedPhotoId: serializer.fromJson<String?>(json['renderedPhotoId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourcePhotoId': serializer.toJson<String>(sourcePhotoId),
      'canvasWidth': serializer.toJson<int>(canvasWidth),
      'canvasHeight': serializer.toJson<int>(canvasHeight),
      'elementsJson': serializer.toJson<String>(elementsJson),
      'renderedPhotoId': serializer.toJson<String?>(renderedPhotoId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AnnotationDocument copyWith({
    String? id,
    String? sourcePhotoId,
    int? canvasWidth,
    int? canvasHeight,
    String? elementsJson,
    Value<String?> renderedPhotoId = const Value.absent(),
    DateTime? updatedAt,
  }) => AnnotationDocument(
    id: id ?? this.id,
    sourcePhotoId: sourcePhotoId ?? this.sourcePhotoId,
    canvasWidth: canvasWidth ?? this.canvasWidth,
    canvasHeight: canvasHeight ?? this.canvasHeight,
    elementsJson: elementsJson ?? this.elementsJson,
    renderedPhotoId: renderedPhotoId.present
        ? renderedPhotoId.value
        : this.renderedPhotoId,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AnnotationDocument copyWithCompanion(AnnotationDocumentsCompanion data) {
    return AnnotationDocument(
      id: data.id.present ? data.id.value : this.id,
      sourcePhotoId: data.sourcePhotoId.present
          ? data.sourcePhotoId.value
          : this.sourcePhotoId,
      canvasWidth: data.canvasWidth.present
          ? data.canvasWidth.value
          : this.canvasWidth,
      canvasHeight: data.canvasHeight.present
          ? data.canvasHeight.value
          : this.canvasHeight,
      elementsJson: data.elementsJson.present
          ? data.elementsJson.value
          : this.elementsJson,
      renderedPhotoId: data.renderedPhotoId.present
          ? data.renderedPhotoId.value
          : this.renderedPhotoId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnnotationDocument(')
          ..write('id: $id, ')
          ..write('sourcePhotoId: $sourcePhotoId, ')
          ..write('canvasWidth: $canvasWidth, ')
          ..write('canvasHeight: $canvasHeight, ')
          ..write('elementsJson: $elementsJson, ')
          ..write('renderedPhotoId: $renderedPhotoId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sourcePhotoId,
    canvasWidth,
    canvasHeight,
    elementsJson,
    renderedPhotoId,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnnotationDocument &&
          other.id == this.id &&
          other.sourcePhotoId == this.sourcePhotoId &&
          other.canvasWidth == this.canvasWidth &&
          other.canvasHeight == this.canvasHeight &&
          other.elementsJson == this.elementsJson &&
          other.renderedPhotoId == this.renderedPhotoId &&
          other.updatedAt == this.updatedAt);
}

class AnnotationDocumentsCompanion extends UpdateCompanion<AnnotationDocument> {
  final Value<String> id;
  final Value<String> sourcePhotoId;
  final Value<int> canvasWidth;
  final Value<int> canvasHeight;
  final Value<String> elementsJson;
  final Value<String?> renderedPhotoId;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AnnotationDocumentsCompanion({
    this.id = const Value.absent(),
    this.sourcePhotoId = const Value.absent(),
    this.canvasWidth = const Value.absent(),
    this.canvasHeight = const Value.absent(),
    this.elementsJson = const Value.absent(),
    this.renderedPhotoId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnnotationDocumentsCompanion.insert({
    required String id,
    required String sourcePhotoId,
    required int canvasWidth,
    required int canvasHeight,
    required String elementsJson,
    this.renderedPhotoId = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sourcePhotoId = Value(sourcePhotoId),
       canvasWidth = Value(canvasWidth),
       canvasHeight = Value(canvasHeight),
       elementsJson = Value(elementsJson),
       updatedAt = Value(updatedAt);
  static Insertable<AnnotationDocument> custom({
    Expression<String>? id,
    Expression<String>? sourcePhotoId,
    Expression<int>? canvasWidth,
    Expression<int>? canvasHeight,
    Expression<String>? elementsJson,
    Expression<String>? renderedPhotoId,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourcePhotoId != null) 'source_photo_id': sourcePhotoId,
      if (canvasWidth != null) 'canvas_width': canvasWidth,
      if (canvasHeight != null) 'canvas_height': canvasHeight,
      if (elementsJson != null) 'elements_json': elementsJson,
      if (renderedPhotoId != null) 'rendered_photo_id': renderedPhotoId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnnotationDocumentsCompanion copyWith({
    Value<String>? id,
    Value<String>? sourcePhotoId,
    Value<int>? canvasWidth,
    Value<int>? canvasHeight,
    Value<String>? elementsJson,
    Value<String?>? renderedPhotoId,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnnotationDocumentsCompanion(
      id: id ?? this.id,
      sourcePhotoId: sourcePhotoId ?? this.sourcePhotoId,
      canvasWidth: canvasWidth ?? this.canvasWidth,
      canvasHeight: canvasHeight ?? this.canvasHeight,
      elementsJson: elementsJson ?? this.elementsJson,
      renderedPhotoId: renderedPhotoId ?? this.renderedPhotoId,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sourcePhotoId.present) {
      map['source_photo_id'] = Variable<String>(sourcePhotoId.value);
    }
    if (canvasWidth.present) {
      map['canvas_width'] = Variable<int>(canvasWidth.value);
    }
    if (canvasHeight.present) {
      map['canvas_height'] = Variable<int>(canvasHeight.value);
    }
    if (elementsJson.present) {
      map['elements_json'] = Variable<String>(elementsJson.value);
    }
    if (renderedPhotoId.present) {
      map['rendered_photo_id'] = Variable<String>(renderedPhotoId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnnotationDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('sourcePhotoId: $sourcePhotoId, ')
          ..write('canvasWidth: $canvasWidth, ')
          ..write('canvasHeight: $canvasHeight, ')
          ..write('elementsJson: $elementsJson, ')
          ..write('renderedPhotoId: $renderedPhotoId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentsTable extends Components
    with TableInfo<$ComponentsTable, Component> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES disassembly_operations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orientationMeta = const VerificationMeta(
    'orientation',
  );
  @override
  late final GeneratedColumn<String> orientation = GeneratedColumn<String>(
    'orientation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trayMeta = const VerificationMeta('tray');
  @override
  late final GeneratedColumn<String> tray = GeneratedColumn<String>(
    'tray',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    operationId,
    code,
    type,
    description,
    quantity,
    position,
    orientation,
    tray,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'components';
  @override
  VerificationContext validateIntegrity(
    Insertable<Component> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    if (data.containsKey('orientation')) {
      context.handle(
        _orientationMeta,
        orientation.isAcceptableOrUnknown(
          data['orientation']!,
          _orientationMeta,
        ),
      );
    }
    if (data.containsKey('tray')) {
      context.handle(
        _trayMeta,
        tray.isAcceptableOrUnknown(data['tray']!, _trayMeta),
      );
    } else if (isInserting) {
      context.missing(_trayMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Component map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Component(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      ),
      orientation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}orientation'],
      ),
      tray: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tray'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ComponentsTable createAlias(String alias) {
    return $ComponentsTable(attachedDatabase, alias);
  }
}

class Component extends DataClass implements Insertable<Component> {
  final String id;
  final String interventionId;
  final String operationId;
  final String code;
  final String type;
  final String description;
  final int quantity;
  final String? position;
  final String? orientation;
  final String tray;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Component({
    required this.id,
    required this.interventionId,
    required this.operationId,
    required this.code,
    required this.type,
    required this.description,
    required this.quantity,
    this.position,
    this.orientation,
    required this.tray,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['operation_id'] = Variable<String>(operationId);
    map['code'] = Variable<String>(code);
    map['type'] = Variable<String>(type);
    map['description'] = Variable<String>(description);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    if (!nullToAbsent || orientation != null) {
      map['orientation'] = Variable<String>(orientation);
    }
    map['tray'] = Variable<String>(tray);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ComponentsCompanion toCompanion(bool nullToAbsent) {
    return ComponentsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      operationId: Value(operationId),
      code: Value(code),
      type: Value(type),
      description: Value(description),
      quantity: Value(quantity),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      orientation: orientation == null && nullToAbsent
          ? const Value.absent()
          : Value(orientation),
      tray: Value(tray),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Component.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Component(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      operationId: serializer.fromJson<String>(json['operationId']),
      code: serializer.fromJson<String>(json['code']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      quantity: serializer.fromJson<int>(json['quantity']),
      position: serializer.fromJson<String?>(json['position']),
      orientation: serializer.fromJson<String?>(json['orientation']),
      tray: serializer.fromJson<String>(json['tray']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'operationId': serializer.toJson<String>(operationId),
      'code': serializer.toJson<String>(code),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'quantity': serializer.toJson<int>(quantity),
      'position': serializer.toJson<String?>(position),
      'orientation': serializer.toJson<String?>(orientation),
      'tray': serializer.toJson<String>(tray),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Component copyWith({
    String? id,
    String? interventionId,
    String? operationId,
    String? code,
    String? type,
    String? description,
    int? quantity,
    Value<String?> position = const Value.absent(),
    Value<String?> orientation = const Value.absent(),
    String? tray,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Component(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    operationId: operationId ?? this.operationId,
    code: code ?? this.code,
    type: type ?? this.type,
    description: description ?? this.description,
    quantity: quantity ?? this.quantity,
    position: position.present ? position.value : this.position,
    orientation: orientation.present ? orientation.value : this.orientation,
    tray: tray ?? this.tray,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Component copyWithCompanion(ComponentsCompanion data) {
    return Component(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      code: data.code.present ? data.code.value : this.code,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      position: data.position.present ? data.position.value : this.position,
      orientation: data.orientation.present
          ? data.orientation.value
          : this.orientation,
      tray: data.tray.present ? data.tray.value : this.tray,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Component(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('operationId: $operationId, ')
          ..write('code: $code, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('position: $position, ')
          ..write('orientation: $orientation, ')
          ..write('tray: $tray, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    operationId,
    code,
    type,
    description,
    quantity,
    position,
    orientation,
    tray,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Component &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.operationId == this.operationId &&
          other.code == this.code &&
          other.type == this.type &&
          other.description == this.description &&
          other.quantity == this.quantity &&
          other.position == this.position &&
          other.orientation == this.orientation &&
          other.tray == this.tray &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ComponentsCompanion extends UpdateCompanion<Component> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> operationId;
  final Value<String> code;
  final Value<String> type;
  final Value<String> description;
  final Value<int> quantity;
  final Value<String?> position;
  final Value<String?> orientation;
  final Value<String> tray;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ComponentsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.operationId = const Value.absent(),
    this.code = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.position = const Value.absent(),
    this.orientation = const Value.absent(),
    this.tray = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentsCompanion.insert({
    required String id,
    required String interventionId,
    required String operationId,
    required String code,
    required String type,
    required String description,
    required int quantity,
    this.position = const Value.absent(),
    this.orientation = const Value.absent(),
    required String tray,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       operationId = Value(operationId),
       code = Value(code),
       type = Value(type),
       description = Value(description),
       quantity = Value(quantity),
       tray = Value(tray),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Component> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? operationId,
    Expression<String>? code,
    Expression<String>? type,
    Expression<String>? description,
    Expression<int>? quantity,
    Expression<String>? position,
    Expression<String>? orientation,
    Expression<String>? tray,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (operationId != null) 'operation_id': operationId,
      if (code != null) 'code': code,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (quantity != null) 'quantity': quantity,
      if (position != null) 'position': position,
      if (orientation != null) 'orientation': orientation,
      if (tray != null) 'tray': tray,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? operationId,
    Value<String>? code,
    Value<String>? type,
    Value<String>? description,
    Value<int>? quantity,
    Value<String?>? position,
    Value<String?>? orientation,
    Value<String>? tray,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ComponentsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      operationId: operationId ?? this.operationId,
      code: code ?? this.code,
      type: type ?? this.type,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      position: position ?? this.position,
      orientation: orientation ?? this.orientation,
      tray: tray ?? this.tray,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (orientation.present) {
      map['orientation'] = Variable<String>(orientation.value);
    }
    if (tray.present) {
      map['tray'] = Variable<String>(tray.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('operationId: $operationId, ')
          ..write('code: $code, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('position: $position, ')
          ..write('orientation: $orientation, ')
          ..write('tray: $tray, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupRecordsTable extends BackupRecords
    with TableInfo<$BackupRecordsTable, BackupRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _destinationUriMeta = const VerificationMeta(
    'destinationUri',
  );
  @override
  late final GeneratedColumn<String> destinationUri = GeneratedColumn<String>(
    'destination_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _manifestSha256Meta = const VerificationMeta(
    'manifestSha256',
  );
  @override
  late final GeneratedColumn<String> manifestSha256 = GeneratedColumn<String>(
    'manifest_sha256',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    destinationUri,
    manifestSha256,
    status,
    startedAt,
    completedAt,
    errorCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('destination_uri')) {
      context.handle(
        _destinationUriMeta,
        destinationUri.isAcceptableOrUnknown(
          data['destination_uri']!,
          _destinationUriMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_destinationUriMeta);
    }
    if (data.containsKey('manifest_sha256')) {
      context.handle(
        _manifestSha256Meta,
        manifestSha256.isAcceptableOrUnknown(
          data['manifest_sha256']!,
          _manifestSha256Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_manifestSha256Meta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      destinationUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination_uri'],
      )!,
      manifestSha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manifest_sha256'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
    );
  }

  @override
  $BackupRecordsTable createAlias(String alias) {
    return $BackupRecordsTable(attachedDatabase, alias);
  }
}

class BackupRecord extends DataClass implements Insertable<BackupRecord> {
  final String id;
  final String interventionId;
  final String destinationUri;
  final String manifestSha256;
  final String status;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String? errorCode;
  const BackupRecord({
    required this.id,
    required this.interventionId,
    required this.destinationUri,
    required this.manifestSha256,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.errorCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['destination_uri'] = Variable<String>(destinationUri);
    map['manifest_sha256'] = Variable<String>(manifestSha256);
    map['status'] = Variable<String>(status);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    return map;
  }

  BackupRecordsCompanion toCompanion(bool nullToAbsent) {
    return BackupRecordsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      destinationUri: Value(destinationUri),
      manifestSha256: Value(manifestSha256),
      status: Value(status),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
    );
  }

  factory BackupRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupRecord(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      destinationUri: serializer.fromJson<String>(json['destinationUri']),
      manifestSha256: serializer.fromJson<String>(json['manifestSha256']),
      status: serializer.fromJson<String>(json['status']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      errorCode: serializer.fromJson<String?>(json['errorCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'destinationUri': serializer.toJson<String>(destinationUri),
      'manifestSha256': serializer.toJson<String>(manifestSha256),
      'status': serializer.toJson<String>(status),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'errorCode': serializer.toJson<String?>(errorCode),
    };
  }

  BackupRecord copyWith({
    String? id,
    String? interventionId,
    String? destinationUri,
    String? manifestSha256,
    String? status,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<String?> errorCode = const Value.absent(),
  }) => BackupRecord(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    destinationUri: destinationUri ?? this.destinationUri,
    manifestSha256: manifestSha256 ?? this.manifestSha256,
    status: status ?? this.status,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
  );
  BackupRecord copyWithCompanion(BackupRecordsCompanion data) {
    return BackupRecord(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      destinationUri: data.destinationUri.present
          ? data.destinationUri.value
          : this.destinationUri,
      manifestSha256: data.manifestSha256.present
          ? data.manifestSha256.value
          : this.manifestSha256,
      status: data.status.present ? data.status.value : this.status,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupRecord(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('destinationUri: $destinationUri, ')
          ..write('manifestSha256: $manifestSha256, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('errorCode: $errorCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    destinationUri,
    manifestSha256,
    status,
    startedAt,
    completedAt,
    errorCode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupRecord &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.destinationUri == this.destinationUri &&
          other.manifestSha256 == this.manifestSha256 &&
          other.status == this.status &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.errorCode == this.errorCode);
}

class BackupRecordsCompanion extends UpdateCompanion<BackupRecord> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> destinationUri;
  final Value<String> manifestSha256;
  final Value<String> status;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String?> errorCode;
  final Value<int> rowid;
  const BackupRecordsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.destinationUri = const Value.absent(),
    this.manifestSha256 = const Value.absent(),
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackupRecordsCompanion.insert({
    required String id,
    required String interventionId,
    required String destinationUri,
    required String manifestSha256,
    required String status,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       destinationUri = Value(destinationUri),
       manifestSha256 = Value(manifestSha256),
       status = Value(status),
       startedAt = Value(startedAt);
  static Insertable<BackupRecord> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? destinationUri,
    Expression<String>? manifestSha256,
    Expression<String>? status,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? errorCode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (destinationUri != null) 'destination_uri': destinationUri,
      if (manifestSha256 != null) 'manifest_sha256': manifestSha256,
      if (status != null) 'status': status,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (errorCode != null) 'error_code': errorCode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackupRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? destinationUri,
    Value<String>? manifestSha256,
    Value<String>? status,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String?>? errorCode,
    Value<int>? rowid,
  }) {
    return BackupRecordsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      destinationUri: destinationUri ?? this.destinationUri,
      manifestSha256: manifestSha256 ?? this.manifestSha256,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      errorCode: errorCode ?? this.errorCode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (destinationUri.present) {
      map['destination_uri'] = Variable<String>(destinationUri.value);
    }
    if (manifestSha256.present) {
      map['manifest_sha256'] = Variable<String>(manifestSha256.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupRecordsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('destinationUri: $destinationUri, ')
          ..write('manifestSha256: $manifestSha256, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('errorCode: $errorCode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiagnosticFindingsTable extends DiagnosticFindings
    with TableInfo<$DiagnosticFindingsTable, DiagnosticFinding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiagnosticFindingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES disassembly_operations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zoneMeta = const VerificationMeta('zone');
  @override
  late final GeneratedColumn<String> zone = GeneratedColumn<String>(
    'zone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoAssetIdMeta = const VerificationMeta(
    'photoAssetId',
  );
  @override
  late final GeneratedColumn<String> photoAssetId = GeneratedColumn<String>(
    'photo_asset_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proposedActionMeta = const VerificationMeta(
    'proposedAction',
  );
  @override
  late final GeneratedColumn<String> proposedAction = GeneratedColumn<String>(
    'proposed_action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    operationId,
    code,
    zone,
    category,
    description,
    severity,
    photoAssetId,
    proposedAction,
    status,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diagnostic_findings';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiagnosticFinding> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('zone')) {
      context.handle(
        _zoneMeta,
        zone.isAcceptableOrUnknown(data['zone']!, _zoneMeta),
      );
    } else if (isInserting) {
      context.missing(_zoneMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('photo_asset_id')) {
      context.handle(
        _photoAssetIdMeta,
        photoAssetId.isAcceptableOrUnknown(
          data['photo_asset_id']!,
          _photoAssetIdMeta,
        ),
      );
    }
    if (data.containsKey('proposed_action')) {
      context.handle(
        _proposedActionMeta,
        proposedAction.isAcceptableOrUnknown(
          data['proposed_action']!,
          _proposedActionMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiagnosticFinding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiagnosticFinding(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      zone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zone'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
      photoAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_asset_id'],
      ),
      proposedAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}proposed_action'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DiagnosticFindingsTable createAlias(String alias) {
    return $DiagnosticFindingsTable(attachedDatabase, alias);
  }
}

class DiagnosticFinding extends DataClass
    implements Insertable<DiagnosticFinding> {
  final String id;
  final String interventionId;
  final String operationId;
  final String code;
  final String zone;
  final String category;
  final String description;
  final String severity;
  final String? photoAssetId;
  final String? proposedAction;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DiagnosticFinding({
    required this.id,
    required this.interventionId,
    required this.operationId,
    required this.code,
    required this.zone,
    required this.category,
    required this.description,
    required this.severity,
    this.photoAssetId,
    this.proposedAction,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['operation_id'] = Variable<String>(operationId);
    map['code'] = Variable<String>(code);
    map['zone'] = Variable<String>(zone);
    map['category'] = Variable<String>(category);
    map['description'] = Variable<String>(description);
    map['severity'] = Variable<String>(severity);
    if (!nullToAbsent || photoAssetId != null) {
      map['photo_asset_id'] = Variable<String>(photoAssetId);
    }
    if (!nullToAbsent || proposedAction != null) {
      map['proposed_action'] = Variable<String>(proposedAction);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DiagnosticFindingsCompanion toCompanion(bool nullToAbsent) {
    return DiagnosticFindingsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      operationId: Value(operationId),
      code: Value(code),
      zone: Value(zone),
      category: Value(category),
      description: Value(description),
      severity: Value(severity),
      photoAssetId: photoAssetId == null && nullToAbsent
          ? const Value.absent()
          : Value(photoAssetId),
      proposedAction: proposedAction == null && nullToAbsent
          ? const Value.absent()
          : Value(proposedAction),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DiagnosticFinding.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiagnosticFinding(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      operationId: serializer.fromJson<String>(json['operationId']),
      code: serializer.fromJson<String>(json['code']),
      zone: serializer.fromJson<String>(json['zone']),
      category: serializer.fromJson<String>(json['category']),
      description: serializer.fromJson<String>(json['description']),
      severity: serializer.fromJson<String>(json['severity']),
      photoAssetId: serializer.fromJson<String?>(json['photoAssetId']),
      proposedAction: serializer.fromJson<String?>(json['proposedAction']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'operationId': serializer.toJson<String>(operationId),
      'code': serializer.toJson<String>(code),
      'zone': serializer.toJson<String>(zone),
      'category': serializer.toJson<String>(category),
      'description': serializer.toJson<String>(description),
      'severity': serializer.toJson<String>(severity),
      'photoAssetId': serializer.toJson<String?>(photoAssetId),
      'proposedAction': serializer.toJson<String?>(proposedAction),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DiagnosticFinding copyWith({
    String? id,
    String? interventionId,
    String? operationId,
    String? code,
    String? zone,
    String? category,
    String? description,
    String? severity,
    Value<String?> photoAssetId = const Value.absent(),
    Value<String?> proposedAction = const Value.absent(),
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DiagnosticFinding(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    operationId: operationId ?? this.operationId,
    code: code ?? this.code,
    zone: zone ?? this.zone,
    category: category ?? this.category,
    description: description ?? this.description,
    severity: severity ?? this.severity,
    photoAssetId: photoAssetId.present ? photoAssetId.value : this.photoAssetId,
    proposedAction: proposedAction.present
        ? proposedAction.value
        : this.proposedAction,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DiagnosticFinding copyWithCompanion(DiagnosticFindingsCompanion data) {
    return DiagnosticFinding(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      code: data.code.present ? data.code.value : this.code,
      zone: data.zone.present ? data.zone.value : this.zone,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
      severity: data.severity.present ? data.severity.value : this.severity,
      photoAssetId: data.photoAssetId.present
          ? data.photoAssetId.value
          : this.photoAssetId,
      proposedAction: data.proposedAction.present
          ? data.proposedAction.value
          : this.proposedAction,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosticFinding(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('operationId: $operationId, ')
          ..write('code: $code, ')
          ..write('zone: $zone, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('severity: $severity, ')
          ..write('photoAssetId: $photoAssetId, ')
          ..write('proposedAction: $proposedAction, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    operationId,
    code,
    zone,
    category,
    description,
    severity,
    photoAssetId,
    proposedAction,
    status,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiagnosticFinding &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.operationId == this.operationId &&
          other.code == this.code &&
          other.zone == this.zone &&
          other.category == this.category &&
          other.description == this.description &&
          other.severity == this.severity &&
          other.photoAssetId == this.photoAssetId &&
          other.proposedAction == this.proposedAction &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DiagnosticFindingsCompanion extends UpdateCompanion<DiagnosticFinding> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> operationId;
  final Value<String> code;
  final Value<String> zone;
  final Value<String> category;
  final Value<String> description;
  final Value<String> severity;
  final Value<String?> photoAssetId;
  final Value<String?> proposedAction;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DiagnosticFindingsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.operationId = const Value.absent(),
    this.code = const Value.absent(),
    this.zone = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.severity = const Value.absent(),
    this.photoAssetId = const Value.absent(),
    this.proposedAction = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiagnosticFindingsCompanion.insert({
    required String id,
    required String interventionId,
    required String operationId,
    required String code,
    required String zone,
    required String category,
    required String description,
    required String severity,
    this.photoAssetId = const Value.absent(),
    this.proposedAction = const Value.absent(),
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       operationId = Value(operationId),
       code = Value(code),
       zone = Value(zone),
       category = Value(category),
       description = Value(description),
       severity = Value(severity),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DiagnosticFinding> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? operationId,
    Expression<String>? code,
    Expression<String>? zone,
    Expression<String>? category,
    Expression<String>? description,
    Expression<String>? severity,
    Expression<String>? photoAssetId,
    Expression<String>? proposedAction,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (operationId != null) 'operation_id': operationId,
      if (code != null) 'code': code,
      if (zone != null) 'zone': zone,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (severity != null) 'severity': severity,
      if (photoAssetId != null) 'photo_asset_id': photoAssetId,
      if (proposedAction != null) 'proposed_action': proposedAction,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiagnosticFindingsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? operationId,
    Value<String>? code,
    Value<String>? zone,
    Value<String>? category,
    Value<String>? description,
    Value<String>? severity,
    Value<String?>? photoAssetId,
    Value<String?>? proposedAction,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DiagnosticFindingsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      operationId: operationId ?? this.operationId,
      code: code ?? this.code,
      zone: zone ?? this.zone,
      category: category ?? this.category,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      photoAssetId: photoAssetId ?? this.photoAssetId,
      proposedAction: proposedAction ?? this.proposedAction,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (zone.present) {
      map['zone'] = Variable<String>(zone.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (photoAssetId.present) {
      map['photo_asset_id'] = Variable<String>(photoAssetId.value);
    }
    if (proposedAction.present) {
      map['proposed_action'] = Variable<String>(proposedAction.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosticFindingsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('operationId: $operationId, ')
          ..write('code: $code, ')
          ..write('zone: $zone, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('severity: $severity, ')
          ..write('photoAssetId: $photoAssetId, ')
          ..write('proposedAction: $proposedAction, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CriticalChecklistItemsTable extends CriticalChecklistItems
    with TableInfo<$CriticalChecklistItemsTable, CriticalChecklistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CriticalChecklistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _systemMeta = const VerificationMeta('system');
  @override
  late final GeneratedColumn<String> system = GeneratedColumn<String>(
    'system',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemCodeMeta = const VerificationMeta(
    'itemCode',
  );
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
    'item_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkedMeta = const VerificationMeta(
    'checked',
  );
  @override
  late final GeneratedColumn<bool> checked = GeneratedColumn<bool>(
    'checked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("checked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    system,
    itemCode,
    label,
    checked,
    notes,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'critical_checklist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CriticalChecklistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('system')) {
      context.handle(
        _systemMeta,
        system.isAcceptableOrUnknown(data['system']!, _systemMeta),
      );
    } else if (isInserting) {
      context.missing(_systemMeta);
    }
    if (data.containsKey('item_code')) {
      context.handle(
        _itemCodeMeta,
        itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('checked')) {
      context.handle(
        _checkedMeta,
        checked.isAcceptableOrUnknown(data['checked']!, _checkedMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CriticalChecklistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CriticalChecklistItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      system: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}system'],
      )!,
      itemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_code'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      checked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}checked'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CriticalChecklistItemsTable createAlias(String alias) {
    return $CriticalChecklistItemsTable(attachedDatabase, alias);
  }
}

class CriticalChecklistItem extends DataClass
    implements Insertable<CriticalChecklistItem> {
  final String id;
  final String interventionId;
  final String system;
  final String itemCode;
  final String label;
  final bool checked;
  final String? notes;
  final DateTime updatedAt;
  const CriticalChecklistItem({
    required this.id,
    required this.interventionId,
    required this.system,
    required this.itemCode,
    required this.label,
    required this.checked,
    this.notes,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['system'] = Variable<String>(system);
    map['item_code'] = Variable<String>(itemCode);
    map['label'] = Variable<String>(label);
    map['checked'] = Variable<bool>(checked);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CriticalChecklistItemsCompanion toCompanion(bool nullToAbsent) {
    return CriticalChecklistItemsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      system: Value(system),
      itemCode: Value(itemCode),
      label: Value(label),
      checked: Value(checked),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      updatedAt: Value(updatedAt),
    );
  }

  factory CriticalChecklistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CriticalChecklistItem(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      system: serializer.fromJson<String>(json['system']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      label: serializer.fromJson<String>(json['label']),
      checked: serializer.fromJson<bool>(json['checked']),
      notes: serializer.fromJson<String?>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'system': serializer.toJson<String>(system),
      'itemCode': serializer.toJson<String>(itemCode),
      'label': serializer.toJson<String>(label),
      'checked': serializer.toJson<bool>(checked),
      'notes': serializer.toJson<String?>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CriticalChecklistItem copyWith({
    String? id,
    String? interventionId,
    String? system,
    String? itemCode,
    String? label,
    bool? checked,
    Value<String?> notes = const Value.absent(),
    DateTime? updatedAt,
  }) => CriticalChecklistItem(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    system: system ?? this.system,
    itemCode: itemCode ?? this.itemCode,
    label: label ?? this.label,
    checked: checked ?? this.checked,
    notes: notes.present ? notes.value : this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CriticalChecklistItem copyWithCompanion(
    CriticalChecklistItemsCompanion data,
  ) {
    return CriticalChecklistItem(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      system: data.system.present ? data.system.value : this.system,
      itemCode: data.itemCode.present ? data.itemCode.value : this.itemCode,
      label: data.label.present ? data.label.value : this.label,
      checked: data.checked.present ? data.checked.value : this.checked,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CriticalChecklistItem(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('system: $system, ')
          ..write('itemCode: $itemCode, ')
          ..write('label: $label, ')
          ..write('checked: $checked, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    system,
    itemCode,
    label,
    checked,
    notes,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CriticalChecklistItem &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.system == this.system &&
          other.itemCode == this.itemCode &&
          other.label == this.label &&
          other.checked == this.checked &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt);
}

class CriticalChecklistItemsCompanion
    extends UpdateCompanion<CriticalChecklistItem> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> system;
  final Value<String> itemCode;
  final Value<String> label;
  final Value<bool> checked;
  final Value<String?> notes;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CriticalChecklistItemsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.system = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.label = const Value.absent(),
    this.checked = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CriticalChecklistItemsCompanion.insert({
    required String id,
    required String interventionId,
    required String system,
    required String itemCode,
    required String label,
    this.checked = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       system = Value(system),
       itemCode = Value(itemCode),
       label = Value(label),
       updatedAt = Value(updatedAt);
  static Insertable<CriticalChecklistItem> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? system,
    Expression<String>? itemCode,
    Expression<String>? label,
    Expression<bool>? checked,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (system != null) 'system': system,
      if (itemCode != null) 'item_code': itemCode,
      if (label != null) 'label': label,
      if (checked != null) 'checked': checked,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CriticalChecklistItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? system,
    Value<String>? itemCode,
    Value<String>? label,
    Value<bool>? checked,
    Value<String?>? notes,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CriticalChecklistItemsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      system: system ?? this.system,
      itemCode: itemCode ?? this.itemCode,
      label: label ?? this.label,
      checked: checked ?? this.checked,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (system.present) {
      map['system'] = Variable<String>(system.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (checked.present) {
      map['checked'] = Variable<bool>(checked.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CriticalChecklistItemsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('system: $system, ')
          ..write('itemCode: $itemCode, ')
          ..write('label: $label, ')
          ..write('checked: $checked, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditEventsTable extends AuditEvents
    with TableInfo<$AuditEventsTable, AuditEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionIdMeta = const VerificationMeta(
    'interventionId',
  );
  @override
  late final GeneratedColumn<String> interventionId = GeneratedColumn<String>(
    'intervention_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interventions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityCodeMeta = const VerificationMeta(
    'entityCode',
  );
  @override
  late final GeneratedColumn<String> entityCode = GeneratedColumn<String>(
    'entity_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actorMeta = const VerificationMeta('actor');
  @override
  late final GeneratedColumn<String> actor = GeneratedColumn<String>(
    'actor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oldValuesJsonMeta = const VerificationMeta(
    'oldValuesJson',
  );
  @override
  late final GeneratedColumn<String> oldValuesJson = GeneratedColumn<String>(
    'old_values_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _newValuesJsonMeta = const VerificationMeta(
    'newValuesJson',
  );
  @override
  late final GeneratedColumn<String> newValuesJson = GeneratedColumn<String>(
    'new_values_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionId,
    eventType,
    entityType,
    entityId,
    entityCode,
    actor,
    oldValuesJson,
    newValuesJson,
    details,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_id')) {
      context.handle(
        _interventionIdMeta,
        interventionId.isAcceptableOrUnknown(
          data['intervention_id']!,
          _interventionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionIdMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('entity_code')) {
      context.handle(
        _entityCodeMeta,
        entityCode.isAcceptableOrUnknown(data['entity_code']!, _entityCodeMeta),
      );
    }
    if (data.containsKey('actor')) {
      context.handle(
        _actorMeta,
        actor.isAcceptableOrUnknown(data['actor']!, _actorMeta),
      );
    }
    if (data.containsKey('old_values_json')) {
      context.handle(
        _oldValuesJsonMeta,
        oldValuesJson.isAcceptableOrUnknown(
          data['old_values_json']!,
          _oldValuesJsonMeta,
        ),
      );
    }
    if (data.containsKey('new_values_json')) {
      context.handle(
        _newValuesJsonMeta,
        newValuesJson.isAcceptableOrUnknown(
          data['new_values_json']!,
          _newValuesJsonMeta,
        ),
      );
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_id'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      ),
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      ),
      entityCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_code'],
      ),
      actor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actor'],
      ),
      oldValuesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}old_values_json'],
      ),
      newValuesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_values_json'],
      ),
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditEventsTable createAlias(String alias) {
    return $AuditEventsTable(attachedDatabase, alias);
  }
}

class AuditEvent extends DataClass implements Insertable<AuditEvent> {
  final String id;
  final String interventionId;
  final String eventType;
  final String? entityType;
  final String? entityId;
  final String? entityCode;
  final String? actor;
  final String? oldValuesJson;
  final String? newValuesJson;
  final String? details;
  final DateTime createdAt;
  const AuditEvent({
    required this.id,
    required this.interventionId,
    required this.eventType,
    this.entityType,
    this.entityId,
    this.entityCode,
    this.actor,
    this.oldValuesJson,
    this.newValuesJson,
    this.details,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_id'] = Variable<String>(interventionId);
    map['event_type'] = Variable<String>(eventType);
    if (!nullToAbsent || entityType != null) {
      map['entity_type'] = Variable<String>(entityType);
    }
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    if (!nullToAbsent || entityCode != null) {
      map['entity_code'] = Variable<String>(entityCode);
    }
    if (!nullToAbsent || actor != null) {
      map['actor'] = Variable<String>(actor);
    }
    if (!nullToAbsent || oldValuesJson != null) {
      map['old_values_json'] = Variable<String>(oldValuesJson);
    }
    if (!nullToAbsent || newValuesJson != null) {
      map['new_values_json'] = Variable<String>(newValuesJson);
    }
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuditEventsCompanion toCompanion(bool nullToAbsent) {
    return AuditEventsCompanion(
      id: Value(id),
      interventionId: Value(interventionId),
      eventType: Value(eventType),
      entityType: entityType == null && nullToAbsent
          ? const Value.absent()
          : Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      entityCode: entityCode == null && nullToAbsent
          ? const Value.absent()
          : Value(entityCode),
      actor: actor == null && nullToAbsent
          ? const Value.absent()
          : Value(actor),
      oldValuesJson: oldValuesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(oldValuesJson),
      newValuesJson: newValuesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(newValuesJson),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      createdAt: Value(createdAt),
    );
  }

  factory AuditEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditEvent(
      id: serializer.fromJson<String>(json['id']),
      interventionId: serializer.fromJson<String>(json['interventionId']),
      eventType: serializer.fromJson<String>(json['eventType']),
      entityType: serializer.fromJson<String?>(json['entityType']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      entityCode: serializer.fromJson<String?>(json['entityCode']),
      actor: serializer.fromJson<String?>(json['actor']),
      oldValuesJson: serializer.fromJson<String?>(json['oldValuesJson']),
      newValuesJson: serializer.fromJson<String?>(json['newValuesJson']),
      details: serializer.fromJson<String?>(json['details']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionId': serializer.toJson<String>(interventionId),
      'eventType': serializer.toJson<String>(eventType),
      'entityType': serializer.toJson<String?>(entityType),
      'entityId': serializer.toJson<String?>(entityId),
      'entityCode': serializer.toJson<String?>(entityCode),
      'actor': serializer.toJson<String?>(actor),
      'oldValuesJson': serializer.toJson<String?>(oldValuesJson),
      'newValuesJson': serializer.toJson<String?>(newValuesJson),
      'details': serializer.toJson<String?>(details),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuditEvent copyWith({
    String? id,
    String? interventionId,
    String? eventType,
    Value<String?> entityType = const Value.absent(),
    Value<String?> entityId = const Value.absent(),
    Value<String?> entityCode = const Value.absent(),
    Value<String?> actor = const Value.absent(),
    Value<String?> oldValuesJson = const Value.absent(),
    Value<String?> newValuesJson = const Value.absent(),
    Value<String?> details = const Value.absent(),
    DateTime? createdAt,
  }) => AuditEvent(
    id: id ?? this.id,
    interventionId: interventionId ?? this.interventionId,
    eventType: eventType ?? this.eventType,
    entityType: entityType.present ? entityType.value : this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    entityCode: entityCode.present ? entityCode.value : this.entityCode,
    actor: actor.present ? actor.value : this.actor,
    oldValuesJson: oldValuesJson.present
        ? oldValuesJson.value
        : this.oldValuesJson,
    newValuesJson: newValuesJson.present
        ? newValuesJson.value
        : this.newValuesJson,
    details: details.present ? details.value : this.details,
    createdAt: createdAt ?? this.createdAt,
  );
  AuditEvent copyWithCompanion(AuditEventsCompanion data) {
    return AuditEvent(
      id: data.id.present ? data.id.value : this.id,
      interventionId: data.interventionId.present
          ? data.interventionId.value
          : this.interventionId,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      entityCode: data.entityCode.present
          ? data.entityCode.value
          : this.entityCode,
      actor: data.actor.present ? data.actor.value : this.actor,
      oldValuesJson: data.oldValuesJson.present
          ? data.oldValuesJson.value
          : this.oldValuesJson,
      newValuesJson: data.newValuesJson.present
          ? data.newValuesJson.value
          : this.newValuesJson,
      details: data.details.present ? data.details.value : this.details,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditEvent(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('eventType: $eventType, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityCode: $entityCode, ')
          ..write('actor: $actor, ')
          ..write('oldValuesJson: $oldValuesJson, ')
          ..write('newValuesJson: $newValuesJson, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionId,
    eventType,
    entityType,
    entityId,
    entityCode,
    actor,
    oldValuesJson,
    newValuesJson,
    details,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditEvent &&
          other.id == this.id &&
          other.interventionId == this.interventionId &&
          other.eventType == this.eventType &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.entityCode == this.entityCode &&
          other.actor == this.actor &&
          other.oldValuesJson == this.oldValuesJson &&
          other.newValuesJson == this.newValuesJson &&
          other.details == this.details &&
          other.createdAt == this.createdAt);
}

class AuditEventsCompanion extends UpdateCompanion<AuditEvent> {
  final Value<String> id;
  final Value<String> interventionId;
  final Value<String> eventType;
  final Value<String?> entityType;
  final Value<String?> entityId;
  final Value<String?> entityCode;
  final Value<String?> actor;
  final Value<String?> oldValuesJson;
  final Value<String?> newValuesJson;
  final Value<String?> details;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AuditEventsCompanion({
    this.id = const Value.absent(),
    this.interventionId = const Value.absent(),
    this.eventType = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.entityCode = const Value.absent(),
    this.actor = const Value.absent(),
    this.oldValuesJson = const Value.absent(),
    this.newValuesJson = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditEventsCompanion.insert({
    required String id,
    required String interventionId,
    required String eventType,
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.entityCode = const Value.absent(),
    this.actor = const Value.absent(),
    this.oldValuesJson = const Value.absent(),
    this.newValuesJson = const Value.absent(),
    this.details = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionId = Value(interventionId),
       eventType = Value(eventType),
       createdAt = Value(createdAt);
  static Insertable<AuditEvent> custom({
    Expression<String>? id,
    Expression<String>? interventionId,
    Expression<String>? eventType,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? entityCode,
    Expression<String>? actor,
    Expression<String>? oldValuesJson,
    Expression<String>? newValuesJson,
    Expression<String>? details,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionId != null) 'intervention_id': interventionId,
      if (eventType != null) 'event_type': eventType,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (entityCode != null) 'entity_code': entityCode,
      if (actor != null) 'actor': actor,
      if (oldValuesJson != null) 'old_values_json': oldValuesJson,
      if (newValuesJson != null) 'new_values_json': newValuesJson,
      if (details != null) 'details': details,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionId,
    Value<String>? eventType,
    Value<String?>? entityType,
    Value<String?>? entityId,
    Value<String?>? entityCode,
    Value<String?>? actor,
    Value<String?>? oldValuesJson,
    Value<String?>? newValuesJson,
    Value<String?>? details,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AuditEventsCompanion(
      id: id ?? this.id,
      interventionId: interventionId ?? this.interventionId,
      eventType: eventType ?? this.eventType,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      entityCode: entityCode ?? this.entityCode,
      actor: actor ?? this.actor,
      oldValuesJson: oldValuesJson ?? this.oldValuesJson,
      newValuesJson: newValuesJson ?? this.newValuesJson,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionId.present) {
      map['intervention_id'] = Variable<String>(interventionId.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (entityCode.present) {
      map['entity_code'] = Variable<String>(entityCode.value);
    }
    if (actor.present) {
      map['actor'] = Variable<String>(actor.value);
    }
    if (oldValuesJson.present) {
      map['old_values_json'] = Variable<String>(oldValuesJson.value);
    }
    if (newValuesJson.present) {
      map['new_values_json'] = Variable<String>(newValuesJson.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditEventsCompanion(')
          ..write('id: $id, ')
          ..write('interventionId: $interventionId, ')
          ..write('eventType: $eventType, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityCode: $entityCode, ')
          ..write('actor: $actor, ')
          ..write('oldValuesJson: $oldValuesJson, ')
          ..write('newValuesJson: $newValuesJson, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $InterventionsTable interventions = $InterventionsTable(this);
  late final $DisassemblyOperationsTable disassemblyOperations =
      $DisassemblyOperationsTable(this);
  late final $PhotoAssetsTable photoAssets = $PhotoAssetsTable(this);
  late final $AnnotationDocumentsTable annotationDocuments =
      $AnnotationDocumentsTable(this);
  late final $ComponentsTable components = $ComponentsTable(this);
  late final $BackupRecordsTable backupRecords = $BackupRecordsTable(this);
  late final $DiagnosticFindingsTable diagnosticFindings =
      $DiagnosticFindingsTable(this);
  late final $CriticalChecklistItemsTable criticalChecklistItems =
      $CriticalChecklistItemsTable(this);
  late final $AuditEventsTable auditEvents = $AuditEventsTable(this);
  late final Index operationsInterventionCode = Index(
    'operations_intervention_code',
    'CREATE UNIQUE INDEX operations_intervention_code ON disassembly_operations (intervention_id, code)',
  );
  late final Index operationsInterventionSequence = Index(
    'operations_intervention_sequence',
    'CREATE INDEX operations_intervention_sequence ON disassembly_operations (intervention_id, sequence)',
  );
  late final Index photoAssetsOperationKind = Index(
    'photo_assets_operation_kind',
    'CREATE INDEX photo_assets_operation_kind ON photo_assets (operation_id, kind)',
  );
  late final Index componentsInterventionCode = Index(
    'components_intervention_code',
    'CREATE UNIQUE INDEX components_intervention_code ON components (intervention_id, code)',
  );
  late final Index criticalChecklistInterventionSystem = Index(
    'critical_checklist_intervention_system',
    'CREATE UNIQUE INDEX critical_checklist_intervention_system ON critical_checklist_items (intervention_id, system, item_code)',
  );
  late final Index auditEventsInterventionCreated = Index(
    'audit_events_intervention_created',
    'CREATE INDEX audit_events_intervention_created ON audit_events (intervention_id, created_at)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    interventions,
    disassemblyOperations,
    photoAssets,
    annotationDocuments,
    components,
    backupRecords,
    diagnosticFindings,
    criticalChecklistItems,
    auditEvents,
    operationsInterventionCode,
    operationsInterventionSequence,
    photoAssetsOperationKind,
    componentsInterventionCode,
    criticalChecklistInterventionSystem,
    auditEventsInterventionCreated,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('disassembly_operations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('photo_assets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'disassembly_operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('photo_assets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'photo_assets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('annotation_documents', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('components', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'disassembly_operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('components', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('backup_records', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diagnostic_findings', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'disassembly_operations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diagnostic_findings', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('critical_checklist_items', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'interventions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('audit_events', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$InterventionsTableCreateCompanionBuilder =
    InterventionsCompanion Function({
      required String id,
      required String code,
      required String brand,
      Value<String?> modelReference,
      Value<String?> calibre,
      Value<String?> movementNumber,
      required String watchType,
      required String technician,
      required String referenceOrientation,
      Value<String?> initialState,
      required String status,
      required String documentState,
      required String rootDocumentUri,
      required String folderName,
      Value<int> nextOperationNumber,
      Value<int> nextPartNumber,
      Value<int> nextScrewNumber,
      Value<int> nextWheelNumber,
      Value<int> nextSpringNumber,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> deletedBy,
      Value<int> rowid,
    });
typedef $$InterventionsTableUpdateCompanionBuilder =
    InterventionsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> brand,
      Value<String?> modelReference,
      Value<String?> calibre,
      Value<String?> movementNumber,
      Value<String> watchType,
      Value<String> technician,
      Value<String> referenceOrientation,
      Value<String?> initialState,
      Value<String> status,
      Value<String> documentState,
      Value<String> rootDocumentUri,
      Value<String> folderName,
      Value<int> nextOperationNumber,
      Value<int> nextPartNumber,
      Value<int> nextScrewNumber,
      Value<int> nextWheelNumber,
      Value<int> nextSpringNumber,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> deletedBy,
      Value<int> rowid,
    });

final class $$InterventionsTableReferences
    extends BaseReferences<_$AppDatabase, $InterventionsTable, Intervention> {
  $$InterventionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $DisassemblyOperationsTable,
    List<DisassemblyOperation>
  >
  _disassemblyOperationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.disassemblyOperations,
        aliasName: 'interventions__id__disassembly_operations__intervention_id',
      );

  $$DisassemblyOperationsTableProcessedTableManager
  get disassemblyOperationsRefs {
    final manager = $$DisassemblyOperationsTableTableManager(
      $_db,
      $_db.disassemblyOperations,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _disassemblyOperationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PhotoAssetsTable, List<PhotoAsset>>
  _photoAssetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.photoAssets,
    aliasName: 'interventions__id__photo_assets__intervention_id',
  );

  $$PhotoAssetsTableProcessedTableManager get photoAssetsRefs {
    final manager = $$PhotoAssetsTableTableManager(
      $_db,
      $_db.photoAssets,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_photoAssetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ComponentsTable, List<Component>>
  _componentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.components,
    aliasName: 'interventions__id__components__intervention_id',
  );

  $$ComponentsTableProcessedTableManager get componentsRefs {
    final manager = $$ComponentsTableTableManager(
      $_db,
      $_db.components,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_componentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BackupRecordsTable, List<BackupRecord>>
  _backupRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.backupRecords,
    aliasName: 'interventions__id__backup_records__intervention_id',
  );

  $$BackupRecordsTableProcessedTableManager get backupRecordsRefs {
    final manager = $$BackupRecordsTableTableManager(
      $_db,
      $_db.backupRecords,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_backupRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiagnosticFindingsTable, List<DiagnosticFinding>>
  _diagnosticFindingsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.diagnosticFindings,
        aliasName: 'interventions__id__diagnostic_findings__intervention_id',
      );

  $$DiagnosticFindingsTableProcessedTableManager get diagnosticFindingsRefs {
    final manager = $$DiagnosticFindingsTableTableManager(
      $_db,
      $_db.diagnosticFindings,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _diagnosticFindingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CriticalChecklistItemsTable,
    List<CriticalChecklistItem>
  >
  _criticalChecklistItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.criticalChecklistItems,
        aliasName:
            'interventions__id__critical_checklist_items__intervention_id',
      );

  $$CriticalChecklistItemsTableProcessedTableManager
  get criticalChecklistItemsRefs {
    final manager = $$CriticalChecklistItemsTableTableManager(
      $_db,
      $_db.criticalChecklistItems,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _criticalChecklistItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AuditEventsTable, List<AuditEvent>>
  _auditEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.auditEvents,
    aliasName: 'interventions__id__audit_events__intervention_id',
  );

  $$AuditEventsTableProcessedTableManager get auditEventsRefs {
    final manager = $$AuditEventsTableTableManager(
      $_db,
      $_db.auditEvents,
    ).filter((f) => f.interventionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_auditEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InterventionsTableFilterComposer
    extends Composer<_$AppDatabase, $InterventionsTable> {
  $$InterventionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelReference => $composableBuilder(
    column: $table.modelReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calibre => $composableBuilder(
    column: $table.calibre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get movementNumber => $composableBuilder(
    column: $table.movementNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get watchType => $composableBuilder(
    column: $table.watchType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get technician => $composableBuilder(
    column: $table.technician,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceOrientation => $composableBuilder(
    column: $table.referenceOrientation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get initialState => $composableBuilder(
    column: $table.initialState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentState => $composableBuilder(
    column: $table.documentState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rootDocumentUri => $composableBuilder(
    column: $table.rootDocumentUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get folderName => $composableBuilder(
    column: $table.folderName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextOperationNumber => $composableBuilder(
    column: $table.nextOperationNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextPartNumber => $composableBuilder(
    column: $table.nextPartNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextScrewNumber => $composableBuilder(
    column: $table.nextScrewNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextWheelNumber => $composableBuilder(
    column: $table.nextWheelNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextSpringNumber => $composableBuilder(
    column: $table.nextSpringNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedBy => $composableBuilder(
    column: $table.deletedBy,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> disassemblyOperationsRefs(
    Expression<bool> Function($$DisassemblyOperationsTableFilterComposer f) f,
  ) {
    final $$DisassemblyOperationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.interventionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableFilterComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> photoAssetsRefs(
    Expression<bool> Function($$PhotoAssetsTableFilterComposer f) f,
  ) {
    final $$PhotoAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableFilterComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> componentsRefs(
    Expression<bool> Function($$ComponentsTableFilterComposer f) f,
  ) {
    final $$ComponentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.components,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComponentsTableFilterComposer(
            $db: $db,
            $table: $db.components,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> backupRecordsRefs(
    Expression<bool> Function($$BackupRecordsTableFilterComposer f) f,
  ) {
    final $$BackupRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.backupRecords,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BackupRecordsTableFilterComposer(
            $db: $db,
            $table: $db.backupRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> diagnosticFindingsRefs(
    Expression<bool> Function($$DiagnosticFindingsTableFilterComposer f) f,
  ) {
    final $$DiagnosticFindingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diagnosticFindings,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosticFindingsTableFilterComposer(
            $db: $db,
            $table: $db.diagnosticFindings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> criticalChecklistItemsRefs(
    Expression<bool> Function($$CriticalChecklistItemsTableFilterComposer f) f,
  ) {
    final $$CriticalChecklistItemsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.criticalChecklistItems,
          getReferencedColumn: (t) => t.interventionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CriticalChecklistItemsTableFilterComposer(
                $db: $db,
                $table: $db.criticalChecklistItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> auditEventsRefs(
    Expression<bool> Function($$AuditEventsTableFilterComposer f) f,
  ) {
    final $$AuditEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditEvents,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEventsTableFilterComposer(
            $db: $db,
            $table: $db.auditEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InterventionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InterventionsTable> {
  $$InterventionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelReference => $composableBuilder(
    column: $table.modelReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calibre => $composableBuilder(
    column: $table.calibre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movementNumber => $composableBuilder(
    column: $table.movementNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get watchType => $composableBuilder(
    column: $table.watchType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get technician => $composableBuilder(
    column: $table.technician,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceOrientation => $composableBuilder(
    column: $table.referenceOrientation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get initialState => $composableBuilder(
    column: $table.initialState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentState => $composableBuilder(
    column: $table.documentState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rootDocumentUri => $composableBuilder(
    column: $table.rootDocumentUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get folderName => $composableBuilder(
    column: $table.folderName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextOperationNumber => $composableBuilder(
    column: $table.nextOperationNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextPartNumber => $composableBuilder(
    column: $table.nextPartNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextScrewNumber => $composableBuilder(
    column: $table.nextScrewNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextWheelNumber => $composableBuilder(
    column: $table.nextWheelNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextSpringNumber => $composableBuilder(
    column: $table.nextSpringNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedBy => $composableBuilder(
    column: $table.deletedBy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InterventionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterventionsTable> {
  $$InterventionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get modelReference => $composableBuilder(
    column: $table.modelReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get calibre =>
      $composableBuilder(column: $table.calibre, builder: (column) => column);

  GeneratedColumn<String> get movementNumber => $composableBuilder(
    column: $table.movementNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get watchType =>
      $composableBuilder(column: $table.watchType, builder: (column) => column);

  GeneratedColumn<String> get technician => $composableBuilder(
    column: $table.technician,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referenceOrientation => $composableBuilder(
    column: $table.referenceOrientation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get initialState => $composableBuilder(
    column: $table.initialState,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get documentState => $composableBuilder(
    column: $table.documentState,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rootDocumentUri => $composableBuilder(
    column: $table.rootDocumentUri,
    builder: (column) => column,
  );

  GeneratedColumn<String> get folderName => $composableBuilder(
    column: $table.folderName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextOperationNumber => $composableBuilder(
    column: $table.nextOperationNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextPartNumber => $composableBuilder(
    column: $table.nextPartNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextScrewNumber => $composableBuilder(
    column: $table.nextScrewNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextWheelNumber => $composableBuilder(
    column: $table.nextWheelNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextSpringNumber => $composableBuilder(
    column: $table.nextSpringNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get deletedBy =>
      $composableBuilder(column: $table.deletedBy, builder: (column) => column);

  Expression<T> disassemblyOperationsRefs<T extends Object>(
    Expression<T> Function($$DisassemblyOperationsTableAnnotationComposer a) f,
  ) {
    final $$DisassemblyOperationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.interventionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableAnnotationComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> photoAssetsRefs<T extends Object>(
    Expression<T> Function($$PhotoAssetsTableAnnotationComposer a) f,
  ) {
    final $$PhotoAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> componentsRefs<T extends Object>(
    Expression<T> Function($$ComponentsTableAnnotationComposer a) f,
  ) {
    final $$ComponentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.components,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComponentsTableAnnotationComposer(
            $db: $db,
            $table: $db.components,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> backupRecordsRefs<T extends Object>(
    Expression<T> Function($$BackupRecordsTableAnnotationComposer a) f,
  ) {
    final $$BackupRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.backupRecords,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BackupRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.backupRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> diagnosticFindingsRefs<T extends Object>(
    Expression<T> Function($$DiagnosticFindingsTableAnnotationComposer a) f,
  ) {
    final $$DiagnosticFindingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.diagnosticFindings,
          getReferencedColumn: (t) => t.interventionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DiagnosticFindingsTableAnnotationComposer(
                $db: $db,
                $table: $db.diagnosticFindings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> criticalChecklistItemsRefs<T extends Object>(
    Expression<T> Function($$CriticalChecklistItemsTableAnnotationComposer a) f,
  ) {
    final $$CriticalChecklistItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.criticalChecklistItems,
          getReferencedColumn: (t) => t.interventionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CriticalChecklistItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.criticalChecklistItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> auditEventsRefs<T extends Object>(
    Expression<T> Function($$AuditEventsTableAnnotationComposer a) f,
  ) {
    final $$AuditEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditEvents,
      getReferencedColumn: (t) => t.interventionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.auditEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InterventionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterventionsTable,
          Intervention,
          $$InterventionsTableFilterComposer,
          $$InterventionsTableOrderingComposer,
          $$InterventionsTableAnnotationComposer,
          $$InterventionsTableCreateCompanionBuilder,
          $$InterventionsTableUpdateCompanionBuilder,
          (Intervention, $$InterventionsTableReferences),
          Intervention,
          PrefetchHooks Function({
            bool disassemblyOperationsRefs,
            bool photoAssetsRefs,
            bool componentsRefs,
            bool backupRecordsRefs,
            bool diagnosticFindingsRefs,
            bool criticalChecklistItemsRefs,
            bool auditEventsRefs,
          })
        > {
  $$InterventionsTableTableManager(_$AppDatabase db, $InterventionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InterventionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InterventionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InterventionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> brand = const Value.absent(),
                Value<String?> modelReference = const Value.absent(),
                Value<String?> calibre = const Value.absent(),
                Value<String?> movementNumber = const Value.absent(),
                Value<String> watchType = const Value.absent(),
                Value<String> technician = const Value.absent(),
                Value<String> referenceOrientation = const Value.absent(),
                Value<String?> initialState = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> documentState = const Value.absent(),
                Value<String> rootDocumentUri = const Value.absent(),
                Value<String> folderName = const Value.absent(),
                Value<int> nextOperationNumber = const Value.absent(),
                Value<int> nextPartNumber = const Value.absent(),
                Value<int> nextScrewNumber = const Value.absent(),
                Value<int> nextWheelNumber = const Value.absent(),
                Value<int> nextSpringNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> deletedBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InterventionsCompanion(
                id: id,
                code: code,
                brand: brand,
                modelReference: modelReference,
                calibre: calibre,
                movementNumber: movementNumber,
                watchType: watchType,
                technician: technician,
                referenceOrientation: referenceOrientation,
                initialState: initialState,
                status: status,
                documentState: documentState,
                rootDocumentUri: rootDocumentUri,
                folderName: folderName,
                nextOperationNumber: nextOperationNumber,
                nextPartNumber: nextPartNumber,
                nextScrewNumber: nextScrewNumber,
                nextWheelNumber: nextWheelNumber,
                nextSpringNumber: nextSpringNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                deletedBy: deletedBy,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String brand,
                Value<String?> modelReference = const Value.absent(),
                Value<String?> calibre = const Value.absent(),
                Value<String?> movementNumber = const Value.absent(),
                required String watchType,
                required String technician,
                required String referenceOrientation,
                Value<String?> initialState = const Value.absent(),
                required String status,
                required String documentState,
                required String rootDocumentUri,
                required String folderName,
                Value<int> nextOperationNumber = const Value.absent(),
                Value<int> nextPartNumber = const Value.absent(),
                Value<int> nextScrewNumber = const Value.absent(),
                Value<int> nextWheelNumber = const Value.absent(),
                Value<int> nextSpringNumber = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> deletedBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InterventionsCompanion.insert(
                id: id,
                code: code,
                brand: brand,
                modelReference: modelReference,
                calibre: calibre,
                movementNumber: movementNumber,
                watchType: watchType,
                technician: technician,
                referenceOrientation: referenceOrientation,
                initialState: initialState,
                status: status,
                documentState: documentState,
                rootDocumentUri: rootDocumentUri,
                folderName: folderName,
                nextOperationNumber: nextOperationNumber,
                nextPartNumber: nextPartNumber,
                nextScrewNumber: nextScrewNumber,
                nextWheelNumber: nextWheelNumber,
                nextSpringNumber: nextSpringNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                deletedBy: deletedBy,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InterventionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                disassemblyOperationsRefs = false,
                photoAssetsRefs = false,
                componentsRefs = false,
                backupRecordsRefs = false,
                diagnosticFindingsRefs = false,
                criticalChecklistItemsRefs = false,
                auditEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (disassemblyOperationsRefs) db.disassemblyOperations,
                    if (photoAssetsRefs) db.photoAssets,
                    if (componentsRefs) db.components,
                    if (backupRecordsRefs) db.backupRecords,
                    if (diagnosticFindingsRefs) db.diagnosticFindings,
                    if (criticalChecklistItemsRefs) db.criticalChecklistItems,
                    if (auditEventsRefs) db.auditEvents,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (disassemblyOperationsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          DisassemblyOperation
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._disassemblyOperationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).disassemblyOperationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (photoAssetsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          PhotoAsset
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._photoAssetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).photoAssetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (componentsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          Component
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._componentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).componentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (backupRecordsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          BackupRecord
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._backupRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).backupRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (diagnosticFindingsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          DiagnosticFinding
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._diagnosticFindingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).diagnosticFindingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (criticalChecklistItemsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          CriticalChecklistItem
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._criticalChecklistItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).criticalChecklistItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (auditEventsRefs)
                        await $_getPrefetchedData<
                          Intervention,
                          $InterventionsTable,
                          AuditEvent
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionsTableReferences
                              ._auditEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionsTableReferences(
                                db,
                                table,
                                p0,
                              ).auditEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InterventionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterventionsTable,
      Intervention,
      $$InterventionsTableFilterComposer,
      $$InterventionsTableOrderingComposer,
      $$InterventionsTableAnnotationComposer,
      $$InterventionsTableCreateCompanionBuilder,
      $$InterventionsTableUpdateCompanionBuilder,
      (Intervention, $$InterventionsTableReferences),
      Intervention,
      PrefetchHooks Function({
        bool disassemblyOperationsRefs,
        bool photoAssetsRefs,
        bool componentsRefs,
        bool backupRecordsRefs,
        bool diagnosticFindingsRefs,
        bool criticalChecklistItemsRefs,
        bool auditEventsRefs,
      })
    >;
typedef $$DisassemblyOperationsTableCreateCompanionBuilder =
    DisassemblyOperationsCompanion Function({
      required String id,
      required String interventionId,
      required String code,
      required int sequence,
      required String title,
      Value<String?> system,
      Value<String?> description,
      Value<String?> tray,
      Value<String?> orientation,
      Value<String?> notes,
      required String status,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> deletedBy,
      Value<int> rowid,
    });
typedef $$DisassemblyOperationsTableUpdateCompanionBuilder =
    DisassemblyOperationsCompanion Function({
      Value<String> id,
      Value<String> interventionId,
      Value<String> code,
      Value<int> sequence,
      Value<String> title,
      Value<String?> system,
      Value<String?> description,
      Value<String?> tray,
      Value<String?> orientation,
      Value<String?> notes,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> deletedBy,
      Value<int> rowid,
    });

final class $$DisassemblyOperationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DisassemblyOperationsTable,
          DisassemblyOperation
        > {
  $$DisassemblyOperationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) =>
      db.interventions.createAlias(
        'disassembly_operations__intervention_id__interventions__id',
      );

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PhotoAssetsTable, List<PhotoAsset>>
  _photoAssetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.photoAssets,
    aliasName: 'disassembly_operations__id__photo_assets__operation_id',
  );

  $$PhotoAssetsTableProcessedTableManager get photoAssetsRefs {
    final manager = $$PhotoAssetsTableTableManager(
      $_db,
      $_db.photoAssets,
    ).filter((f) => f.operationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_photoAssetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ComponentsTable, List<Component>>
  _componentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.components,
    aliasName: 'disassembly_operations__id__components__operation_id',
  );

  $$ComponentsTableProcessedTableManager get componentsRefs {
    final manager = $$ComponentsTableTableManager(
      $_db,
      $_db.components,
    ).filter((f) => f.operationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_componentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiagnosticFindingsTable, List<DiagnosticFinding>>
  _diagnosticFindingsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.diagnosticFindings,
        aliasName:
            'disassembly_operations__id__diagnostic_findings__operation_id',
      );

  $$DiagnosticFindingsTableProcessedTableManager get diagnosticFindingsRefs {
    final manager = $$DiagnosticFindingsTableTableManager(
      $_db,
      $_db.diagnosticFindings,
    ).filter((f) => f.operationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _diagnosticFindingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DisassemblyOperationsTableFilterComposer
    extends Composer<_$AppDatabase, $DisassemblyOperationsTable> {
  $$DisassemblyOperationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get system => $composableBuilder(
    column: $table.system,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tray => $composableBuilder(
    column: $table.tray,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orientation => $composableBuilder(
    column: $table.orientation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedBy => $composableBuilder(
    column: $table.deletedBy,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> photoAssetsRefs(
    Expression<bool> Function($$PhotoAssetsTableFilterComposer f) f,
  ) {
    final $$PhotoAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.operationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableFilterComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> componentsRefs(
    Expression<bool> Function($$ComponentsTableFilterComposer f) f,
  ) {
    final $$ComponentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.components,
      getReferencedColumn: (t) => t.operationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComponentsTableFilterComposer(
            $db: $db,
            $table: $db.components,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> diagnosticFindingsRefs(
    Expression<bool> Function($$DiagnosticFindingsTableFilterComposer f) f,
  ) {
    final $$DiagnosticFindingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diagnosticFindings,
      getReferencedColumn: (t) => t.operationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosticFindingsTableFilterComposer(
            $db: $db,
            $table: $db.diagnosticFindings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DisassemblyOperationsTableOrderingComposer
    extends Composer<_$AppDatabase, $DisassemblyOperationsTable> {
  $$DisassemblyOperationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get system => $composableBuilder(
    column: $table.system,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tray => $composableBuilder(
    column: $table.tray,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orientation => $composableBuilder(
    column: $table.orientation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedBy => $composableBuilder(
    column: $table.deletedBy,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DisassemblyOperationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DisassemblyOperationsTable> {
  $$DisassemblyOperationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get system =>
      $composableBuilder(column: $table.system, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tray =>
      $composableBuilder(column: $table.tray, builder: (column) => column);

  GeneratedColumn<String> get orientation => $composableBuilder(
    column: $table.orientation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get deletedBy =>
      $composableBuilder(column: $table.deletedBy, builder: (column) => column);

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> photoAssetsRefs<T extends Object>(
    Expression<T> Function($$PhotoAssetsTableAnnotationComposer a) f,
  ) {
    final $$PhotoAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.operationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> componentsRefs<T extends Object>(
    Expression<T> Function($$ComponentsTableAnnotationComposer a) f,
  ) {
    final $$ComponentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.components,
      getReferencedColumn: (t) => t.operationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComponentsTableAnnotationComposer(
            $db: $db,
            $table: $db.components,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> diagnosticFindingsRefs<T extends Object>(
    Expression<T> Function($$DiagnosticFindingsTableAnnotationComposer a) f,
  ) {
    final $$DiagnosticFindingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.diagnosticFindings,
          getReferencedColumn: (t) => t.operationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DiagnosticFindingsTableAnnotationComposer(
                $db: $db,
                $table: $db.diagnosticFindings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DisassemblyOperationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DisassemblyOperationsTable,
          DisassemblyOperation,
          $$DisassemblyOperationsTableFilterComposer,
          $$DisassemblyOperationsTableOrderingComposer,
          $$DisassemblyOperationsTableAnnotationComposer,
          $$DisassemblyOperationsTableCreateCompanionBuilder,
          $$DisassemblyOperationsTableUpdateCompanionBuilder,
          (DisassemblyOperation, $$DisassemblyOperationsTableReferences),
          DisassemblyOperation,
          PrefetchHooks Function({
            bool interventionId,
            bool photoAssetsRefs,
            bool componentsRefs,
            bool diagnosticFindingsRefs,
          })
        > {
  $$DisassemblyOperationsTableTableManager(
    _$AppDatabase db,
    $DisassemblyOperationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DisassemblyOperationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DisassemblyOperationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DisassemblyOperationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<int> sequence = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> system = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> tray = const Value.absent(),
                Value<String?> orientation = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> deletedBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DisassemblyOperationsCompanion(
                id: id,
                interventionId: interventionId,
                code: code,
                sequence: sequence,
                title: title,
                system: system,
                description: description,
                tray: tray,
                orientation: orientation,
                notes: notes,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                deletedBy: deletedBy,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String code,
                required int sequence,
                required String title,
                Value<String?> system = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> tray = const Value.absent(),
                Value<String?> orientation = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String status,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> deletedBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DisassemblyOperationsCompanion.insert(
                id: id,
                interventionId: interventionId,
                code: code,
                sequence: sequence,
                title: title,
                system: system,
                description: description,
                tray: tray,
                orientation: orientation,
                notes: notes,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                deletedBy: deletedBy,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DisassemblyOperationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                interventionId = false,
                photoAssetsRefs = false,
                componentsRefs = false,
                diagnosticFindingsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (photoAssetsRefs) db.photoAssets,
                    if (componentsRefs) db.components,
                    if (diagnosticFindingsRefs) db.diagnosticFindings,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (interventionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.interventionId,
                            referencedTable:
                                $$DisassemblyOperationsTableReferences
                                    ._interventionIdTable(db),
                            referencedColumn:
                                $$DisassemblyOperationsTableReferences
                                    ._interventionIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (photoAssetsRefs)
                        await $_getPrefetchedData<
                          DisassemblyOperation,
                          $DisassemblyOperationsTable,
                          PhotoAsset
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DisassemblyOperationsTableReferences
                                  ._photoAssetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DisassemblyOperationsTableReferences(
                                db,
                                table,
                                p0,
                              ).photoAssetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.operationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (componentsRefs)
                        await $_getPrefetchedData<
                          DisassemblyOperation,
                          $DisassemblyOperationsTable,
                          Component
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DisassemblyOperationsTableReferences
                                  ._componentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DisassemblyOperationsTableReferences(
                                db,
                                table,
                                p0,
                              ).componentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.operationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (diagnosticFindingsRefs)
                        await $_getPrefetchedData<
                          DisassemblyOperation,
                          $DisassemblyOperationsTable,
                          DiagnosticFinding
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DisassemblyOperationsTableReferences
                                  ._diagnosticFindingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DisassemblyOperationsTableReferences(
                                db,
                                table,
                                p0,
                              ).diagnosticFindingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.operationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DisassemblyOperationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DisassemblyOperationsTable,
      DisassemblyOperation,
      $$DisassemblyOperationsTableFilterComposer,
      $$DisassemblyOperationsTableOrderingComposer,
      $$DisassemblyOperationsTableAnnotationComposer,
      $$DisassemblyOperationsTableCreateCompanionBuilder,
      $$DisassemblyOperationsTableUpdateCompanionBuilder,
      (DisassemblyOperation, $$DisassemblyOperationsTableReferences),
      DisassemblyOperation,
      PrefetchHooks Function({
        bool interventionId,
        bool photoAssetsRefs,
        bool componentsRefs,
        bool diagnosticFindingsRefs,
      })
    >;
typedef $$PhotoAssetsTableCreateCompanionBuilder =
    PhotoAssetsCompanion Function({
      required String id,
      required String interventionId,
      required String operationId,
      required String kind,
      required String relativePath,
      required String sha256,
      required int byteSize,
      required int width,
      required int height,
      required String thumbnailPath,
      required DateTime capturedAt,
      Value<bool> isOriginal,
      Value<String?> sourcePhotoId,
      Value<int> rowid,
    });
typedef $$PhotoAssetsTableUpdateCompanionBuilder =
    PhotoAssetsCompanion Function({
      Value<String> id,
      Value<String> interventionId,
      Value<String> operationId,
      Value<String> kind,
      Value<String> relativePath,
      Value<String> sha256,
      Value<int> byteSize,
      Value<int> width,
      Value<int> height,
      Value<String> thumbnailPath,
      Value<DateTime> capturedAt,
      Value<bool> isOriginal,
      Value<String?> sourcePhotoId,
      Value<int> rowid,
    });

final class $$PhotoAssetsTableReferences
    extends BaseReferences<_$AppDatabase, $PhotoAssetsTable, PhotoAsset> {
  $$PhotoAssetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) => db
      .interventions
      .createAlias('photo_assets__intervention_id__interventions__id');

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DisassemblyOperationsTable _operationIdTable(_$AppDatabase db) => db
      .disassemblyOperations
      .createAlias('photo_assets__operation_id__disassembly_operations__id');

  $$DisassemblyOperationsTableProcessedTableManager get operationId {
    final $_column = $_itemColumn<String>('operation_id')!;

    final manager = $$DisassemblyOperationsTableTableManager(
      $_db,
      $_db.disassemblyOperations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_operationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $AnnotationDocumentsTable,
    List<AnnotationDocument>
  >
  _annotationDocumentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.annotationDocuments,
        aliasName: 'photo_assets__id__annotation_documents__source_photo_id',
      );

  $$AnnotationDocumentsTableProcessedTableManager get annotationDocumentsRefs {
    final manager = $$AnnotationDocumentsTableTableManager(
      $_db,
      $_db.annotationDocuments,
    ).filter((f) => f.sourcePhotoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _annotationDocumentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PhotoAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoAssetsTable> {
  $$PhotoAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOriginal => $composableBuilder(
    column: $table.isOriginal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourcePhotoId => $composableBuilder(
    column: $table.sourcePhotoId,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableFilterComposer get operationId {
    final $$DisassemblyOperationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableFilterComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<bool> annotationDocumentsRefs(
    Expression<bool> Function($$AnnotationDocumentsTableFilterComposer f) f,
  ) {
    final $$AnnotationDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.annotationDocuments,
      getReferencedColumn: (t) => t.sourcePhotoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnnotationDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.annotationDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PhotoAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoAssetsTable> {
  $$PhotoAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOriginal => $composableBuilder(
    column: $table.isOriginal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourcePhotoId => $composableBuilder(
    column: $table.sourcePhotoId,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableOrderingComposer get operationId {
    final $$DisassemblyOperationsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableOrderingComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$PhotoAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoAssetsTable> {
  $$PhotoAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<int> get byteSize =>
      $composableBuilder(column: $table.byteSize, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOriginal => $composableBuilder(
    column: $table.isOriginal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourcePhotoId => $composableBuilder(
    column: $table.sourcePhotoId,
    builder: (column) => column,
  );

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableAnnotationComposer get operationId {
    final $$DisassemblyOperationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableAnnotationComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> annotationDocumentsRefs<T extends Object>(
    Expression<T> Function($$AnnotationDocumentsTableAnnotationComposer a) f,
  ) {
    final $$AnnotationDocumentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.annotationDocuments,
          getReferencedColumn: (t) => t.sourcePhotoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnnotationDocumentsTableAnnotationComposer(
                $db: $db,
                $table: $db.annotationDocuments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PhotoAssetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoAssetsTable,
          PhotoAsset,
          $$PhotoAssetsTableFilterComposer,
          $$PhotoAssetsTableOrderingComposer,
          $$PhotoAssetsTableAnnotationComposer,
          $$PhotoAssetsTableCreateCompanionBuilder,
          $$PhotoAssetsTableUpdateCompanionBuilder,
          (PhotoAsset, $$PhotoAssetsTableReferences),
          PhotoAsset,
          PrefetchHooks Function({
            bool interventionId,
            bool operationId,
            bool annotationDocumentsRefs,
          })
        > {
  $$PhotoAssetsTableTableManager(_$AppDatabase db, $PhotoAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> operationId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<String> sha256 = const Value.absent(),
                Value<int> byteSize = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<String> thumbnailPath = const Value.absent(),
                Value<DateTime> capturedAt = const Value.absent(),
                Value<bool> isOriginal = const Value.absent(),
                Value<String?> sourcePhotoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoAssetsCompanion(
                id: id,
                interventionId: interventionId,
                operationId: operationId,
                kind: kind,
                relativePath: relativePath,
                sha256: sha256,
                byteSize: byteSize,
                width: width,
                height: height,
                thumbnailPath: thumbnailPath,
                capturedAt: capturedAt,
                isOriginal: isOriginal,
                sourcePhotoId: sourcePhotoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String operationId,
                required String kind,
                required String relativePath,
                required String sha256,
                required int byteSize,
                required int width,
                required int height,
                required String thumbnailPath,
                required DateTime capturedAt,
                Value<bool> isOriginal = const Value.absent(),
                Value<String?> sourcePhotoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoAssetsCompanion.insert(
                id: id,
                interventionId: interventionId,
                operationId: operationId,
                kind: kind,
                relativePath: relativePath,
                sha256: sha256,
                byteSize: byteSize,
                width: width,
                height: height,
                thumbnailPath: thumbnailPath,
                capturedAt: capturedAt,
                isOriginal: isOriginal,
                sourcePhotoId: sourcePhotoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PhotoAssetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                interventionId = false,
                operationId = false,
                annotationDocumentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (annotationDocumentsRefs) db.annotationDocuments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (interventionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.interventionId,
                            referencedTable: $$PhotoAssetsTableReferences
                                ._interventionIdTable(db),
                            referencedColumn: $$PhotoAssetsTableReferences
                                ._interventionIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (operationId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.operationId,
                            referencedTable: $$PhotoAssetsTableReferences
                                ._operationIdTable(db),
                            referencedColumn: $$PhotoAssetsTableReferences
                                ._operationIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (annotationDocumentsRefs)
                        await $_getPrefetchedData<
                          PhotoAsset,
                          $PhotoAssetsTable,
                          AnnotationDocument
                        >(
                          currentTable: table,
                          referencedTable: $$PhotoAssetsTableReferences
                              ._annotationDocumentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PhotoAssetsTableReferences(
                                db,
                                table,
                                p0,
                              ).annotationDocumentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourcePhotoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PhotoAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoAssetsTable,
      PhotoAsset,
      $$PhotoAssetsTableFilterComposer,
      $$PhotoAssetsTableOrderingComposer,
      $$PhotoAssetsTableAnnotationComposer,
      $$PhotoAssetsTableCreateCompanionBuilder,
      $$PhotoAssetsTableUpdateCompanionBuilder,
      (PhotoAsset, $$PhotoAssetsTableReferences),
      PhotoAsset,
      PrefetchHooks Function({
        bool interventionId,
        bool operationId,
        bool annotationDocumentsRefs,
      })
    >;
typedef $$AnnotationDocumentsTableCreateCompanionBuilder =
    AnnotationDocumentsCompanion Function({
      required String id,
      required String sourcePhotoId,
      required int canvasWidth,
      required int canvasHeight,
      required String elementsJson,
      Value<String?> renderedPhotoId,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AnnotationDocumentsTableUpdateCompanionBuilder =
    AnnotationDocumentsCompanion Function({
      Value<String> id,
      Value<String> sourcePhotoId,
      Value<int> canvasWidth,
      Value<int> canvasHeight,
      Value<String> elementsJson,
      Value<String?> renderedPhotoId,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AnnotationDocumentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnnotationDocumentsTable,
          AnnotationDocument
        > {
  $$AnnotationDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PhotoAssetsTable _sourcePhotoIdTable(_$AppDatabase db) => db
      .photoAssets
      .createAlias('annotation_documents__source_photo_id__photo_assets__id');

  $$PhotoAssetsTableProcessedTableManager get sourcePhotoId {
    final $_column = $_itemColumn<String>('source_photo_id')!;

    final manager = $$PhotoAssetsTableTableManager(
      $_db,
      $_db.photoAssets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourcePhotoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnnotationDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $AnnotationDocumentsTable> {
  $$AnnotationDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get canvasWidth => $composableBuilder(
    column: $table.canvasWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get canvasHeight => $composableBuilder(
    column: $table.canvasHeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get elementsJson => $composableBuilder(
    column: $table.elementsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get renderedPhotoId => $composableBuilder(
    column: $table.renderedPhotoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PhotoAssetsTableFilterComposer get sourcePhotoId {
    final $$PhotoAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourcePhotoId,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableFilterComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnnotationDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnnotationDocumentsTable> {
  $$AnnotationDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get canvasWidth => $composableBuilder(
    column: $table.canvasWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get canvasHeight => $composableBuilder(
    column: $table.canvasHeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get elementsJson => $composableBuilder(
    column: $table.elementsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get renderedPhotoId => $composableBuilder(
    column: $table.renderedPhotoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PhotoAssetsTableOrderingComposer get sourcePhotoId {
    final $$PhotoAssetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourcePhotoId,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableOrderingComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnnotationDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnnotationDocumentsTable> {
  $$AnnotationDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get canvasWidth => $composableBuilder(
    column: $table.canvasWidth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get canvasHeight => $composableBuilder(
    column: $table.canvasHeight,
    builder: (column) => column,
  );

  GeneratedColumn<String> get elementsJson => $composableBuilder(
    column: $table.elementsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get renderedPhotoId => $composableBuilder(
    column: $table.renderedPhotoId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PhotoAssetsTableAnnotationComposer get sourcePhotoId {
    final $$PhotoAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourcePhotoId,
      referencedTable: $db.photoAssets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.photoAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnnotationDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnnotationDocumentsTable,
          AnnotationDocument,
          $$AnnotationDocumentsTableFilterComposer,
          $$AnnotationDocumentsTableOrderingComposer,
          $$AnnotationDocumentsTableAnnotationComposer,
          $$AnnotationDocumentsTableCreateCompanionBuilder,
          $$AnnotationDocumentsTableUpdateCompanionBuilder,
          (AnnotationDocument, $$AnnotationDocumentsTableReferences),
          AnnotationDocument,
          PrefetchHooks Function({bool sourcePhotoId})
        > {
  $$AnnotationDocumentsTableTableManager(
    _$AppDatabase db,
    $AnnotationDocumentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnnotationDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnnotationDocumentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnnotationDocumentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sourcePhotoId = const Value.absent(),
                Value<int> canvasWidth = const Value.absent(),
                Value<int> canvasHeight = const Value.absent(),
                Value<String> elementsJson = const Value.absent(),
                Value<String?> renderedPhotoId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnnotationDocumentsCompanion(
                id: id,
                sourcePhotoId: sourcePhotoId,
                canvasWidth: canvasWidth,
                canvasHeight: canvasHeight,
                elementsJson: elementsJson,
                renderedPhotoId: renderedPhotoId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sourcePhotoId,
                required int canvasWidth,
                required int canvasHeight,
                required String elementsJson,
                Value<String?> renderedPhotoId = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AnnotationDocumentsCompanion.insert(
                id: id,
                sourcePhotoId: sourcePhotoId,
                canvasWidth: canvasWidth,
                canvasHeight: canvasHeight,
                elementsJson: elementsJson,
                renderedPhotoId: renderedPhotoId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnnotationDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sourcePhotoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sourcePhotoId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sourcePhotoId,
                        referencedTable: $$AnnotationDocumentsTableReferences
                            ._sourcePhotoIdTable(db),
                        referencedColumn: $$AnnotationDocumentsTableReferences
                            ._sourcePhotoIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AnnotationDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnnotationDocumentsTable,
      AnnotationDocument,
      $$AnnotationDocumentsTableFilterComposer,
      $$AnnotationDocumentsTableOrderingComposer,
      $$AnnotationDocumentsTableAnnotationComposer,
      $$AnnotationDocumentsTableCreateCompanionBuilder,
      $$AnnotationDocumentsTableUpdateCompanionBuilder,
      (AnnotationDocument, $$AnnotationDocumentsTableReferences),
      AnnotationDocument,
      PrefetchHooks Function({bool sourcePhotoId})
    >;
typedef $$ComponentsTableCreateCompanionBuilder = ComponentsCompanion Function({
  required String id,
  required String interventionId,
  required String operationId,
  required String code,
  required String type,
  required String description,
  required int quantity,
  Value<String?> position,
  Value<String?> orientation,
  required String tray,
  Value<String?> notes,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$ComponentsTableUpdateCompanionBuilder = ComponentsCompanion Function({
  Value<String> id,
  Value<String> interventionId,
  Value<String> operationId,
  Value<String> code,
  Value<String> type,
  Value<String> description,
  Value<int> quantity,
  Value<String?> position,
  Value<String?> orientation,
  Value<String> tray,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$ComponentsTableReferences
    extends BaseReferences<_$AppDatabase, $ComponentsTable, Component> {
  $$ComponentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) => db
      .interventions
      .createAlias('components__intervention_id__interventions__id');

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DisassemblyOperationsTable _operationIdTable(_$AppDatabase db) => db
      .disassemblyOperations
      .createAlias('components__operation_id__disassembly_operations__id');

  $$DisassemblyOperationsTableProcessedTableManager get operationId {
    final $_column = $_itemColumn<String>('operation_id')!;

    final manager = $$DisassemblyOperationsTableTableManager(
      $_db,
      $_db.disassemblyOperations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_operationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ComponentsTableFilterComposer
    extends Composer<_$AppDatabase, $ComponentsTable> {
  $$ComponentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orientation => $composableBuilder(
    column: $table.orientation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tray => $composableBuilder(
    column: $table.tray,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableFilterComposer get operationId {
    final $$DisassemblyOperationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableFilterComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ComponentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ComponentsTable> {
  $$ComponentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orientation => $composableBuilder(
    column: $table.orientation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tray => $composableBuilder(
    column: $table.tray,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableOrderingComposer get operationId {
    final $$DisassemblyOperationsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableOrderingComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ComponentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ComponentsTable> {
  $$ComponentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get orientation => $composableBuilder(
    column: $table.orientation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tray =>
      $composableBuilder(column: $table.tray, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableAnnotationComposer get operationId {
    final $$DisassemblyOperationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableAnnotationComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ComponentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ComponentsTable,
          Component,
          $$ComponentsTableFilterComposer,
          $$ComponentsTableOrderingComposer,
          $$ComponentsTableAnnotationComposer,
          $$ComponentsTableCreateCompanionBuilder,
          $$ComponentsTableUpdateCompanionBuilder,
          (Component, $$ComponentsTableReferences),
          Component,
          PrefetchHooks Function({bool interventionId, bool operationId})
        > {
  $$ComponentsTableTableManager(_$AppDatabase db, $ComponentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> operationId = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> orientation = const Value.absent(),
                Value<String> tray = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComponentsCompanion(
                id: id,
                interventionId: interventionId,
                operationId: operationId,
                code: code,
                type: type,
                description: description,
                quantity: quantity,
                position: position,
                orientation: orientation,
                tray: tray,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String operationId,
                required String code,
                required String type,
                required String description,
                required int quantity,
                Value<String?> position = const Value.absent(),
                Value<String?> orientation = const Value.absent(),
                required String tray,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ComponentsCompanion.insert(
                id: id,
                interventionId: interventionId,
                operationId: operationId,
                code: code,
                type: type,
                description: description,
                quantity: quantity,
                position: position,
                orientation: orientation,
                tray: tray,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ComponentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({interventionId = false, operationId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (interventionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.interventionId,
                            referencedTable: $$ComponentsTableReferences
                                ._interventionIdTable(db),
                            referencedColumn: $$ComponentsTableReferences
                                ._interventionIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (operationId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.operationId,
                            referencedTable: $$ComponentsTableReferences
                                ._operationIdTable(db),
                            referencedColumn: $$ComponentsTableReferences
                                ._operationIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ComponentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ComponentsTable,
      Component,
      $$ComponentsTableFilterComposer,
      $$ComponentsTableOrderingComposer,
      $$ComponentsTableAnnotationComposer,
      $$ComponentsTableCreateCompanionBuilder,
      $$ComponentsTableUpdateCompanionBuilder,
      (Component, $$ComponentsTableReferences),
      Component,
      PrefetchHooks Function({bool interventionId, bool operationId})
    >;
typedef $$BackupRecordsTableCreateCompanionBuilder =
    BackupRecordsCompanion Function({
      required String id,
      required String interventionId,
      required String destinationUri,
      required String manifestSha256,
      required String status,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<String?> errorCode,
      Value<int> rowid,
    });
typedef $$BackupRecordsTableUpdateCompanionBuilder =
    BackupRecordsCompanion Function({
      Value<String> id,
      Value<String> interventionId,
      Value<String> destinationUri,
      Value<String> manifestSha256,
      Value<String> status,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String?> errorCode,
      Value<int> rowid,
    });

final class $$BackupRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $BackupRecordsTable, BackupRecord> {
  $$BackupRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) => db
      .interventions
      .createAlias('backup_records__intervention_id__interventions__id');

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BackupRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $BackupRecordsTable> {
  $$BackupRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destinationUri => $composableBuilder(
    column: $table.destinationUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manifestSha256 => $composableBuilder(
    column: $table.manifestSha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BackupRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupRecordsTable> {
  $$BackupRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destinationUri => $composableBuilder(
    column: $table.destinationUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manifestSha256 => $composableBuilder(
    column: $table.manifestSha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BackupRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupRecordsTable> {
  $$BackupRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get destinationUri => $composableBuilder(
    column: $table.destinationUri,
    builder: (column) => column,
  );

  GeneratedColumn<String> get manifestSha256 => $composableBuilder(
    column: $table.manifestSha256,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BackupRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupRecordsTable,
          BackupRecord,
          $$BackupRecordsTableFilterComposer,
          $$BackupRecordsTableOrderingComposer,
          $$BackupRecordsTableAnnotationComposer,
          $$BackupRecordsTableCreateCompanionBuilder,
          $$BackupRecordsTableUpdateCompanionBuilder,
          (BackupRecord, $$BackupRecordsTableReferences),
          BackupRecord,
          PrefetchHooks Function({bool interventionId})
        > {
  $$BackupRecordsTableTableManager(_$AppDatabase db, $BackupRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> destinationUri = const Value.absent(),
                Value<String> manifestSha256 = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupRecordsCompanion(
                id: id,
                interventionId: interventionId,
                destinationUri: destinationUri,
                manifestSha256: manifestSha256,
                status: status,
                startedAt: startedAt,
                completedAt: completedAt,
                errorCode: errorCode,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String destinationUri,
                required String manifestSha256,
                required String status,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupRecordsCompanion.insert(
                id: id,
                interventionId: interventionId,
                destinationUri: destinationUri,
                manifestSha256: manifestSha256,
                status: status,
                startedAt: startedAt,
                completedAt: completedAt,
                errorCode: errorCode,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BackupRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({interventionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (interventionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.interventionId,
                        referencedTable: $$BackupRecordsTableReferences
                            ._interventionIdTable(db),
                        referencedColumn: $$BackupRecordsTableReferences
                            ._interventionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BackupRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupRecordsTable,
      BackupRecord,
      $$BackupRecordsTableFilterComposer,
      $$BackupRecordsTableOrderingComposer,
      $$BackupRecordsTableAnnotationComposer,
      $$BackupRecordsTableCreateCompanionBuilder,
      $$BackupRecordsTableUpdateCompanionBuilder,
      (BackupRecord, $$BackupRecordsTableReferences),
      BackupRecord,
      PrefetchHooks Function({bool interventionId})
    >;
typedef $$DiagnosticFindingsTableCreateCompanionBuilder =
    DiagnosticFindingsCompanion Function({
      required String id,
      required String interventionId,
      required String operationId,
      required String code,
      required String zone,
      required String category,
      required String description,
      required String severity,
      Value<String?> photoAssetId,
      Value<String?> proposedAction,
      required String status,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$DiagnosticFindingsTableUpdateCompanionBuilder =
    DiagnosticFindingsCompanion Function({
      Value<String> id,
      Value<String> interventionId,
      Value<String> operationId,
      Value<String> code,
      Value<String> zone,
      Value<String> category,
      Value<String> description,
      Value<String> severity,
      Value<String?> photoAssetId,
      Value<String?> proposedAction,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$DiagnosticFindingsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DiagnosticFindingsTable,
          DiagnosticFinding
        > {
  $$DiagnosticFindingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) => db
      .interventions
      .createAlias('diagnostic_findings__intervention_id__interventions__id');

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DisassemblyOperationsTable _operationIdTable(_$AppDatabase db) =>
      db.disassemblyOperations.createAlias(
        'diagnostic_findings__operation_id__disassembly_operations__id',
      );

  $$DisassemblyOperationsTableProcessedTableManager get operationId {
    final $_column = $_itemColumn<String>('operation_id')!;

    final manager = $$DisassemblyOperationsTableTableManager(
      $_db,
      $_db.disassemblyOperations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_operationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DiagnosticFindingsTableFilterComposer
    extends Composer<_$AppDatabase, $DiagnosticFindingsTable> {
  $$DiagnosticFindingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zone => $composableBuilder(
    column: $table.zone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoAssetId => $composableBuilder(
    column: $table.photoAssetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get proposedAction => $composableBuilder(
    column: $table.proposedAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableFilterComposer get operationId {
    final $$DisassemblyOperationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableFilterComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DiagnosticFindingsTableOrderingComposer
    extends Composer<_$AppDatabase, $DiagnosticFindingsTable> {
  $$DiagnosticFindingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zone => $composableBuilder(
    column: $table.zone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoAssetId => $composableBuilder(
    column: $table.photoAssetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get proposedAction => $composableBuilder(
    column: $table.proposedAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableOrderingComposer get operationId {
    final $$DisassemblyOperationsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableOrderingComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DiagnosticFindingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiagnosticFindingsTable> {
  $$DiagnosticFindingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get zone =>
      $composableBuilder(column: $table.zone, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get photoAssetId => $composableBuilder(
    column: $table.photoAssetId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get proposedAction => $composableBuilder(
    column: $table.proposedAction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DisassemblyOperationsTableAnnotationComposer get operationId {
    final $$DisassemblyOperationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.operationId,
          referencedTable: $db.disassemblyOperations,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DisassemblyOperationsTableAnnotationComposer(
                $db: $db,
                $table: $db.disassemblyOperations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DiagnosticFindingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiagnosticFindingsTable,
          DiagnosticFinding,
          $$DiagnosticFindingsTableFilterComposer,
          $$DiagnosticFindingsTableOrderingComposer,
          $$DiagnosticFindingsTableAnnotationComposer,
          $$DiagnosticFindingsTableCreateCompanionBuilder,
          $$DiagnosticFindingsTableUpdateCompanionBuilder,
          (DiagnosticFinding, $$DiagnosticFindingsTableReferences),
          DiagnosticFinding,
          PrefetchHooks Function({bool interventionId, bool operationId})
        > {
  $$DiagnosticFindingsTableTableManager(
    _$AppDatabase db,
    $DiagnosticFindingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiagnosticFindingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiagnosticFindingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiagnosticFindingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> operationId = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> zone = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<String?> photoAssetId = const Value.absent(),
                Value<String?> proposedAction = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiagnosticFindingsCompanion(
                id: id,
                interventionId: interventionId,
                operationId: operationId,
                code: code,
                zone: zone,
                category: category,
                description: description,
                severity: severity,
                photoAssetId: photoAssetId,
                proposedAction: proposedAction,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String operationId,
                required String code,
                required String zone,
                required String category,
                required String description,
                required String severity,
                Value<String?> photoAssetId = const Value.absent(),
                Value<String?> proposedAction = const Value.absent(),
                required String status,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DiagnosticFindingsCompanion.insert(
                id: id,
                interventionId: interventionId,
                operationId: operationId,
                code: code,
                zone: zone,
                category: category,
                description: description,
                severity: severity,
                photoAssetId: photoAssetId,
                proposedAction: proposedAction,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DiagnosticFindingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({interventionId = false, operationId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (interventionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.interventionId,
                            referencedTable: $$DiagnosticFindingsTableReferences
                                ._interventionIdTable(db),
                            referencedColumn:
                                $$DiagnosticFindingsTableReferences
                                    ._interventionIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (operationId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.operationId,
                            referencedTable: $$DiagnosticFindingsTableReferences
                                ._operationIdTable(db),
                            referencedColumn:
                                $$DiagnosticFindingsTableReferences
                                    ._operationIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DiagnosticFindingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiagnosticFindingsTable,
      DiagnosticFinding,
      $$DiagnosticFindingsTableFilterComposer,
      $$DiagnosticFindingsTableOrderingComposer,
      $$DiagnosticFindingsTableAnnotationComposer,
      $$DiagnosticFindingsTableCreateCompanionBuilder,
      $$DiagnosticFindingsTableUpdateCompanionBuilder,
      (DiagnosticFinding, $$DiagnosticFindingsTableReferences),
      DiagnosticFinding,
      PrefetchHooks Function({bool interventionId, bool operationId})
    >;
typedef $$CriticalChecklistItemsTableCreateCompanionBuilder =
    CriticalChecklistItemsCompanion Function({
      required String id,
      required String interventionId,
      required String system,
      required String itemCode,
      required String label,
      Value<bool> checked,
      Value<String?> notes,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CriticalChecklistItemsTableUpdateCompanionBuilder =
    CriticalChecklistItemsCompanion Function({
      Value<String> id,
      Value<String> interventionId,
      Value<String> system,
      Value<String> itemCode,
      Value<String> label,
      Value<bool> checked,
      Value<String?> notes,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$CriticalChecklistItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CriticalChecklistItemsTable,
          CriticalChecklistItem
        > {
  $$CriticalChecklistItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) =>
      db.interventions.createAlias(
        'critical_checklist_items__intervention_id__interventions__id',
      );

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CriticalChecklistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CriticalChecklistItemsTable> {
  $$CriticalChecklistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get system => $composableBuilder(
    column: $table.system,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemCode => $composableBuilder(
    column: $table.itemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get checked => $composableBuilder(
    column: $table.checked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CriticalChecklistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CriticalChecklistItemsTable> {
  $$CriticalChecklistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get system => $composableBuilder(
    column: $table.system,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemCode => $composableBuilder(
    column: $table.itemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get checked => $composableBuilder(
    column: $table.checked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CriticalChecklistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CriticalChecklistItemsTable> {
  $$CriticalChecklistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get system =>
      $composableBuilder(column: $table.system, builder: (column) => column);

  GeneratedColumn<String> get itemCode =>
      $composableBuilder(column: $table.itemCode, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get checked =>
      $composableBuilder(column: $table.checked, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CriticalChecklistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CriticalChecklistItemsTable,
          CriticalChecklistItem,
          $$CriticalChecklistItemsTableFilterComposer,
          $$CriticalChecklistItemsTableOrderingComposer,
          $$CriticalChecklistItemsTableAnnotationComposer,
          $$CriticalChecklistItemsTableCreateCompanionBuilder,
          $$CriticalChecklistItemsTableUpdateCompanionBuilder,
          (CriticalChecklistItem, $$CriticalChecklistItemsTableReferences),
          CriticalChecklistItem,
          PrefetchHooks Function({bool interventionId})
        > {
  $$CriticalChecklistItemsTableTableManager(
    _$AppDatabase db,
    $CriticalChecklistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CriticalChecklistItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CriticalChecklistItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CriticalChecklistItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> system = const Value.absent(),
                Value<String> itemCode = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<bool> checked = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CriticalChecklistItemsCompanion(
                id: id,
                interventionId: interventionId,
                system: system,
                itemCode: itemCode,
                label: label,
                checked: checked,
                notes: notes,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String system,
                required String itemCode,
                required String label,
                Value<bool> checked = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CriticalChecklistItemsCompanion.insert(
                id: id,
                interventionId: interventionId,
                system: system,
                itemCode: itemCode,
                label: label,
                checked: checked,
                notes: notes,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CriticalChecklistItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({interventionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (interventionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.interventionId,
                        referencedTable: $$CriticalChecklistItemsTableReferences
                            ._interventionIdTable(db),
                        referencedColumn:
                            $$CriticalChecklistItemsTableReferences
                                ._interventionIdTable(db)
                                .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CriticalChecklistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CriticalChecklistItemsTable,
      CriticalChecklistItem,
      $$CriticalChecklistItemsTableFilterComposer,
      $$CriticalChecklistItemsTableOrderingComposer,
      $$CriticalChecklistItemsTableAnnotationComposer,
      $$CriticalChecklistItemsTableCreateCompanionBuilder,
      $$CriticalChecklistItemsTableUpdateCompanionBuilder,
      (CriticalChecklistItem, $$CriticalChecklistItemsTableReferences),
      CriticalChecklistItem,
      PrefetchHooks Function({bool interventionId})
    >;
typedef $$AuditEventsTableCreateCompanionBuilder =
    AuditEventsCompanion Function({
      required String id,
      required String interventionId,
      required String eventType,
      Value<String?> entityType,
      Value<String?> entityId,
      Value<String?> entityCode,
      Value<String?> actor,
      Value<String?> oldValuesJson,
      Value<String?> newValuesJson,
      Value<String?> details,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AuditEventsTableUpdateCompanionBuilder =
    AuditEventsCompanion Function({
      Value<String> id,
      Value<String> interventionId,
      Value<String> eventType,
      Value<String?> entityType,
      Value<String?> entityId,
      Value<String?> entityCode,
      Value<String?> actor,
      Value<String?> oldValuesJson,
      Value<String?> newValuesJson,
      Value<String?> details,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AuditEventsTableReferences
    extends BaseReferences<_$AppDatabase, $AuditEventsTable, AuditEvent> {
  $$AuditEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionsTable _interventionIdTable(_$AppDatabase db) => db
      .interventions
      .createAlias('audit_events__intervention_id__interventions__id');

  $$InterventionsTableProcessedTableManager get interventionId {
    final $_column = $_itemColumn<String>('intervention_id')!;

    final manager = $$InterventionsTableTableManager(
      $_db,
      $_db.interventions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AuditEventsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditEventsTable> {
  $$AuditEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityCode => $composableBuilder(
    column: $table.entityCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oldValuesJson => $composableBuilder(
    column: $table.oldValuesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newValuesJson => $composableBuilder(
    column: $table.newValuesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionsTableFilterComposer get interventionId {
    final $$InterventionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableFilterComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditEventsTable> {
  $$AuditEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityCode => $composableBuilder(
    column: $table.entityCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oldValuesJson => $composableBuilder(
    column: $table.oldValuesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newValuesJson => $composableBuilder(
    column: $table.newValuesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionsTableOrderingComposer get interventionId {
    final $$InterventionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableOrderingComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditEventsTable> {
  $$AuditEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get entityCode => $composableBuilder(
    column: $table.entityCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actor =>
      $composableBuilder(column: $table.actor, builder: (column) => column);

  GeneratedColumn<String> get oldValuesJson => $composableBuilder(
    column: $table.oldValuesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get newValuesJson => $composableBuilder(
    column: $table.newValuesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$InterventionsTableAnnotationComposer get interventionId {
    final $$InterventionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionId,
      referencedTable: $db.interventions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interventions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditEventsTable,
          AuditEvent,
          $$AuditEventsTableFilterComposer,
          $$AuditEventsTableOrderingComposer,
          $$AuditEventsTableAnnotationComposer,
          $$AuditEventsTableCreateCompanionBuilder,
          $$AuditEventsTableUpdateCompanionBuilder,
          (AuditEvent, $$AuditEventsTableReferences),
          AuditEvent,
          PrefetchHooks Function({bool interventionId})
        > {
  $$AuditEventsTableTableManager(_$AppDatabase db, $AuditEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionId = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String?> entityType = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String?> entityCode = const Value.absent(),
                Value<String?> actor = const Value.absent(),
                Value<String?> oldValuesJson = const Value.absent(),
                Value<String?> newValuesJson = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuditEventsCompanion(
                id: id,
                interventionId: interventionId,
                eventType: eventType,
                entityType: entityType,
                entityId: entityId,
                entityCode: entityCode,
                actor: actor,
                oldValuesJson: oldValuesJson,
                newValuesJson: newValuesJson,
                details: details,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionId,
                required String eventType,
                Value<String?> entityType = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String?> entityCode = const Value.absent(),
                Value<String?> actor = const Value.absent(),
                Value<String?> oldValuesJson = const Value.absent(),
                Value<String?> newValuesJson = const Value.absent(),
                Value<String?> details = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AuditEventsCompanion.insert(
                id: id,
                interventionId: interventionId,
                eventType: eventType,
                entityType: entityType,
                entityId: entityId,
                entityCode: entityCode,
                actor: actor,
                oldValuesJson: oldValuesJson,
                newValuesJson: newValuesJson,
                details: details,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuditEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({interventionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (interventionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.interventionId,
                        referencedTable: $$AuditEventsTableReferences
                            ._interventionIdTable(db),
                        referencedColumn: $$AuditEventsTableReferences
                            ._interventionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AuditEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditEventsTable,
      AuditEvent,
      $$AuditEventsTableFilterComposer,
      $$AuditEventsTableOrderingComposer,
      $$AuditEventsTableAnnotationComposer,
      $$AuditEventsTableCreateCompanionBuilder,
      $$AuditEventsTableUpdateCompanionBuilder,
      (AuditEvent, $$AuditEventsTableReferences),
      AuditEvent,
      PrefetchHooks Function({bool interventionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$InterventionsTableTableManager get interventions =>
      $$InterventionsTableTableManager(_db, _db.interventions);
  $$DisassemblyOperationsTableTableManager get disassemblyOperations =>
      $$DisassemblyOperationsTableTableManager(_db, _db.disassemblyOperations);
  $$PhotoAssetsTableTableManager get photoAssets =>
      $$PhotoAssetsTableTableManager(_db, _db.photoAssets);
  $$AnnotationDocumentsTableTableManager get annotationDocuments =>
      $$AnnotationDocumentsTableTableManager(_db, _db.annotationDocuments);
  $$ComponentsTableTableManager get components =>
      $$ComponentsTableTableManager(_db, _db.components);
  $$BackupRecordsTableTableManager get backupRecords =>
      $$BackupRecordsTableTableManager(_db, _db.backupRecords);
  $$DiagnosticFindingsTableTableManager get diagnosticFindings =>
      $$DiagnosticFindingsTableTableManager(_db, _db.diagnosticFindings);
  $$CriticalChecklistItemsTableTableManager get criticalChecklistItems =>
      $$CriticalChecklistItemsTableTableManager(
        _db,
        _db.criticalChecklistItems,
      );
  $$AuditEventsTableTableManager get auditEvents =>
      $$AuditEventsTableTableManager(_db, _db.auditEvents);
}
