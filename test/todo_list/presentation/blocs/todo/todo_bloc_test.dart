import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase.dart';
import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_bloc.dart';
import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_event.dart';
import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_state.dart';
import 'package:bloc_app/todo_list/core/models/default_response_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late GetAllTodosUsecase getAllTodosUsecaseMock;
  late TodoBloc bloc;

  setUp(() {
    getAllTodosUsecaseMock = GetAllTodosUsecaseImpMock();
    bloc = TodoBloc(getAllTodosUsecaseMock);
  });

  tearDown(() {
    bloc.close();
  });

  test('expect initial state is TodoInitialState', () {
    expect(bloc.state, isA<TodoInitialState>());
  });

  group('[GetAllTodos]', () {
    blocTest<TodoBloc, TodoState>(
      'should emit TodoLoadingState - TodoLoadedState when isSuccess is true',
      build: () => bloc,
      act: (TodoBloc bloc) {
        when(() => getAllTodosUsecaseMock()).thenAnswer(
          (_) => Future.value(
            DefaultResponseModel(
              isSuccess: true,
              data: [
                TodoEntity(title: '', body: '', id: 1),
                TodoEntity(title: '', body: '', id: 2),
              ],
            ),
          ),
        );
        bloc.add(TodoGetAllEvent());
      },
      verify: (_) => verify(() => getAllTodosUsecaseMock()).called(1),
      expect: () => [
        isA<TodoLoadingState>(),
        isA<TodoLoadedState>()
            .having((state) => state.todos.isNotEmpty, 'isNotEmpty', true),
      ],
    );

    blocTest(
      'should emit TodoLoadingState - TodoLoadedState when the data is Null and isSuccess is true',
      build: () => bloc,
      act: (TodoBloc bloc) {
        when(() => getAllTodosUsecaseMock()).thenAnswer(
          (_) => Future.value(
            DefaultResponseModel(isSuccess: true),
          ),
        );
        bloc.add(TodoGetAllEvent());
      },
      expect: () => [
        isA<TodoLoadingState>(),
        isA<TodoLoadedState>()
            .having((state) => state.todos.isEmpty, 'isEmpty list', true),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'should emit TodoLoadingState - TodoErrorState when isSuccess is false',
      build: () => bloc,
      act: (bloc) {
        when(() => getAllTodosUsecaseMock()).thenAnswer(
          (_) => Future.value(
            DefaultResponseModel(
              isSuccess: false,
              message: 'error',
            ),
          ),
        );
        bloc.add(TodoGetAllEvent());
      },
      expect: () => [
        isA<TodoLoadingState>(),
        isA<TodoErrorState>()
            .having((state) => state.errorMessage, 'ErrorMessage', 'error'),
      ],
    );
  });
}
