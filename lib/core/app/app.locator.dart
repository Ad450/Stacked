// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../../api/services/todo/ITodoService.dart';
import '../../api/services/todo/TodoService.dart';
import '../../features/todo/usecase/ITodoUsecase.dart';
import '../../features/todo/usecase/TodoUsecase.dart';
import '../storage/hive.dart';
import 'app.theme.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => HiveService());
  locator.registerLazySingleton<ITodoService>(() => TodoService.getInstance());
  locator.registerLazySingleton<ITodoUsecase>(() => TodoUsecase());
  locator.registerSingleton(AppTheme());
}
