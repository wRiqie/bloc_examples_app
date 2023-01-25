import 'package:bloc/bloc.dart';

import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllTodosUsecase _getAllTodosUsecase;

  TodoBloc(this._getAllTodosUsecase) : super(TodoInitialState()) {
    on<TodoGetAllEvent>((event, emit) async {
      emit(TodoLoadingState());
      final res = await loadAllTodos();
      emit(res);
    });
  }

  Future<TodoState> loadAllTodos() async {
    final res = await _getAllTodosUsecase();
    if(res.isSuccess) {
      return TodoLoadedState(res.data ?? []);
    } else {
      return TodoErrorState(res.message);
    }
  }
}
