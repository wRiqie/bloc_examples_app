import 'package:bloc_app/todo_list/data/datasources/get_all_todos_datasource.dart';
import 'package:hive/hive.dart';

class GetAllTodosLocalDataSourceImp implements GetAllTodosDataSource {
  late Box<Map<String, dynamic>> _box;

  GetAllTodosLocalDataSourceImp() {
    Hive.openBox<Map<String, dynamic>>('todo').then((value) => _box = value);
  }

  @override
  Future<List<Map<String, dynamic>>> call() async {
    return _box.values.toList();
  }
}