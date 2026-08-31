import 'package:flutter/material.dart';

import '../domain/intervention.dart';
import '../domain/intervention_repository.dart';

class InterventionTimelinePage extends StatefulWidget {
  const InterventionTimelinePage({
    super.key,
    required this.intervention,
    required this.repository,
    required this.onOperationTap,
  });
  final Intervention intervention;
  final InterventionRepository repository;
  final Future<void> Function(DisassemblyOperation operation) onOperationTap;
  @override
  State<InterventionTimelinePage> createState() =>
      _InterventionTimelinePageState();
}

class _InterventionTimelinePageState extends State<InterventionTimelinePage> {
  String _filter = 'all';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('${widget.intervention.code} · Cronología')),
    body: FutureBuilder<List<TimelineEntry>>(
      future: widget.repository.timeline(widget.intervention.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final all = snapshot.data!;
        final entries = _filter == 'all'
            ? all
            : all.where((e) => e.kind == _filter).toList();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'all', label: Text('Todos')),
                  ButtonSegment(value: 'operation', label: Text('Operaciones')),
                  ButtonSegment(value: 'audit', label: Text('Auditoría')),
                ],
                selected: {_filter},
                onSelectionChanged: (v) => setState(() => _filter = v.first),
              ),
            ),
            Expanded(
              child: entries.isEmpty
                  ? const Center(
                      child: Text('No hay eventos para este filtro.'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return Card(
                          child: ListTile(
                            leading: Icon(
                              entry.kind == 'operation'
                                  ? Icons.build_outlined
                                  : Icons.history,
                            ),
                            title: Text(entry.title),
                            subtitle: Text(
                              '${_date(entry.when)}${entry.detail == null ? '' : '\n${entry.detail}'}',
                            ),
                            onTap: entry.operationId == null
                                ? null
                                : () async {
                                    final op = await widget.repository
                                        .operationById(entry.operationId!);
                                    if (op != null && context.mounted) {
                                      await widget.onOperationTap(op);
                                    }
                                  },
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    ),
  );
  String _date(DateTime value) =>
      '${value.day.toString().padLeft(2, '0')}/${value.month.toString().padLeft(2, '0')}/${value.year} ${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
}
