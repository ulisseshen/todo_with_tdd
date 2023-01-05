class Todo {
  final String description;
  bool done;

  Todo({required this.description, this.done = false});

  @override
  String toString() {
    return "Todo($description,$done)";
  }
}
