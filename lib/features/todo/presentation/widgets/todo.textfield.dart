import "package:Stacked/core/app/app.locator.dart";
import "package:Stacked/core/app/app.theme.dart";
import "package:flutter/material.dart";

class TodoTextField extends StatelessWidget {
  const TodoTextField({required this.todoTextController, Key? key})
      : super(key: key);

  final TextEditingController todoTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: locator<AppTheme>().genericGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: TextField(
          controller: todoTextController,
        ),
      ),
    );
  }
}
