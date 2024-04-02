import "dart:math";

import 'package:Stacked/api/services/todo/ITodoService.dart';
import 'package:Stacked/api/services/todo/models/category.model.dart';
import 'package:Stacked/api/services/todo/models/task.model.dart';
import 'package:Stacked/core/app/app.locator.dart';
import 'package:Stacked/core/storage/hive.dart';
import 'package:Stacked/core/utils/errors.dart';

class TodoService implements ITodoService {
  final HiveService hiveService;
  final String uid;

  TodoService(this.hiveService, this.uid);

  static getInstance() => TodoService(
        locator.get<HiveService>(),
        _generateRandomUid(),
      );

  static String _generateRandomUid() {
    int random = Random().nextInt(1000);
    return random.toString() + "todo";
  }

  @override
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  }) async {
    try {
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(
          key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory != null) {
        final updatedCategory = CategoryModel(
          uid: uid,
          title: categoryTitle,
          tasks: [
            ...existingCategory.tasks,
            TaskModel(uid: uid, title: taskTitle, completed: false)
          ],
        );
        await hiveService
            .saveItem(updatedCategory, HiveBoxNames.categories.name, key: key);
      } else {
        await hiveService.saveItem(
          CategoryModel(uid: uid, title: categoryTitle, tasks: <TaskModel>[
            TaskModel(
              title: taskTitle,
              uid: uid,
              description: description,
              completed: false,
            )
          ]),
          HiveBoxNames.categories.name,
          key: key,
        );
      }
      return;
    } on ApiFailure catch (_) {
      rethrow;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> deleteTasks(
      {required String categoryTitle, required String taskTitle}) async {
    try {
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory =
          await hiveService.readItem(key, HiveBoxNames.categories.name);
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      existingCategory.tasks.removeWhere((e) => e.title == taskTitle);
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name,
          key: key);
      return;
    } on ApiFailure catch (e) {
      throw ApiFailure(e.message);
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<List<dynamic>> fetchAllTasks() async {
    try {
      final categories =
          await hiveService.readAll(HiveBoxNames.categories.name);
      return categories as List<dynamic>;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> updateTask({
    required String categoryTitle,
    required String oldTaskTitle,
    required String update,
  }) async {
    try {
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory =
          await hiveService.readItem(key, HiveBoxNames.categories.name);
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      final taskIndex =
          existingCategory.tasks.indexWhere((e) => e.title == oldTaskTitle);
      if (taskIndex >= 0) {
        existingCategory.tasks[taskIndex] = TaskModel(
          uid: uid,
          title: update,
          completed: existingCategory.tasks[taskIndex].completed,
        );
      } else {
        throw ApiFailure("Task not found");
      }
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name,
          key: key);
      return;
    } on ApiFailure catch (_) {
      rethrow;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> markTaskAsComplete({
    required String categoryTitle,
    required String taskTitle,
  }) async {
    try {
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(
          key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      final taskIndex =
          existingCategory.tasks.indexWhere((e) => e.title == taskTitle);
      if (taskIndex >= 0) {
        existingCategory.tasks[taskIndex] = TaskModel(
          uid: existingCategory.tasks[taskIndex].uid,
          title: existingCategory.tasks[taskIndex].title,
          completed: true,
        );
      } else {
        throw ApiFailure("Task not found");
      }
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name,
          key: key);
      return;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }
}
