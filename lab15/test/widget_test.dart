import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart';

void main() {
  group('FunctionCalculator tests', () {
    test('Correctly calculates the function y = (x^2 + x) - 100', () {
      final calculator = FunctionCalculator();
      expect(calculator.calculate(0), -100);
      expect(calculator.calculate(1), -98);
      expect(calculator.calculate(-1), -100);
    });
  });

  testWidgets('Home page displays correct title text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('IPZ-32: Taras last Flutter App'), findsOneWidget);
  });

  testWidgets('FloatingActionButton uses correct icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final floatingActionButton = find.byType(FloatingActionButton);
    expect(floatingActionButton, findsOneWidget);
    expect(find.byIcon(Icons.camera_alt_outlined), findsOneWidget);
  });

  testWidgets('Counter increments by 2 on FAB press', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('4'), findsOneWidget);
  });
}