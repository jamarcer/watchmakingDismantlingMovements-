import 'dart:async';

import 'package:flutter/material.dart';

import '../../interventions/domain/intervention.dart';
import '../../photos/domain/photo_asset.dart';
import '../application/component_markdown_generator.dart';
import '../domain/component.dart';
import '../domain/component_document_gateway.dart';
import '../domain/component_repository.dart';

Future<ComponentDraft?> showRegisterComponentDialog(
  BuildContext context,
  String defaultTray,
) => showDialog<ComponentDraft>(
  context: context,
  builder: (_) => _ComponentDialog(defaultTray: defaultTray),
);

Future<ComponentDraft?> showEditComponentDialog(
  BuildContext context,
  WatchComponent component,
) => showDialog<ComponentDraft>(
  context: context,
  builder: (_) => _ComponentDialog(component: component),
);

class ComponentPanel extends StatefulWidget {
  const ComponentPanel({
    super.key,
    required this.intervention,
    required this.operation,
    required this.photos,
    required this.repository,
    required this.documentGateway,
  });
  final Intervention intervention;
  final DisassemblyOperation operation;
  final List<PhotoAsset> photos;
  final ComponentRepository repository;
  final ComponentDocumentGateway documentGateway;
  @override
  State<ComponentPanel> createState() => _ComponentPanelState();
}

class _ComponentPanelState extends State<ComponentPanel> {
  StreamSubscription<List<WatchComponent>>? _subscription;
  List<WatchComponent> _items = [];
  bool _busy = false;
  late bool _complete;
  String? _error;
  @override
  void initState() {
    super.initState();
    _complete = widget.operation.status == 'complete';
    _subscription = widget.repository
        .watchForOperation(widget.operation.id)
        .listen((v) {
          if (mounted) setState(() => _items = v);
        });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  OperationCompleteness get _state => OperationCompleteness(
    hasTitle: widget.operation.title.trim().isNotEmpty,
    hasBeforePhoto: widget.photos.any(
      (p) => p.kind == OperationPhotoKind.before,
    ),
    hasAfterPhoto: widget.photos.any((p) => p.kind == OperationPhotoKind.after),
    allComponentsLocated: _items.every((c) => c.tray.trim().isNotEmpty),
    hasAnnotatedPhoto: widget.photos.any(
      (p) => p.kind == OperationPhotoKind.annotated,
    ),
    hasPartsPhoto: widget.photos.any((p) => p.kind == OperationPhotoKind.parts),
  );
  Future<void> _sync({bool? complete}) async {
    final items = await widget.repository.getForOperation(widget.operation.id);
    final markdown = const ComponentMarkdownGenerator().generate(
      intervention: widget.intervention,
      operation: widget.operation,
      components: items,
      photos: widget.photos,
      complete: complete ?? _complete,
    );
    await widget.documentGateway.updateOperation(
      interventionsRoot: widget.intervention.rootDocumentUri,
      interventionFolder: widget.intervention.folderName,
      operationCode: widget.operation.code,
      markdown: markdown,
    );
  }

  Future<void> _add() async {
    final draft = await showDialog<ComponentDraft>(
      context: context,
      builder: (_) => _ComponentDialog(defaultTray: widget.operation.code),
    );
    if (draft == null) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await widget.repository.add(
        interventionId: widget.intervention.id,
        operationId: widget.operation.id,
        draft: draft,
      );
      await _sync();
    } catch (e) {
      _error = 'No se pudo guardar el componente: $e';
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _edit(WatchComponent component) async {
    final draft = await showDialog<ComponentDraft>(
      context: context,
      builder: (_) => _ComponentDialog(component: component),
    );
    if (draft == null) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await widget.repository.update(
        component: component,
        description: draft.description,
        quantity: draft.quantity,
        tray: draft.tray,
        notes: draft.notes,
      );
      await _sync();
    } catch (e) {
      _error = 'No se pudo actualizar el componente: $e';
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _finish() async {
    if (!_state.canComplete) return;
    setState(() => _busy = true);
    try {
      await widget.repository.completeOperation(widget.operation.id);
      await _sync(complete: true);
      if (mounted) setState(() => _complete = true);
    } catch (e) {
      _error = 'No se pudo completar ' + widget.operation.code + ': $e';
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = _state;
    return Card(
      key: const Key('component-panel'),
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Componentes y completitud',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                FilledButton.icon(
                  key: const Key('add-component'),
                  onPressed: _busy ? null : _add,
                  icon: const Icon(Icons.add),
                  label: const Text('Registrar'),
                ),
              ],
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            const SizedBox(height: 8),
            if (_items.isEmpty)
              const Text('Todavía no hay componentes registrados.')
            else
              ..._items.map(
                (c) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(child: Text(c.code)),
                  title: Text('${c.type.label} · ${c.description}'),
                  subtitle: Text(
                    'Cantidad: ${c.quantity} · Bandeja: ${c.tray.isEmpty ? 'pendiente' : c.tray}${c.position == null ? '' : ' · ${c.position}'}',
                  ),
                  trailing: IconButton(
                    key: Key('edit-component-' + c.code),
                    tooltip:
                        widget.intervention.status == InterventionStatus.closed
                        ? 'La intervención está cerrada'
                        : 'Editar componente',
                    onPressed:
                        _busy ||
                            widget.intervention.status ==
                                InterventionStatus.closed
                        ? null
                        : () => _edit(c),
                    icon: const Icon(Icons.edit_outlined),
                  ),
                ),
              ),
            const Divider(),
            Text(
              _complete ? widget.operation.code + ' completa' : 'Pendientes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (!_complete && state.blockers.isEmpty)
              const Text('No hay requisitos bloqueantes.')
            else if (!_complete)
              ...state.blockers.map(
                (v) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.radio_button_unchecked),
                  title: Text(v),
                ),
              ),
            if (state.recommendations.isNotEmpty) ...[
              const Text('Recomendado'),
              ...state.recommendations.map(
                (v) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.info_outline),
                  title: Text(v),
                ),
              ),
            ],
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                key: const Key('complete-operation'),
                onPressed: _busy || _complete || !state.canComplete
                    ? null
                    : _finish,
                icon: Icon(_complete ? Icons.verified : Icons.task_alt),
                label: Text(
                  _complete ? 'Operación completada' : 'Completar operación',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComponentDialog extends StatefulWidget {
  const _ComponentDialog({this.component, this.defaultTray = ''});
  final WatchComponent? component;
  final String defaultTray;
  @override
  State<_ComponentDialog> createState() => _ComponentDialogState();
}

class _ComponentDialogState extends State<_ComponentDialog> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _description,
      _quantity,
      _position,
      _orientation,
      _tray,
      _notes;
  late ComponentType _type;

  @override
  void initState() {
    super.initState();
    final item = widget.component;
    _type = item?.type ?? ComponentType.part;
    _description = TextEditingController(text: item?.description ?? '');
    _quantity = TextEditingController(text: (item?.quantity ?? 1).toString());
    _position = TextEditingController(text: item?.position ?? '');
    _orientation = TextEditingController(text: item?.orientation ?? '');
    _tray = TextEditingController(text: item?.tray ?? widget.defaultTray);
    _notes = TextEditingController(text: item?.notes ?? '');
  }

  @override
  void dispose() {
    for (final c in [
      _description,
      _quantity,
      _position,
      _orientation,
      _tray,
      _notes,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _optional(String value) {
    final v = value.trim();
    return v.isEmpty ? null : v;
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      widget.component == null ? 'Registrar componente' : 'Editar componente',
    ),
    content: SizedBox(
      width: 728,
      child: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<ComponentType>(
                      key: const Key("component-type"),
                      initialValue: _type,
                      decoration: const InputDecoration(labelText: "Tipo"),
                      items: ComponentType.values
                          .map(
                            (v) => DropdownMenuItem(
                              value: v,
                              child: Text("${v.prefix}xx · ${v.label}"),
                            ),
                          )
                          .toList(),
                      onChanged: widget.component == null
                          ? (v) => setState(() => _type = v!)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      key: const Key("component-quantity"),
                      controller: _quantity,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Cantidad *",
                      ),
                      validator: (v) => (int.tryParse(v ?? "") ?? 0) < 1
                          ? "Debe ser mayor que cero."
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      key: const Key("component-tray"),
                      controller: _tray,
                      decoration: const InputDecoration(
                        labelText: "Bandeja o compartimento *",
                      ),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? "Introduce una bandeja o compartimento."
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key("component-description"),
                controller: _description,
                decoration: const InputDecoration(labelText: "Descripción *"),
                validator: (v) => v == null || v.trim().isEmpty
                    ? "Introduce una descripción."
                    : null,
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("component-position"),
                      controller: _position,
                      decoration: const InputDecoration(labelText: "Posición"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      key: const Key("component-orientation"),
                      controller: _orientation,
                      decoration: const InputDecoration(
                        labelText: "Orientación",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key("component-notes"),
                controller: _notes,
                decoration: const InputDecoration(labelText: 'Observaciones'),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancelar'),
      ),
      FilledButton(
        key: const Key('save-component'),
        onPressed: () {
          if (!_form.currentState!.validate()) return;
          Navigator.pop(
            context,
            ComponentDraft(
              type: _type,
              description: _description.text.trim(),
              quantity: int.parse(_quantity.text),
              position: _optional(_position.text),
              orientation: _optional(_orientation.text),
              tray: _tray.text.trim(),
              notes: _optional(_notes.text),
            ),
          );
        },
        child: Text(widget.component == null ? 'Guardar' : 'Actualizar'),
      ),
    ],
  );
}
