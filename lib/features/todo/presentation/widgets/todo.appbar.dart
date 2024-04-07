import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app.localizations.dart';

class TodoAppBar extends StatelessWidget {
  const TodoAppBar({required this.todoCounts, Key? key}) : super(key: key);

  final int todoCounts;

  @override
  Widget build(BuildContext context) {
    final appBarTitle = AppLocalizations.of(context)!.appBarTitle;

    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$appBarTitle (${todoCounts.toString()})",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
