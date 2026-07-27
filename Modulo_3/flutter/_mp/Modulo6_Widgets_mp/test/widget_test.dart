import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modulo6_widgets_mp/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Saludo()));
    expect(find.byType(Saludo), findsOneWidget);
  });
}
