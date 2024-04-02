import 'package:Stacked/core/app/app.typedefs.dart';
import 'package:Stacked/core/utils/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ITodoUsecase {
  Future<Either<UIError, VoidType>> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  });

  Future<Either<UIError, VoidType>> deleteTasks({
    required String categoryTitle,
    required String taskTitle,
  });

  Future<Either<UIError, List<dynamic>>> fetchAllTasks();

  Future<Either<UIError, VoidType>> updateTask({
    required String categoryTitle,
    required String oldTaskTitle,
    required String update,
  });
  Future<Either<UIError, VoidType>> markTaskAsComplete({
    required String categoryTitle,
    required String taskTitle,
  });
}
