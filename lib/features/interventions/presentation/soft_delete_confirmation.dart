import 'package:flutter/material.dart';

Future<bool> confirmSoftDelete(
  BuildContext context, {
  required String code,
  required String entityLabel,
}) async {
  final first = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Eliminar $entityLabel'),
      content: Text(
        '$code dejará de aparecer en las vistas habituales. '
        'Los datos y archivos se conservarán y podrán restaurarse.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          key: const Key('soft-delete-first-confirm'),
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Continuar'),
        ),
      ],
    ),
  );
  if (first != true || !context.mounted) return false;

  var matches = false;
  final confirmed = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text('Confirmación final'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Escribe exactamente $code para confirmar.'),
            const SizedBox(height: 12),
            TextField(
              key: const Key('soft-delete-code-field'),
              autofocus: true,
              autocorrect: false,
              onChanged: (value) => setState(() => matches = value == code),
              decoration: const InputDecoration(
                labelText: 'Código',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            key: const Key('soft-delete-final-confirm'),
            onPressed: matches ? () => Navigator.pop(context, true) : null,
            child: const Text('Eliminar'),
          ),
        ],
      ),
    ),
  );
  return confirmed == true;
}
