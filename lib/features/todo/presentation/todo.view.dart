import 'package:Stacked/features/todo/presentation/todo.viewmodel.dart';
import 'package:Stacked/features/todo/presentation/widgets/todo.add.dart';
import 'package:Stacked/features/todo/presentation/widgets/todo.appbar.dart';
import 'package:Stacked/features/todo/presentation/widgets/todo.content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
      viewModelBuilder: () => TodoViewModel(),
      onViewModelReady: (model) async => await model.fetchAllTodos(),
      builder: (_, model, __) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TodoAppBar(todoCounts: model.todos.length),
              model.isBusy
                  ? const CupertinoActivityIndicator()
                  : TodoContent(todos: model.todos),
              TodoAdd(model: model),
            ],
          ),
        ),
      ),
    );
  }
}
