import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_with_tdd/my_app.dart';

class Durations {
  static Duration fast = const Duration(milliseconds: 400);
  static Duration medium = const Duration(milliseconds: 1200);
  static Duration slow = const Duration(milliseconds: 2000);
}

const durations = {};
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Should display the newly added item in the list',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.enterText(find.byType(TextField), 'A');
      // Tap the add button.
      await tester.tap(find.byType(FloatingActionButton));

      // Rebuild the widget after the state has changed.
      await tester.pump();

      // Expect to find the item on screen.
      await Future.delayed(Durations.fast);
      expect(find.text('A'), findsOneWidget);
      final totalFinder = find.text('Total: 1');
      final completoFinder = find.text('Completo: 0%');
      await Future.delayed(Durations.slow);
      expect(totalFinder, findsOneWidget);
      expect(completoFinder, findsOneWidget);
    },
  );
}
