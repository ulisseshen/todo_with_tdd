import 'package:flutter/material.dart';

import 'todo.model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(todo.description),
        trailing: todo.done
            ? Icon(
                Icons.check_circle,
                color: Colors.green[200],
              )
            : null);
  }
}
