import 'package:bloc_app/todo_list/model/todo_model.dart';

abstract class TodoEvent {}

class TodoGetEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final TodoModel todo;

  TodoAddEvent(this.todo);
}

class TodoDeleteEvent extends TodoEvent {
  final int id;

  TodoDeleteEvent(this.id);
}

class TodoUpdateEvent extends TodoEvent {
  final TodoModel todo;

  TodoUpdateEvent(this.todo);
}