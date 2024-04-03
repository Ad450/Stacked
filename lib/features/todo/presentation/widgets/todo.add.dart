import "package:Stacked/features/todo/presentation/todo.viewmodel.dart";
import "package:Stacked/features/todo/presentation/widgets/todo.textfield.dart";
import "package:flutter/material.dart";

class TodoAdd extends StatelessWidget {
  const TodoAdd({required this.model, Key? key}) : super(key: key);

  final TodoViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              child:
                  TodoTextField(todoTextController: model.todoTextController),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async => await model.addTodo(
                model.todoTextController.text,
                "constant title here",
                "",
              ),
            )
          ],
        ),
      ),
    );
  }
}
