import 'package:bloc_app/todo_list/data/datasources/get_all_todos_datasource.dart';

class GetAllTodosLocalDataSourceImp implements GetAllTodosDataSource {
  final _jsonItems = [
      {
        'id': 1,
        'title': 'Teste',
        'body': 'Teste 123',
      },
      {
        'id': 2,
        'title': 'Teste',
        'body': 'Teste 123',
      }
    ];

  @override
  Future<List<Map<String, dynamic>>> call() async {
    return _jsonItems;
  }
}