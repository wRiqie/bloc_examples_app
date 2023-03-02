import 'package:bloc/bloc.dart';
import 'package:bloc_app/todo_list/core/models/paginable_model.dart';

import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllTodosUsecase _getAllTodosUsecase;

  TodoBloc(this._getAllTodosUsecase) : super(TodoState()) {
    on<TodoGetAllEvent>(_mapGetAllEventToState);
  }

  void _mapGetAllEventToState(
      TodoGetAllEvent event, Emitter<TodoState> emit) async {
    event.clear
        ? emit(state.copyWith(status: TodoStatus.loading))
        : emit(state.copyWith(status: TodoStatus.loadingMore));
    final response = await _getAllTodosUsecase(event.page);
    if (response.isSuccess) {
      if (event.clear) {
        emit(state.copyWith(
          status: TodoStatus.success,
          todos: response.data,
        ));
      } else {
        emit(state.copyWith(
          status: TodoStatus.success,
          todos: Paginable(
              totalItemsCount: response.data?.totalItemsCount ?? 0,
              page: response.data?.page ?? 1,
              items: List.of(state.todos?.items ?? [])
                ..addAll(response.data?.items ?? [])),
        ));
      }
    }
  }

  // Future<TodoState> loadAllTodos() async {
  //   final res = await _getAllTodosUsecase();
  //   if(res.isSuccess) {
  //     return TodoLoadedState(res.data ?? []);
  //   } else {
  //     return TodoErrorState(res.message);
  //   }
  // }
}
