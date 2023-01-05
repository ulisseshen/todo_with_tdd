import 'package:flutter/material.dart';
import 'package:todo_with_tdd/todo_item.dart';

import 'todo.model.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final todos = [];

  int get total {
    return todos.length;
  }

  int get porcentagemCompleto {
    final completo = todos.where((element) => element.done).length;
    if (total == 0) {
      return 0;
    }
    return (completo / total * 100).round();
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tdd Clean Architecture"),
        ),
        body: Column(
          children: [
            Text("Total: $total"),
            Text("Completo: $porcentagemCompleto%"),
            Divider(),
            TextField(
              controller: controller,
            ),
            Divider(),
            Expanded(
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];

                      return Dismissible(
                          key: Key("$todo$index"),
                          background: Container(color: Colors.red),
                          onDismissed: (direction) => setState(() {
                                todos.removeAt(index);
                              }),
                          child: TodoItem(todo: todo));
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(Todo(description: controller.text));
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
