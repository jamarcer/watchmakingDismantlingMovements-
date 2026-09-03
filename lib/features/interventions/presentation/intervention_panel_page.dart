import 'dart:async';

import 'package:flutter/material.dart';

import '../../annotations/domain/annotation_repository.dart';
import '../../components/application/component_markdown_generator.dart';
import '../../components/domain/component.dart';
import '../../components/domain/component_document_gateway.dart';
import '../../components/domain/component_repository.dart';
import '../../components/presentation/component_panel.dart';
import '../../diagnostics/domain/diagnostic_repository.dart';
import '../../diagnostics/presentation/diagnostic_panel.dart';
import '../../photos/domain/photo_asset.dart';
import '../../photos/domain/photo_repository.dart';
import '../../photos/presentation/operation_photos_page.dart';
import '../domain/intervention.dart';
import '../domain/intervention_repository.dart';

class InterventionPanelPage extends StatefulWidget {
  const InterventionPanelPage({
    super.key,
    required this.intervention,
    required this.interventionRepository,
    required this.photoRepository,
    required this.photoGateway,
    required this.annotationRepository,
    required this.componentRepository,
    required this.componentDocumentGateway,
    required this.diagnosticRepository,
    required this.onBackup,
    required this.onToggleStatus,
    required this.onTimeline,
    required this.onDelete,
  });
  final Intervention intervention;
  final InterventionRepository interventionRepository;
  final PhotoRepository photoRepository;
  final OperationPhotoGateway photoGateway;
  final AnnotationRepository annotationRepository;
  final ComponentRepository componentRepository;
  final ComponentDocumentGateway componentDocumentGateway;
  final DiagnosticRepository diagnosticRepository;
  final Future<void> Function() onBackup;
  final Future<void> Function() onToggleStatus;
  final VoidCallback onTimeline;
  final Future<void> Function() onDelete;
  @override
  State<InterventionPanelPage> createState() => _InterventionPanelPageState();
}

class _InterventionPanelPageState extends State<InterventionPanelPage> {
  StreamSubscription<List<DisassemblyOperation>>? _operationsSub;
  StreamSubscription<List<WatchComponent>>? _componentsSub;
  List<DisassemblyOperation> _operations = const [];
  List<WatchComponent> _components = const [];
  String? _selectedOperationId;
  String? _error;

  @override
  void initState() {
    super.initState();
    _operationsSub = widget.interventionRepository
        .watchOperations(widget.intervention.id)
        .listen((value) {
          if (mounted) {
            setState(() {
              _operations = value;
              if (!_operations.any((item) => item.id == _selectedOperationId)) {
                _selectedOperationId = value.firstOrNull?.id;
              }
            });
          }
        });
    final repository = widget.componentRepository;
    if (repository is InterventionComponentRepository) {
      _componentsSub = (repository as InterventionComponentRepository)
          .watchForIntervention(widget.intervention.id)
          .listen((value) {
            if (mounted) setState(() => _components = value);
          });
    }
  }

  @override
  void dispose() {
    _operationsSub?.cancel();
    _componentsSub?.cancel();
    super.dispose();
  }

  Future<void> _openOperation(String? id) async {
    final operation = _operations.where((item) => item.id == id).firstOrNull;
    if (operation == null) return;
    setState(() => _selectedOperationId = operation.id);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OperationPhotosPage(
          intervention: widget.intervention,
          initialOperation: operation,
          interventionRepository: widget.interventionRepository,
          photoRepository: widget.photoRepository,
          photoGateway: widget.photoGateway,
          annotationRepository: widget.annotationRepository,
          componentRepository: widget.componentRepository,
          componentDocumentGateway: widget.componentDocumentGateway,
          diagnosticRepository: widget.diagnosticRepository,
        ),
      ),
    );
  }

  Future<void> _createOperation() async {
    final title = await showCreateOperationDialog(context);
    if (title == null || title.trim().isEmpty) return;
    try {
      final operation = await widget.interventionRepository.createOperation(
        interventionId: widget.intervention.id,
        title: title,
      );
      if (mounted) setState(() => _selectedOperationId = operation.id);
    } catch (error) {
      if (mounted) setState(() => _error = "No se pudo crear la operación: ");
    }
  }

  Future<void> _addComponent() async {
    final operation = _operations
        .where((item) => item.id == _selectedOperationId)
        .firstOrNull;
    if (operation == null) return;
    final draft = await showRegisterComponentDialog(context, operation.code);
    if (draft == null) return;
    try {
      await widget.componentRepository.add(
        interventionId: widget.intervention.id,
        operationId: operation.id,
        draft: draft,
      );
      final components = await widget.componentRepository.getForOperation(
        operation.id,
      );
      final photos = await widget.photoRepository
          .watchForOperation(operation.id)
          .first;
      final markdown = const ComponentMarkdownGenerator().generate(
        intervention: widget.intervention,
        operation: operation,
        components: components,
        photos: photos,
        complete: operation.status == "complete",
      );
      await widget.componentDocumentGateway.updateOperation(
        interventionsRoot: widget.intervention.rootDocumentUri,
        interventionFolder: widget.intervention.folderName,
        operationCode: operation.code,
        markdown: markdown,
      );
    } catch (error) {
      if (mounted) setState(() => _error = "No se pudo crear el componente: ");
    }
  }

  Future<void> _editComponent(String? id) async {
    final component = _components.where((item) => item.id == id).firstOrNull;
    if (component == null) return;
    final draft = await showEditComponentDialog(context, component);
    if (draft == null) return;
    try {
      await widget.componentRepository.update(
        component: component,
        description: draft.description,
        quantity: draft.quantity,
        tray: draft.tray,
        notes: draft.notes,
      );
    } catch (error) {
      if (mounted) setState(() => _error = 'No se pudo actualizar: $error');
    }
  }

  void _openDiagnostics() {
    if (_operations.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DiagnosticDetailsPage(
          intervention: widget.intervention,
          operations: _operations,
          photoRepository: widget.photoRepository,
          componentRepository: widget.componentRepository,
          diagnosticRepository: widget.diagnosticRepository,
          documentGateway: widget.componentDocumentGateway,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.intervention.code)),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InterventionHeader(
          intervention: widget.intervention,
          onBackup: widget.onBackup,
          onToggleStatus: widget.onToggleStatus,
          onTimeline: widget.onTimeline,
          onDelete: widget.onDelete,
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _Section(
                title: "Operaciones",
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      key: const Key("intervention-operations"),
                      initialValue: _selectedOperationId,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: "Operaciones disponibles",
                        border: OutlineInputBorder(),
                      ),
                      items: _operations
                          .map(
                            (item) => DropdownMenuItem(
                              value: item.id,
                              child: Text("${item.code} · ${item.title}"),
                            ),
                          )
                          .toList(),
                      onChanged: _openOperation,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        key: const Key("add-intervention-operation"),
                        onPressed: _createOperation,
                        icon: const Icon(Icons.add),
                        label: const Text("Alta de operación"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _Section(
                title: "Componentes",
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      key: const Key("intervention-components"),
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: "Componentes dados de alta",
                        border: OutlineInputBorder(),
                      ),
                      items: _components
                          .map(
                            (item) => DropdownMenuItem(
                              value: item.id,
                              child: Text("${item.code} · ${item.description}"),
                            ),
                          )
                          .toList(),
                      onChanged: _editComponent,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        key: const Key("add-intervention-component"),
                        onPressed: _selectedOperationId == null
                            ? null
                            : _addComponent,
                        icon: const Icon(Icons.add),
                        label: const Text("Alta de componente"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _Section(
          title: 'Diagnóstico y conjuntos críticos',
          child: Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.icon(
              key: const Key('open-diagnostics'),
              onPressed: _operations.isEmpty ? null : _openDiagnostics,
              icon: const Icon(Icons.health_and_safety_outlined),
              label: const Text('Abrir panel'),
            ),
          ),
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
      ],
    ),
  );
}

class _InterventionHeader extends StatelessWidget {
  const _InterventionHeader({
    required this.intervention,
    required this.onBackup,
    required this.onToggleStatus,
    required this.onTimeline,
    required this.onDelete,
  });
  final Intervention intervention;
  final Future<void> Function() onBackup;
  final Future<void> Function() onToggleStatus;
  final VoidCallback onTimeline;
  final Future<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final documentError = intervention.documentState == DocumentState.error;
    return Card(
      key: const Key("intervention-header"),
      child: ListTile(
        leading: CircleAvatar(child: Text(intervention.code.split("-").last)),
        title: Text("${intervention.code} · ${intervention.brand}"),
        subtitle: Text(
          [
            if (intervention.calibre != null)
              "Calibre ${intervention.calibre!}",
            intervention.status.label,
            "D01 creada",
          ].join(" · "),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: "Ver cronología",
              onPressed: onTimeline,
              icon: const Icon(Icons.timeline_outlined),
            ),
            IconButton(
              tooltip: intervention.status == InterventionStatus.closed
                  ? "Reabrir intervención"
                  : "Cerrar intervención",
              onPressed: onToggleStatus,
              icon: Icon(
                intervention.status == InterventionStatus.closed
                    ? Icons.lock_open_outlined
                    : Icons.lock_outline,
              ),
            ),
            IconButton(
              key: Key("header-delete-" + intervention.code),
              tooltip: "Eliminar intervención",
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
            ),
            IconButton(
              tooltip: "Copiar a USB",
              onPressed: onBackup,
              icon: const Icon(Icons.usb_outlined),
            ),
            if (documentError)
              Tooltip(
                message: "Documentación pendiente",
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          child,
        ],
      ),
    ),
  );
}

class DiagnosticDetailsPage extends StatefulWidget {
  const DiagnosticDetailsPage({
    super.key,
    required this.intervention,
    required this.operations,
    required this.photoRepository,
    required this.componentRepository,
    required this.diagnosticRepository,
    required this.documentGateway,
  });
  final Intervention intervention;
  final List<DisassemblyOperation> operations;
  final PhotoRepository photoRepository;
  final ComponentRepository componentRepository;
  final DiagnosticRepository diagnosticRepository;
  final ComponentDocumentGateway documentGateway;
  @override
  State<DiagnosticDetailsPage> createState() => _DiagnosticDetailsPageState();
}

class _DiagnosticDetailsPageState extends State<DiagnosticDetailsPage> {
  late DisassemblyOperation _operation;
  StreamSubscription<List<PhotoAsset>>? _photosSub;
  List<PhotoAsset> _photos = const [];
  @override
  void initState() {
    super.initState();
    _select(widget.operations.first);
  }

  void _select(DisassemblyOperation operation) {
    _photosSub?.cancel();
    _operation = operation;
    _photos = const [];
    _photosSub = widget.photoRepository.watchForOperation(operation.id).listen((
      value,
    ) {
      if (mounted) setState(() => _photos = value);
    });
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _photosSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Diagnóstico y conjuntos críticos')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<String>(
          initialValue: _operation.id,
          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'Operación',
            border: OutlineInputBorder(),
          ),
          items: widget.operations
              .map(
                (item) => DropdownMenuItem(
                  value: item.id,
                  child: Text('${item.code} · ${item.title}'),
                ),
              )
              .toList(),
          onChanged: (id) {
            final selected = widget.operations
                .where((item) => item.id == id)
                .firstOrNull;
            if (selected != null) _select(selected);
          },
        ),
        DiagnosticPanel(
          key: ValueKey(_operation.id),
          intervention: widget.intervention,
          operation: _operation,
          photos: _photos,
          repository: widget.diagnosticRepository,
          componentRepository: widget.componentRepository,
          documentGateway: widget.documentGateway,
        ),
      ],
    ),
  );
}
