import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/domain/component_document_gateway.dart';
import '../../components/domain/component_repository.dart';
import '../../diagnostics/domain/diagnostic_repository.dart';
import '../../diagnostics/presentation/diagnostic_panel.dart';
import '../../components/presentation/component_panel.dart';
import '../../annotations/domain/annotation_repository.dart';
import '../../annotations/presentation/annotation_editor_page.dart';
import '../../interventions/domain/intervention.dart';
import '../../interventions/domain/intervention_repository.dart';
import '../../interventions/presentation/soft_delete_confirmation.dart';
import '../domain/photo_asset.dart';
import '../domain/photo_repository.dart';

class OperationPhotosPage extends StatefulWidget {
  const OperationPhotosPage({
    super.key,
    required this.intervention,
    required this.interventionRepository,
    required this.photoRepository,
    required this.photoGateway,
    required this.annotationRepository,
    required this.componentRepository,
    required this.componentDocumentGateway,
    required this.diagnosticRepository,
  });

  final Intervention intervention;
  final InterventionRepository interventionRepository;
  final PhotoRepository photoRepository;
  final OperationPhotoGateway photoGateway;
  final AnnotationRepository annotationRepository;
  final ComponentRepository componentRepository;
  final ComponentDocumentGateway componentDocumentGateway;
  final DiagnosticRepository diagnosticRepository;

  @override
  State<OperationPhotosPage> createState() => _OperationPhotosPageState();
}

class _OperationPhotosPageState extends State<OperationPhotosPage> {
  DisassemblyOperation? _operation;
  StreamSubscription<List<PhotoAsset>>? _subscription;
  StreamSubscription<List<DisassemblyOperation>>? _operationsSubscription;
  List<DisassemblyOperation> _operations = const [];
  List<PhotoAsset> _photos = const [];
  OperationPhotoKind? _busyKind;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _operationsSubscription = widget.interventionRepository
        .watchOperations(widget.intervention.id)
        .listen((operations) {
          if (!mounted) return;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            setState(() => _operations = operations);
            if (_operation == null && operations.isNotEmpty) {
              _selectOperation(operations.first);
            }
          });
        });
    final operation = await widget.interventionRepository.firstOperation(
      widget.intervention.id,
    );
    if (!mounted) return;
    if (operation == null) {
      setState(() => _error = 'No se encontró ninguna operación.');
      return;
    }
    _selectOperation(operation);
  }

  void _selectOperation(DisassemblyOperation operation) {
    if (!mounted) return;
    _subscription?.cancel();
    setState(() {
      _operation = operation;
      _photos = const [];
      _error = null;
    });
    _subscription = widget.photoRepository
        .watchForOperation(operation.id)
        .listen((photos) {
          if (mounted) setState(() => _photos = photos);
        });
  }

  Future<void> _deleteOperation() async {
    final operation = _operation;
    if (operation == null) return;
    final confirmed = await confirmSoftDelete(
      context,
      code: operation.code,
      entityLabel: 'operación',
    );
    if (!confirmed || !mounted) return;
    try {
      await widget.interventionRepository.softDeleteOperation(
        operation: operation,
        actor: widget.intervention.technician,
      );
      final remaining = _operations
          .where((item) => item.id != operation.id)
          .toList();
      if (remaining.isEmpty) {
        if (mounted) Navigator.of(context).pop();
      } else {
        _selectOperation(remaining.first);
      }
    } catch (_) {
      if (mounted) setState(() => _error = 'No se pudo eliminar la operación.');
    }
  }

  Future<void> _createOperation() async {
    final title = await showDialog<String>(
      context: context,
      builder: (_) => const _NewOperationDialog(),
    );
    if (title == null || title.trim().isEmpty) return;
    try {
      final created = await widget.interventionRepository.createOperation(
        interventionId: widget.intervention.id,
        title: title,
      );
      if (mounted) _selectOperation(created);
    } catch (_) {
      if (mounted) setState(() => _error = 'No se pudo crear la operación.');
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _operationsSubscription?.cancel();
    super.dispose();
  }

  Future<void> _acquire(
    OperationPhotoKind kind, {
    required bool capture,
  }) async {
    final operation = _operation;
    if (operation == null || _busyKind != null) return;

    setState(() {
      _busyKind = kind;
      _error = null;
    });
    try {
      final captured = capture
          ? await widget.photoGateway.capture(
              interventionsRoot: widget.intervention.rootDocumentUri,
              interventionFolder: widget.intervention.folderName,
              operationCode: operation.code,
              kind: kind,
            )
          : await widget.photoGateway.import(
              interventionsRoot: widget.intervention.rootDocumentUri,
              interventionFolder: widget.intervention.folderName,
              operationCode: operation.code,
              kind: kind,
            );
      if (captured == null) return;
      await widget.photoRepository.save(
        interventionId: widget.intervention.id,
        operationId: operation.id,
        kind: kind,
        captured: captured,
      );
    } on PlatformException catch (error) {
      _error = error.message ?? 'No se pudo guardar la fotografía.';
    } catch (_) {
      _error = 'No se pudo registrar la fotografía.';
    } finally {
      if (mounted) setState(() => _busyKind = null);
    }
  }

  PhotoAsset? _photoFor(OperationPhotoKind kind) {
    for (final photo in _photos) {
      if (photo.kind == kind) return photo;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final operation = _operation;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          operation == null
              ? widget.intervention.code
              : widget.intervention.code + ' · ' + operation.code,
        ),
      ),
      body: operation == null && _error == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue:
                            _operations.any((item) => item.id == operation?.id)
                            ? operation?.id
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Operación',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          for (final item in _operations)
                            DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.code} · ${item.title}'),
                            ),
                        ],
                        onChanged: (id) {
                          final selected = _operations
                              .where((item) => item.id == id)
                              .firstOrNull;
                          if (selected != null) _selectOperation(selected);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      key: const Key('delete-operation'),
                      tooltip: 'Eliminar operación',
                      onPressed: operation == null ? null : _deleteOperation,
                      icon: const Icon(Icons.delete_outline),
                    ),
                    IconButton.filled(
                      tooltip: 'Nueva operación',
                      onPressed: _createOperation,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Fotografías de ${operation?.code ?? 'operación'}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Los originales se conservan sin modificaciones en la microSD.',
                ),
                if (_error != null) ...[
                  const SizedBox(height: 12),
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(_error!, key: const Key('photo-error')),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                for (final kind in const [
                  OperationPhotoKind.before,
                  OperationPhotoKind.after,
                  OperationPhotoKind.parts,
                ])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _PhotoKindCard(
                      kind: kind,
                      photo: _photoFor(kind),
                      isBusy: _busyKind == kind,
                      onCapture: () => _acquire(kind, capture: true),
                      onImport: () => _acquire(kind, capture: false),
                    ),
                  ),
                if (_photoFor(OperationPhotoKind.before) case final source?)
                  FilledButton.icon(
                    key: const Key('annotate-before'),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AnnotationEditorPage(
                          intervention: widget.intervention,
                          operation: operation!,
                          source: source,
                          repository: widget.annotationRepository,
                          photoRepository: widget.photoRepository,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.draw_outlined),
                    label: const Text('Anotar fotografía A'),
                  ),
                if (operation != null)
                  ComponentPanel(
                    intervention: widget.intervention,
                    operation: operation,
                    photos: _photos,
                    repository: widget.componentRepository,
                    documentGateway: widget.componentDocumentGateway,
                  ),
                if (operation != null)
                  DiagnosticPanel(
                    intervention: widget.intervention,
                    operation: operation,
                    photos: _photos,
                    repository: widget.diagnosticRepository,
                    componentRepository: widget.componentRepository,
                    documentGateway: widget.componentDocumentGateway,
                  ),
              ],
            ),
    );
  }
}

class _PhotoKindCard extends StatelessWidget {
  const _PhotoKindCard({
    required this.kind,
    required this.photo,
    required this.isBusy,
    required this.onCapture,
    required this.onImport,
  });

  final OperationPhotoKind kind;
  final PhotoAsset? photo;
  final bool isBusy;
  final VoidCallback onCapture;
  final VoidCallback onImport;

  @override
  Widget build(BuildContext context) {
    final item = photo;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: 128,
              height: 96,
              child: item == null
                  ? ColoredBox(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest,
                      child: Center(
                        child: Text(
                          kind.letter,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    )
                  : Image.file(
                      File(item.thumbnailPath),
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          const Icon(Icons.broken_image_outlined),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kind.letter + ' · ' + kind.label,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(item == null ? kind.defaultFileName : _details(item)),
                  const SizedBox(height: 12),
                  if (isBusy)
                    const LinearProgressIndicator()
                  else if (item == null)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        FilledButton.icon(
                          key: Key('capture-' + kind.name),
                          onPressed: onCapture,
                          icon: const Icon(Icons.photo_camera_outlined),
                          label: const Text('Cámara'),
                        ),
                        OutlinedButton.icon(
                          key: Key('import-' + kind.name),
                          onPressed: onImport,
                          icon: const Icon(Icons.photo_library_outlined),
                          label: const Text('Importar'),
                        ),
                      ],
                    )
                  else
                    const Chip(
                      avatar: Icon(Icons.verified_outlined),
                      label: Text('Original guardado'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _details(PhotoAsset item) {
    final sizeMb = item.byteSize / (1024 * 1024);
    return item.relativePath +
        '\n' +
        item.width.toString() +
        ' × ' +
        item.height.toString() +
        ' · ' +
        sizeMb.toStringAsFixed(1) +
        ' MB';
  }
}

class _NewOperationDialog extends StatefulWidget {
  const _NewOperationDialog();
  @override
  State<_NewOperationDialog> createState() => _NewOperationDialogState();
}

class _NewOperationDialogState extends State<_NewOperationDialog> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Nueva operación'),
    content: TextField(
      controller: _controller,
      autofocus: true,
      decoration: const InputDecoration(
        labelText: 'Título',
        hintText: 'Ej. Retirar puente de rodaje',
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancelar'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(context, _controller.text),
        child: const Text('Crear'),
      ),
    ],
  );
}
