import 'package:bloc_app/todo_list/model/todo_model.dart';

abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;

  TodoLoadedState(this.todos);
}

class TodoErrorState extends TodoState {
  final String errorMessage;

  TodoErrorState(this.errorMessage);
}