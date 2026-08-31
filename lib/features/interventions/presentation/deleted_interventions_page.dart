import 'package:flutter/material.dart';

import '../domain/intervention.dart';
import '../domain/intervention_repository.dart';

class DeletedInterventionsPage extends StatelessWidget {
  const DeletedInterventionsPage({super.key, required this.repository});
  final InterventionRepository repository;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Intervenciones eliminadas')),
    body: StreamBuilder<List<Intervention>>(
      stream: repository.watchDeleted(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snapshot.data!;
        if (items.isEmpty) {
          return const Center(child: Text('No hay intervenciones eliminadas.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.delete_outline),
                title: Text('${item.code} · ${item.brand}'),
                subtitle: Text(
                  item.deletedAt == null
                      ? 'Eliminada'
                      : 'Eliminada: ${item.deletedAt}',
                ),
                trailing: TextButton.icon(
                  key: Key('restore-${item.code}'),
                  onPressed: () async {
                    await repository.restoreIntervention(item);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.code} restaurada.')),
                      );
                    }
                  },
                  icon: const Icon(Icons.restore),
                  label: const Text('Restaurar'),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
