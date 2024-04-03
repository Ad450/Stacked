import 'package:Stacked/api/services/todo/ITodoService.dart';
import 'package:Stacked/core/app/app.locator.dart';
import 'package:Stacked/core/app/app.typedefs.dart';
import 'package:Stacked/core/utils/errors.dart';
import 'package:Stacked/features/todo/usecase/ITodoUsecase.dart';
import 'package:dartz/dartz.dart';

class TodoUsecase implements ITodoUsecase {
  final ITodoService _todoService = locator<ITodoService>();

  @override
  Future<Either<UIError, VoidType>> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  }) async {
    try {
      await _todoService.addTasks(
        categoryTitle: categoryTitle,
        taskTitle: taskTitle,
        description: description,
      );
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError.fromApiFailure(e));
    }
  }

  @override
  Future<Either<UIError, VoidType>> deleteTasks({
    required String categoryTitle,
    required String taskTitle,
  }) async {
    try {
      await _todoService.deleteTasks(
        categoryTitle: categoryTitle,
        taskTitle: taskTitle,
      );
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError.fromApiFailure(e));
    }
  }

  @override
  Future<Either<UIError, List>> fetchAllTasks() async {
    try {
      final result = await _todoService.fetchAllTasks();
      return Right(result);
    } on ApiFailure catch (e) {
      return Left(UIError.fromApiFailure(e));
    }
  }

  @override
  Future<Either<UIError, VoidType>> markTaskAsComplete({
    required String categoryTitle,
    required String taskTitle,
  }) async {
    try {
      await _todoService.markTaskAsComplete(
        categoryTitle: categoryTitle,
        taskTitle: taskTitle,
      );
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError.fromApiFailure(e));
    }
  }

  @override
  Future<Either<UIError, VoidType>> updateTask({
    required String categoryTitle,
    required String oldTaskTitle,
    required String update,
  }) async {
    try {
      await _todoService.updateTask(
        categoryTitle: categoryTitle,
        update: update,
        oldTaskTitle: oldTaskTitle,
      );
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError.fromApiFailure(e));
    }
  }
}
