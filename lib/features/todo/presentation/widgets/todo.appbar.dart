import "package:flutter/material.dart";

class TodoAppBar extends StatelessWidget {
  const TodoAppBar({required this.todoCounts, Key? key}) : super(key: key);

  final int todoCounts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Your\nProjects (${todoCounts.toString()})",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
