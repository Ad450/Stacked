import 'package:Stacked/api/services/todo/models/category.model.dart';
import 'package:Stacked/api/services/todo/models/task.model.dart';
import 'package:hive/hive.dart';

void registerHiveAdapters() {
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
}
