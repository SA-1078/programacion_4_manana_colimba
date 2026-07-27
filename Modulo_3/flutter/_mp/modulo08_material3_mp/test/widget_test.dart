import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modulo08_material3_mp/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppMovilExpress());
    expect(find.byType(AppMovilExpress), findsOneWidget);
  });
}
