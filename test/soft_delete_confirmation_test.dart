import 'package:fichas_desmontaje/features/interventions/presentation/soft_delete_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('exige dos confirmaciones y el código exacto', (tester) async {
    bool? result;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              result = await confirmSoftDelete(
                context,
                code: 'D01',
                entityLabel: 'operación',
              );
            },
            child: const Text('Abrir'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    expect(find.text('Eliminar operación'), findsOneWidget);

    await tester.tap(find.byKey(const Key('soft-delete-first-confirm')));
    await tester.pumpAndSettle();

    final finalButton = find.byKey(const Key('soft-delete-final-confirm'));
    expect(tester.widget<FilledButton>(finalButton).onPressed, isNull);

    await tester.enterText(
      find.byKey(const Key('soft-delete-code-field')),
      'd01',
    );
    await tester.pump();
    expect(tester.widget<FilledButton>(finalButton).onPressed, isNull);

    await tester.enterText(
      find.byKey(const Key('soft-delete-code-field')),
      'D01',
    );
    await tester.pump();
    expect(tester.widget<FilledButton>(finalButton).onPressed, isNotNull);

    await tester.tap(finalButton);
    await tester.pumpAndSettle();
    expect(result, isTrue);
  });
}
