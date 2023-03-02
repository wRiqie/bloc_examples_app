import 'package:bloc_app/todo_list/core/models/paginable_model.dart';
import 'package:bloc_app/todo_list/data/datasources/get_all_todos_datasource.dart';
import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:hive/hive.dart';

class GetAllTodosLocalDataSourceImp implements GetAllTodosDataSource {
  // late Box<Map<String, dynamic>> _box;
  List<TodoEntity> items = [
    TodoEntity(
      title: '1 teste',
      body: '',
      id: 1,
    ),
    TodoEntity(
      title: '2 teste',
      body: '',
      id: 1,
    ),
    TodoEntity(
      title: '3 teste',
      body: '',
      id: 1,
    ),
    TodoEntity(
      title: '4 teste',
      body: '',
      id: 1,
    ),
    TodoEntity(
      title: '5 teste',
      body: '',
      id: 1,
    ),
    TodoEntity(
      title: '6 teste',
      body: '',
      id: 1,
    ),
    TodoEntity(
      title: '7 teste',
      body: '',
      id: 2,
    ),
    TodoEntity(
      title: '8 teste',
      body: '',
      id: 2,
    ),
    TodoEntity(
      title: '9 teste',
      body: '',
      id: 2,
    ),
    TodoEntity(
      title: '10 teste',
      body: '',
      id: 2,
    ),
    TodoEntity(
      title: '11 teste',
      body: '',
      id: 2,
    ),
    TodoEntity(
      title: '12 teste',
      body: '',
      id: 2,
    ),
    TodoEntity(
      title: '13 teste',
      body: '',
      id: 3,
    ),
    TodoEntity(
      title: '14 teste',
      body: '',
      id: 3,
    ),
    TodoEntity(
      title: '15 teste',
      body: '',
      id: 3,
    ),
    TodoEntity(
      title: '16 teste',
      body: '',
      id: 3,
    ),
    TodoEntity(
      title: '17 teste',
      body: '',
      id: 3,
    ),
    TodoEntity(
      title: '18 teste',
      body: '',
      id: 3,
    ),
  ];

  GetAllTodosLocalDataSourceImp() {
    // Hive.openBox<Map<String, dynamic>>('todo').then((value) => _box = value);
  }

  @override
  Future<Paginable<TodoEntity>> call(int page) async {
    // return _box.values.toList();
    await Future.delayed(const Duration(milliseconds: 1500));
    return Paginable(
        totalItemsCount: items.length,
        page: page,
        items: items.where((e) => e.id == page).toList());
  }
}
