import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primera_app/widgets/contador_limitado.dart';

void main() {
  testWidgets('ContadorLimitado widget test for custom parameter logic', (WidgetTester tester) async {
    bool onLimiteCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ContadorLimitado(
            etiqueta: 'Test Limit',
            limite: 1,
            color: Colors.deepPurple,
            textoBoton: 'Intentar',
            pasoIncremento: 1,
            onLimite: () {
              onLimiteCalled = true;
            },
          ),
        ),
      ),
    );

    // Verify initial values and colors
    expect(find.text('Test Limit'), findsOneWidget);
    expect(find.text('Intentar'), findsOneWidget);
    expect(find.text('0 / 1'), findsOneWidget);

    // Tap button to increment
    await tester.tap(find.text('Intentar'));
    await tester.pump();

    // Verify limit reached
    expect(find.text('1 / 1'), findsOneWidget);
    expect(onLimiteCalled, isTrue);

    // Verify disabled state of the FilledButton
    final FilledButton button = tester.widget(find.byType(FilledButton));
    expect(button.onPressed, isNull);
    expect(find.text('Límite alcanzado'), findsOneWidget);
  });
}
