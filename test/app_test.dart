// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_with_tdd/my_app.dart';
import 'package:todo_with_tdd/todo_item.dart';

void main() {
  testWidgets('Deve testar a todo list', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.enterText(find.byType(TextField), 'A');
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find the item on screen.
    expect(find.text('A'), findsOneWidget);

    final totalFinder = find.text('Total: 1');
    final completoFinder = find.text('Completo: 0%');
    expect(totalFinder, findsOneWidget);
    expect(completoFinder, findsOneWidget);

    TodoItem item =
        tester.widgetList<TodoItem>(find.byType(TodoItem)).elementAt(0);

    expect(item.todo.description, 'A');
    expect(item.todo.done, false);
  });
}
