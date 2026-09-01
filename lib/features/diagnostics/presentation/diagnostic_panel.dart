import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/application/component_markdown_generator.dart';
import '../../components/domain/component_document_gateway.dart';
import '../../components/domain/component_repository.dart';
import '../../interventions/domain/intervention.dart';
import '../../photos/domain/photo_asset.dart';
import '../domain/diagnostic.dart';
import '../domain/diagnostic_repository.dart';

class DiagnosticPanel extends StatefulWidget {
  const DiagnosticPanel({
    super.key,
    required this.intervention,
    required this.operation,
    required this.photos,
    required this.repository,
    required this.componentRepository,
    required this.documentGateway,
  });
  final Intervention intervention;
  final DisassemblyOperation operation;
  final List<PhotoAsset> photos;
  final DiagnosticRepository repository;
  final ComponentRepository componentRepository;
  final ComponentDocumentGateway documentGateway;
  @override
  State<DiagnosticPanel> createState() => _DiagnosticPanelState();
}

class _DiagnosticPanelState extends State<DiagnosticPanel> {
  StreamSubscription<List<DiagnosticFinding>>? _findingsSub;
  StreamSubscription<List<CriticalItem>>? _checkSub;
  List<DiagnosticFinding> findings = [];
  List<CriticalItem> checklist = [];
  CriticalSystem _system = CriticalSystem.balance;
  bool _busy = false;
  String? _error;
  static const items = {
    CriticalSystem.balance: [
      'Espiral libre y sin deformación',
      'Raqueta y regulación accesibles',
      'Volante sin rozamientos',
    ],
    CriticalSystem.escapement: [
      'Áncora limpia y sin golpes',
      'Paletas correctamente asentadas',
      'Impulso visible',
    ],
    CriticalSystem.train: [
      'Ruedas libres de suciedad',
      'Pivotes sin desgaste visible',
      'Alturas y engranajes correctos',
    ],
    CriticalSystem.barrel: [
      'Barrilete sin corrosión',
      'Muelle real correctamente alojado',
      'Tapa y árbol sin holgura',
    ],
    CriticalSystem.keyless: [
      'Tija y corona sin daños',
      'Tirete y báscula identificados',
      'Puesta en hora funcional',
    ],
    CriticalSystem.automatic: [
      'Rotor libre',
      'Inversores sin bloqueo',
      'Puente automático asentado',
    ],
  };
  @override
  void initState() {
    super.initState();
    _findingsSub = widget.repository.watchFindings(widget.operation.id).listen((
      v,
    ) {
      if (mounted) setState(() => findings = v);
    });
    _checkSub = widget.repository.watchChecklist(widget.intervention.id).listen(
      (v) {
        if (mounted) setState(() => checklist = v);
      },
    );
  }

  @override
  void dispose() {
    _findingsSub?.cancel();
    _checkSub?.cancel();
    super.dispose();
  }

  CriticalItem? _item(String code) => checklist
      .where((i) => i.system == _system && i.itemCode == code)
      .firstOrNull;
  Future<void> _sync() async {
    final cs = await widget.componentRepository.getForOperation(
      widget.operation.id,
    );
    final md = const ComponentMarkdownGenerator().generate(
      intervention: widget.intervention,
      operation: widget.operation,
      components: cs,
      photos: widget.photos,
      complete: widget.operation.status == 'complete',
      findings: findings,
      checklist: checklist,
    );
    await widget.documentGateway.updateOperation(
      interventionsRoot: widget.intervention.rootDocumentUri,
      interventionFolder: widget.intervention.folderName,
      operationCode: widget.operation.code,
      markdown: md,
    );
  }

  Future<void> _addFinding() async {
    final draft = await showDialog<DiagnosticDraft>(
      context: context,
      builder: (_) => _FindingDialog(photos: widget.photos),
    );
    if (draft == null) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await widget.repository.addFinding(
        interventionId: widget.intervention.id,
        operationId: widget.operation.id,
        draft: draft,
      );
      await _sync();
    } catch (e) {
      _error = 'No se pudo guardar el hallazgo: $e';
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _toggle(String code, bool value) async {
    setState(() => _busy = true);
    try {
      await widget.repository.toggleChecklist(
        interventionId: widget.intervention.id,
        system: _system,
        itemCode: code,
        checked: value,
      );
      await _sync();
    } catch (e) {
      _error = 'No se pudo guardar el control: $e';
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = DiagnosticCompleteness(
      findings: findings,
      criticalItems: checklist,
    );
    return Card(
      key: const Key('diagnostic-panel'),
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
                    'Diagnóstico y conjuntos críticos',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                FilledButton.icon(
                  key: const Key('add-finding'),
                  onPressed: _busy ? null : _addFinding,
                  icon: const Icon(Icons.add_alert_outlined),
                  label: const Text('Hallazgo'),
                ),
              ],
            ),
            if (_error != null)
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            if (findings.isEmpty)
              const Text('No hay hallazgos registrados.')
            else
              ...findings.map(
                (f) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(child: Text(f.code)),
                  title: Text('${f.category.label} · ${f.severity.label}'),
                  subtitle: Text(
                    '${f.zone}: ${f.description}${f.photoAssetId == null ? ' · Sin evidencia' : ''}',
                  ),
                ),
              ),
            const Divider(),
            DropdownButtonFormField<CriticalSystem>(
              initialValue: _system,
              decoration: const InputDecoration(labelText: 'Conjunto crítico'),
              items: CriticalSystem.values
                  .map((s) => DropdownMenuItem(value: s, child: Text(s.label)))
                  .toList(),
              onChanged: (v) => setState(() => _system = v!),
            ),
            ...items[_system]!.asMap().entries.map((entry) {
              final code = '${_system.name}_${entry.key + 1}';
              final existing = _item(code);
              return CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: existing?.checked ?? false,
                onChanged: _busy ? null : (v) => _toggle(code, v ?? false),
                title: Text(entry.value),
                subtitle: existing == null
                    ? const Text('Pendiente de revisar')
                    : null,
              );
            }),
            if (state.findingsWithoutEvidence > 0 ||
                state.pendingCriticalItems > 0)
              Text(
                'Pendientes de integridad: ${state.findingsWithoutEvidence} hallazgo(s) sin evidencia · ${state.pendingCriticalItems} control(es) crítico(s)',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )
            else
              const Text(
                'Diagnóstico sin pendientes críticos.',
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}

class _FindingDialog extends StatefulWidget {
  const _FindingDialog({required this.photos});
  final List<PhotoAsset> photos;
  @override
  State<_FindingDialog> createState() => _FindingDialogState();
}

class _FindingDialogState extends State<_FindingDialog> {
  final form = GlobalKey<FormState>();
  final zone = TextEditingController(),
      desc = TextEditingController(),
      action = TextEditingController();
  var category = DiagnosticCategory.other;
  var severity = DiagnosticSeverity.medium;
  String? photo;
  @override
  void dispose() {
    zone.dispose();
    desc.dispose();
    action.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Registrar hallazgo'),
    content: SizedBox(
      width: 728,
      child: Form(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("finding-zone"),
                      controller: zone,
                      decoration: const InputDecoration(
                        labelText: "Zona o pieza *",
                      ),
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? "Obligatorio" : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<DiagnosticCategory>(
                      key: const Key("finding-category"),
                      isExpanded: true,
                      initialValue: category,
                      decoration: const InputDecoration(labelText: "Categoría"),
                      items: DiagnosticCategory.values
                          .map(
                            (v) => DropdownMenuItem(
                              value: v,
                              child: Text(v.label),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => category = v!),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<DiagnosticSeverity>(
                      key: const Key("finding-severity"),
                      isExpanded: true,
                      initialValue: severity,
                      decoration: const InputDecoration(labelText: "Gravedad"),
                      items: DiagnosticSeverity.values
                          .map(
                            (v) => DropdownMenuItem(
                              value: v,
                              child: Text(v.label),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => severity = v!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key("finding-description"),
                controller: desc,
                decoration: const InputDecoration(labelText: "Descripción *"),
                maxLines: 3,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? "Obligatorio" : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                key: const Key("finding-photo"),
                initialValue: photo,
                decoration: const InputDecoration(
                  labelText: "Fotografía de evidencia (opcional)",
                ),
                items: [
                  const DropdownMenuItem<String>(
                    value: null,
                    child: Text("Sin evidencia"),
                  ),
                  ...widget.photos.map(
                    (p) => DropdownMenuItem(
                      value: p.id,
                      child: Text(p.relativePath),
                    ),
                  ),
                ],
                onChanged: (v) => setState(() => photo = v),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key("finding-action"),
                controller: action,
                decoration: const InputDecoration(
                  labelText: "Acción posterior propuesta",
                ),
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
        key: const Key('save-finding'),
        onPressed: () {
          if (!form.currentState!.validate()) return;
          Navigator.pop(
            context,
            DiagnosticDraft(
              zone: zone.text.trim(),
              category: category,
              description: desc.text.trim(),
              severity: severity,
              photoAssetId: photo,
              proposedAction: action.text.trim().isEmpty
                  ? null
                  : action.text.trim(),
            ),
          );
        },
        child: const Text('Guardar'),
      ),
    ],
  );
}
