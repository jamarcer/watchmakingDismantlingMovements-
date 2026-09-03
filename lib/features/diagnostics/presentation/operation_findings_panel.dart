import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/application/component_markdown_generator.dart';
import '../../components/domain/component_document_gateway.dart';
import '../../components/domain/component_repository.dart';
import '../../interventions/domain/intervention.dart';
import '../../photos/domain/photo_asset.dart';
import '../domain/diagnostic.dart';
import '../domain/diagnostic_repository.dart';
import 'diagnostic_panel.dart';

class OperationFindingsPanel extends StatefulWidget {
  const OperationFindingsPanel({
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
  State<OperationFindingsPanel> createState() => _OperationFindingsPanelState();
}

class _OperationFindingsPanelState extends State<OperationFindingsPanel> {
  StreamSubscription<List<DiagnosticFinding>>? _findingsSub;
  StreamSubscription<List<CriticalItem>>? _checklistSub;
  List<DiagnosticFinding> _findings = const [];
  List<CriticalItem> _checklist = const [];
  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _findingsSub = widget.repository.watchFindings(widget.operation.id).listen((
      value,
    ) {
      if (mounted) setState(() => _findings = value);
    });
    _checklistSub = widget.repository
        .watchChecklist(widget.intervention.id)
        .listen((value) {
          if (mounted) setState(() => _checklist = value);
        });
  }

  @override
  void dispose() {
    _findingsSub?.cancel();
    _checklistSub?.cancel();
    super.dispose();
  }

  Future<void> _add() async {
    final draft = await showRegisterFindingDialog(context, widget.photos);
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
      final findings = await widget.repository
          .watchFindings(widget.operation.id)
          .first;
      final components = await widget.componentRepository.getForOperation(
        widget.operation.id,
      );
      final markdown = const ComponentMarkdownGenerator().generate(
        intervention: widget.intervention,
        operation: widget.operation,
        components: components,
        photos: widget.photos,
        complete: widget.operation.status == 'complete',
        findings: findings,
        checklist: _checklist,
      );
      await widget.documentGateway.updateOperation(
        interventionsRoot: widget.intervention.rootDocumentUri,
        interventionFolder: widget.intervention.folderName,
        operationCode: widget.operation.code,
        markdown: markdown,
      );
    } catch (error) {
      _error = 'No se pudo guardar el hallazgo: $error';
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Card(
    key: const Key('operation-findings-panel'),
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
                  'Hallazgos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              FilledButton.icon(
                key: const Key('add-operation-finding'),
                onPressed: _busy ? null : _add,
                icon: const Icon(Icons.add_alert_outlined),
                label: const Text('Registrar hallazgo'),
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
          if (_findings.isEmpty)
            const Text('No hay hallazgos asociados a esta operación.')
          else
            ..._findings.map(
              (finding) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(child: Text(finding.code)),
                title: Text('${finding.zone} · ${finding.category.label}'),
                subtitle: Text(
                  '${finding.description}\n'
                  'Gravedad: ${finding.severity.label}'
                  '${finding.photoAssetId == null ? ' · Sin evidencia' : ' · Con evidencia'}'
                  '${finding.proposedAction == null ? '' : '\nAcción: ${finding.proposedAction}'}',
                ),
                isThreeLine: true,
              ),
            ),
        ],
      ),
    ),
  );
}
