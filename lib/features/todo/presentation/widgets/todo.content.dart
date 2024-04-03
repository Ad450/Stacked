import "package:Stacked/features/todo/presentation/widgets/todo.content.card.dart";
import "package:flutter/material.dart";

class TodoContent extends StatelessWidget {
  const TodoContent({required this.todos, Key? key}) : super(key: key);

  final List<dynamic> todos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, i) => TodoContentCard(todo: todos[i]),
      ),
    );
  }
}
