import 'package:Stacked/api/services/todo/ITodoService.dart';
import 'package:Stacked/api/services/todo/TodoService.dart';
import 'package:Stacked/core/app/app.theme.dart';
import 'package:Stacked/core/storage/hive.dart';
import 'package:Stacked/features/todo/presentation/todo.view.dart';
import 'package:Stacked/features/todo/usecase/ITodoUsecase.dart';
import 'package:Stacked/features/todo/usecase/TodoUsecase.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    // MaterialRoute(page: HomeView),
    MaterialRoute(page: TodoView, initial: true),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HiveService),
    LazySingleton(
      classType: TodoService,
      asType: ITodoService,
      resolveUsing: TodoService.getInstance,
    ),
    LazySingleton(classType: TodoUsecase, asType: ITodoUsecase),
    Singleton(classType: AppTheme)

    // @stacked-service
  ],
)
class App {}
