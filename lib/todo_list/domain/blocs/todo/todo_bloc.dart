import 'package:bloc/bloc.dart';
import 'package:bloc_app/todo_list/domain/blocs/todo/todo_event.dart';
import 'package:bloc_app/todo_list/domain/blocs/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState()) {}

}