// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/todo_list/core/models/paginable_model.dart';

import '../../../domain/entities/todo_entity.dart';

// abstract class TodoState {}

// class TodoInitialState extends TodoState {}

// class TodoLoadingState extends TodoState {}

// class TodoLoadedState extends TodoState {
//   final List<TodoEntity> todos;

//   TodoLoadedState(this.todos);
// }

// class TodoErrorState extends TodoState {
//   final String errorMessage;

//   TodoErrorState(this.errorMessage);
// }

enum TodoStatus {
  idle,
  loading,
  loadingMore,
  success,
  error;

  bool get isLoading => this == TodoStatus.loading;
  bool get isLoadingMore => this == TodoStatus.loadingMore;
  bool get isSuccess => this == TodoStatus.success;
  bool get isError => this == TodoStatus.error;
}

class TodoState {
  final TodoStatus status;
  final Paginable<TodoEntity>? todos;

  TodoState({
    this.status = TodoStatus.idle,
    this.todos,
  });
  

  TodoState copyWith({
    TodoStatus? status,
    Paginable<TodoEntity>? todos,
  }) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }
}
