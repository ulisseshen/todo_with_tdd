import 'package:flutter/material.dart';

class Todo {
  final String description;
  final bool done;

  Todo({required this.description, this.done = false});
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final todos = [
    Todo(description: "Criar testes de undiade"),
    Todo(description: "Criar testes de integração"),
    Todo(description: "Criar testes de widget", done: true),
  ];

  int getTotal() {
    return todos.length;
  }

  getCompleto() {
    final total = getTotal();
    final completo = todos.where((element) => element.done).length;
    return (completo / total * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tdd Clean Architecture"),
        ),
        body: Column(
          children: [
            Text("Total: ${getTotal()}"),
            Text("Completo: ${getCompleto()}%"),
          ],
        ),
      ),
    );
  }
}
