import 'package:bloc_app/todo_list/data/datasources/get_all_todos_datasource.dart';
import 'package:bloc_app/todo_list/data/datasources/local/get_all_todos_local_datasource_imp.dart';
import 'package:bloc_app/todo_list/data/repositories/get_all_todos_repository_imp.dart';
import 'package:bloc_app/todo_list/domain/repositories/get_all_todos_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase.dart';
import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase_imp.dart';
import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_bloc.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void initialize() {
    final getIt = GetIt.instance;

    // datasources
    getIt.registerLazySingleton<GetAllTodosDataSource>(
        () => GetAllTodosLocalDataSourceImp());
    // repositories
    getIt.registerLazySingleton<GetAllTodosRepository>(
        () => GetAllTodosRepositoryImp(getIt()));
    // usecases
    getIt.registerLazySingleton<GetAllTodosUsecase>(
        () => GetAllTodosUsecaseImp(getIt()));
    // blocs
    getIt.registerLazySingleton<TodoBloc>(() => TodoBloc(getIt()));
  }
}
