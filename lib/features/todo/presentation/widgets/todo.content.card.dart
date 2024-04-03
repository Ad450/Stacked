import "package:flutter/material.dart";

class TodoContentCard extends StatelessWidget {
  const TodoContentCard({required this.todo, Key? key}) : super(key: key);

  final dynamic todo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Text(todo.title),
    );
  }
}
