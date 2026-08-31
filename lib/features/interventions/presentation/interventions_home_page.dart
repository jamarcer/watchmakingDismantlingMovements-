import 'package:flutter/material.dart';

import '../../backups/application/backup_controller.dart';
import '../../backups/domain/backup.dart';
import '../../diagnostics/domain/diagnostic_repository.dart';
import '../../components/domain/component_document_gateway.dart';
import '../../components/domain/component_repository.dart';
import '../../annotations/domain/annotation_repository.dart';
import '../../storage/application/document_root_controller.dart';
import '../../storage/domain/document_root_repository.dart';
import '../../storage/domain/document_storage_status.dart';
import '../application/create_intervention.dart';
import '../application/interventions_controller.dart';
import '../domain/intervention.dart';
import '../domain/intervention_repository.dart';
import 'new_intervention_page.dart';
import 'deleted_interventions_page.dart';
import 'soft_delete_confirmation.dart';
import 'intervention_timeline_page.dart';
import '../../photos/domain/photo_repository.dart';
import '../../photos/presentation/operation_photos_page.dart';

class InterventionsHomePage extends StatefulWidget {
  const InterventionsHomePage({
    super.key,
    required this.documentRootRepository,
    required this.interventionRepository,
    required this.createIntervention,
    required this.photoRepository,
    required this.photoGateway,
    required this.annotationRepository,
    required this.componentRepository,
    required this.componentDocumentGateway,
    required this.diagnosticRepository,
    required this.backupController,
  });

  final DocumentRootRepository documentRootRepository;
  final InterventionRepository interventionRepository;
  final CreateIntervention createIntervention;
  final PhotoRepository photoRepository;
  final OperationPhotoGateway photoGateway;
  final AnnotationRepository annotationRepository;
  final ComponentRepository componentRepository;
  final ComponentDocumentGateway componentDocumentGateway;
  final DiagnosticRepository diagnosticRepository;
  final BackupController backupController;

  @override
  State<InterventionsHomePage> createState() => _InterventionsHomePageState();
}

class _InterventionsHomePageState extends State<InterventionsHomePage>
    with WidgetsBindingObserver {
  late final DocumentRootController _storageController;
  late final InterventionsController _interventionsController;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _storageController = DocumentRootController(widget.documentRootRepository)
      ..addListener(_onChanged)
      ..load();
    _interventionsController = InterventionsController(
      repository: widget.interventionRepository,
      createIntervention: widget.createIntervention,
    )..addListener(_onChanged);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _storageController
      ..removeListener(_onChanged)
      ..dispose();
    _interventionsController
      ..removeListener(_onChanged)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_storageController.isLoading) {
      _storageController.refresh();
    }
  }

  void _openTimeline(Intervention intervention) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InterventionTimelinePage(
          intervention: intervention,
          repository: widget.interventionRepository,
          onOperationTap: (operation) async {
            Navigator.of(context).pop();
            await _openIntervention(intervention);
          },
        ),
      ),
    );
  }

  Future<void> _backup(Intervention intervention) async {
    try {
      final result = await showDialog<dynamic>(
        context: context,
        barrierDismissible: false,
        builder: (_) => _BackupDialog(
          controller: widget.backupController,
          intervention: intervention,
        ),
      );
      if (result != null && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Copia verificada:  archivos")));
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Copia fallida: ")));
      }
    }
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _newIntervention() async {
    final storage = _storageController.status;
    if (storage == null) return;

    final draft = await Navigator.of(context).push<InterventionDraft>(
      MaterialPageRoute(builder: (_) => const NewInterventionPage()),
    );
    if (draft == null || !mounted) return;

    final result = await _interventionsController.create(
      draft: draft,
      interventionsRoot: storage.interventionsRoot,
    );
    if (!mounted) return;

    final error = _interventionsController.errorMessage;
    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error ?? 'No se pudo crear la intervención.')),
      );
      return;
    }

    final message = result.documentsSynchronized
        ? result.created.intervention.code + ' creada con D01.'
        : result.created.intervention.code +
              ' guardada; la documentación queda pendiente.';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _deleteIntervention(Intervention intervention) async {
    final confirmed = await confirmSoftDelete(
      context,
      code: intervention.code,
      entityLabel: 'intervención',
    );
    if (!confirmed || !mounted) {
      return;
    }
    await widget.interventionRepository.softDeleteIntervention(intervention);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(intervention.code + ' eliminada lógicamente.')),
      );
    }
  }

  void _openDeleted() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            DeletedInterventionsPage(repository: widget.interventionRepository),
      ),
    );
  }

  Future<void> _toggleStatus(Intervention intervention) async {
    final closing = intervention.status != InterventionStatus.closed;
    final reasonController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(closing ? 'Cerrar intervención' : 'Reabrir intervención'),
        content: closing
            ? TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Excepción / justificación (opcional)',
                  hintText: 'Obligatoria si quedan operaciones pendientes',
                ),
              )
            : const Text(
                'La intervención volverá a estado de revisión y quedará registrada en el historial.',
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (closing &&
                  intervention.status != InterventionStatus.closed &&
                  reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Indica una justificación para cerrar.'),
                  ),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            child: Text(closing ? 'Cerrar' : 'Reabrir'),
          ),
        ],
      ),
    );
    reasonController.dispose();
    if (confirmed != true || !mounted) return;
    await widget.interventionRepository.setStatus(
      intervention.id,
      closing ? InterventionStatus.closed : InterventionStatus.review,
    );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            closing
                ? 'Intervención cerrada y auditada.'
                : 'Intervención reabierta y auditada.',
          ),
        ),
      );
    }
  }

  Future<void> _openIntervention(Intervention intervention) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => OperationPhotosPage(
          intervention: intervention,
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

  @override
  Widget build(BuildContext context) {
    final storage = _storageController.status;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fichas de desmontaje'),
        actions: [
          IconButton(
            key: const Key('open-deleted'),
            tooltip: 'Eliminados',
            onPressed: _openDeleted,
            icon: const Icon(Icons.delete_outline),
          ),
          if (storage != null)
            IconButton(
              tooltip: 'Cambiar carpeta documental',
              onPressed: _storageController.isLoading
                  ? null
                  : _storageController.chooseRoot,
              icon: const Icon(Icons.sd_storage_outlined),
            ),
        ],
      ),
      body: SafeArea(child: _buildBody(storage)),
      floatingActionButton: storage == null
          ? null
          : FloatingActionButton.extended(
              key: const Key('new-intervention'),
              onPressed: _interventionsController.isSaving
                  ? null
                  : _newIntervention,
              icon: const Icon(Icons.add),
              label: const Text('Nueva intervención'),
            ),
    );
  }

  Widget _buildBody(DocumentStorageStatus? storage) {
    if (_storageController.isLoading && storage == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (storage == null) {
      return _StorageSetup(
        errorMessage: _storageController.errorMessage,
        onSelect: _storageController.chooseRoot,
      );
    }
    if (_interventionsController.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final query = _searchQuery.trim().toLowerCase();
    final items = query.isEmpty
        ? _interventionsController.items
        : _interventionsController.items
              .where((item) {
                final haystack = [
                  item.code,
                  item.brand,
                  item.modelReference,
                  item.calibre,
                  item.movementNumber,
                  item.status.label,
                ].whereType<String>().join(' ').toLowerCase();
                return haystack.contains(query);
              })
              .toList(growable: false);

    return Column(
      children: [
        _StorageSummary(status: storage),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              labelText: 'Buscar intervenciones',
              hintText: 'Código, marca, calibre, movimiento o estado',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Limpiar búsqueda',
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchQuery = '');
                      },
                      icon: const Icon(Icons.clear),
                    ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        if (_interventionsController.errorMessage case final error?)
          MaterialBanner(
            content: Text(error),
            actions: [
              TextButton(onPressed: () {}, child: const Text('Cerrar')),
            ],
          ),
        Expanded(
          child: items.isEmpty
              ? (query.isEmpty
                    ? const _EmptyInterventions()
                    : const _NoSearchResults())
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) => _InterventionCard(
                    intervention: items[index],
                    onTap: () => _openIntervention(items[index]),
                    onBackup: () => _backup(items[index]),
                    onToggleStatus: () => _toggleStatus(items[index]),
                    onTimeline: () => _openTimeline(items[index]),
                    onDelete: () => _deleteIntervention(items[index]),
                  ),
                ),
        ),
      ],
    );
  }
}

class _StorageSetup extends StatelessWidget {
  const _StorageSetup({required this.errorMessage, required this.onSelect});

  final String? errorMessage;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.watch_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Todavía no hay intervenciones',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            const Text(
              'Selecciona en la microSD la carpeta donde se guardarán las intervenciones.',
              textAlign: TextAlign.center,
            ),
            if (errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                key: const Key('storage-error'),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onSelect,
              icon: const Icon(Icons.create_new_folder_outlined),
              label: const Text('Seleccionar carpeta'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StorageSummary extends StatelessWidget {
  const _StorageSummary({required this.status});

  final DocumentStorageStatus status;

  @override
  Widget build(BuildContext context) {
    final available = status.availableBytes;
    return Material(
      color: status.isLowOnSpace
          ? Theme.of(context).colorScheme.errorContainer
          : Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ListTile(
        dense: true,
        leading: const Icon(Icons.sd_storage_outlined),
        title: const Text('Carpeta documental disponible'),
        subtitle: Text(
          available == null
              ? 'Espacio disponible no informado por Android'
              : _formatBytes(available) + ' disponibles',
        ),
      ),
    );
  }

  String _formatBytes(int bytes) {
    const gibibyte = 1024 * 1024 * 1024;
    const mebibyte = 1024 * 1024;
    return bytes >= gibibyte
        ? (bytes / gibibyte).toStringAsFixed(1) + ' GB'
        : (bytes / mebibyte).toStringAsFixed(0) + ' MB';
  }
}

class _NoSearchResults extends StatelessWidget {
  const _NoSearchResults();

  @override
  Widget build(BuildContext context) => const Center(
    child: Padding(
      padding: EdgeInsets.all(32),
      child: Text('No hay intervenciones que coincidan con la búsqueda.'),
    ),
  );
}

class _EmptyInterventions extends StatelessWidget {
  const _EmptyInterventions();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.description_outlined, size: 64),
            const SizedBox(height: 16),
            Text(
              'No hay intervenciones registradas',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Pulsa «Nueva intervención» para crear la primera ficha.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _BackupDialog extends StatelessWidget {
  const _BackupDialog({required this.controller, required this.intervention});
  final BackupController controller;
  final Intervention intervention;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Copia USB'),
    content: StreamBuilder<BackupProgress>(
      stream: controller.progress,
      builder: (context, snapshot) {
        final p = snapshot.data;
        return SizedBox(
          width: 420,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecciona una carpeta del disco USB. Se verificará cada archivo.',
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(value: p?.fraction),
              const SizedBox(height: 8),
              Text(
                p == null
                    ? 'Esperando selección…'
                    : '${p.bytesCopied} / ${p.totalBytes} bytes\n${p.path}',
              ),
            ],
          ),
        );
      },
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancelar'),
      ),
      FilledButton(
        onPressed: () async {
          final navigator = Navigator.of(context);
          final result = await controller.run(
            interventionId: intervention.id,
            root: intervention.rootDocumentUri,
            folder: intervention.folderName,
          );
          if (navigator.mounted) navigator.pop(result);
        },
        child: const Text('Seleccionar USB'),
      ),
    ],
  );
}

class _InterventionCard extends StatelessWidget {
  const _InterventionCard({
    required this.intervention,
    required this.onTap,
    required this.onBackup,
    required this.onToggleStatus,
    required this.onTimeline,
    required this.onDelete,
  });
  final Intervention intervention;
  final VoidCallback onTap;
  final VoidCallback onBackup;
  final VoidCallback onToggleStatus;
  final VoidCallback onTimeline;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    final documentError = intervention.documentState == DocumentState.error;
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(child: Text(intervention.code.split('-').last)),
        title: Text('${intervention.code} · ${intervention.brand}'),
        subtitle: Text(
          [
            if (intervention.calibre != null)
              'Calibre ${intervention.calibre!}',
            intervention.status.label,
            'D01 creada',
          ].join(' · '),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Ver cronología',
              onPressed: onTimeline,
              icon: const Icon(Icons.timeline_outlined),
            ),
            IconButton(
              tooltip: intervention.status == InterventionStatus.closed
                  ? 'Reabrir intervención'
                  : 'Cerrar intervención',
              onPressed: onToggleStatus,
              icon: Icon(
                intervention.status == InterventionStatus.closed
                    ? Icons.lock_open_outlined
                    : Icons.lock_outline,
              ),
            ),
            IconButton(
              key: Key('delete-' + intervention.code),
              tooltip: 'Eliminar intervención',
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
            ),
            IconButton(
              tooltip: 'Copiar a USB',
              onPressed: onBackup,
              icon: const Icon(Icons.usb_outlined),
            ),
            if (documentError)
              Tooltip(
                message: 'Documentación pendiente',
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Theme.of(context).colorScheme.error,
                ),
              )
            else
              const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
