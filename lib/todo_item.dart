import 'package:flutter/material.dart';

import 'todo.model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
  });

  final Todo todo;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Icons.check_circle,
          color: todo.done ? Colors.green[200] : null,
        ),
        title: Text(todo.description),
        trailing: OutlinedButton(
          onPressed: onToggle,
          child: Text("toggle"),
        ));
  }
}
