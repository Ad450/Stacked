import 'package:Stacked/core/app/app.locator.dart';
import 'package:Stacked/features/todo/usecase/ITodoUsecase.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  final _todoUsecase = locator<ITodoUsecase>();
  final todoTextController = TextEditingController();

  List<dynamic> todos = [];

  Future<void> fetchAllTodos() async {
    setBusy(true);
    final result = await _todoUsecase.fetchAllTasks();
    result.fold((l) => setError(l.message), (r) => todos.addAll(r));
    setBusy(false);

    rebuildUi();
  }

  Future<void> addTodo(
    String categoryTitle,
    String taskTitle,
    String? description,
  ) async {
    todoTextController.clear();
    setBusy(true);

    final result = await _todoUsecase.addTasks(
      categoryTitle: categoryTitle,
      taskTitle: taskTitle,
      description: description,
    );
    result.fold((l) => setError(l.message), (r) => null);
    setBusy(false);

    await fetchAllTodos();
  }

  Future<void> deleteTodo(String categoryTitle, String taskTitle) async {
    setBusy(true);

    final result = await _todoUsecase.deleteTasks(
      categoryTitle: categoryTitle,
      taskTitle: taskTitle,
    );

    result.fold((l) => setError(l.message), (r) => null);
    setBusy(false);

    rebuildUi();
  }

  Future<void> updateTodo(
    String categoryTitle,
    String oldTaskTitle,
    String update,
  ) async {
    setBusy(true);

    final result = await _todoUsecase.updateTask(
      categoryTitle: categoryTitle,
      oldTaskTitle: oldTaskTitle,
      update: update,
    );

    result.fold((l) => setError(l.message), (r) => null);
    setBusy(false);

    rebuildUi();
  }

  Future<void> markTaskAsComplete(
    String categoryTitle,
    String taskTitle,
  ) async {
    setBusy(true);

    final result = await _todoUsecase.markTaskAsComplete(
      categoryTitle: categoryTitle,
      taskTitle: taskTitle,
    );

    result.fold((l) => setError(l.message), (r) => null);
    setBusy(false);

    rebuildUi();
  }
}
