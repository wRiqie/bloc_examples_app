import '../../../domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class TodoGetAllEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final TodoEntity todo;

  TodoAddEvent(this.todo);
}

class TodoDeleteEvent extends TodoEvent {
  final int id;

  TodoDeleteEvent(this.id);
}

class TodoUpdateEvent extends TodoEvent {
  final TodoEntity todo;

  TodoUpdateEvent(this.todo);
}