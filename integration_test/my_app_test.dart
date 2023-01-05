import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_with_tdd/my_app.dart';
import 'package:todo_with_tdd/todo_item.dart';

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

      TodoItem item = tester.widgetList<TodoItem>(find.byType(TodoItem)).first;

      expect(item.todo.description, 'A');
      expect(item.todo.done, false);

      await tester.enterText(find.byType(TextField), 'B');
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      final newTotalFinder = find.text('Total: 2');
      expect(newTotalFinder, findsOneWidget);
      await Future.delayed(Durations.slow);

      var button = find.byType(OutlinedButton).first;

      await tester.tap(button);
      await tester.pump();

      TodoItem todoItem =
          tester.widgetList<TodoItem>(find.byType(TodoItem)).first;

      expect(todoItem.todo.description, 'A');
      expect(todoItem.todo.done, true);

      expect(find.text('Completo: 50%'), findsOneWidget);
      await Future.delayed(Durations.slow);

      // Swipe the item to dismiss it.
      await tester.drag(
          find.byType(Dismissible).first, const Offset(500.0, 0.0));

      // Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();
      await Future.delayed(Durations.slow);

      expect(find.text('Completo: 0%'), findsOneWidget);
      expect(find.text('Total: 1'), findsOneWidget);
    },
  );
}
