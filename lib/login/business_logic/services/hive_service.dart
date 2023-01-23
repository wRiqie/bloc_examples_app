import 'package:bloc_app/login/core/utils/extensions.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/utils/custom_types.dart';

class HiveService<T> {
  Box<T>? _box;
  final String _boxName;

  HiveService(this._boxName);

  Future<Box<T>> get box async {
    if(_box == null) {
      await _openBox();
    }
    return _box!;
  }

  Future<void> _openBox() async {
    _box ??= await Hive.openBox<T>(_boxName);
  }

  Future<int> add(T value) async {
    final boxStorage = await box;
    return boxStorage.add(value);
  }

  Future<Iterable<int>> addAll(List<T> values) async {
    final boxStorage = await box;
    return boxStorage.addAll(values);
  }

  Future<void> put(dynamic key, T value) async {
    final boxStorage = await box;
    return boxStorage.put(key, value);
  }

  Future<void> putAll(Map<dynamic, T> values) async {
    final boxStorage = await box;
    return boxStorage.putAll(values);
  }

  Future<T?> findOne(Condition<T> condition) async {
    final boxStorage = await box;
    return boxStorage.values.firstWhereOrNull(condition);
  }

  Future<List<T>> findAll() async {
    final boxStorage = await box;
    return boxStorage.values.toList();
  }

  Future<List<T>> findAllWhere(Condition<T> condition) async {
    final boxStorage = await box;
    return boxStorage.values.where(condition).toList();
  }

  Future<T?> findByKey(dynamic key) async {
    final boxStorage = await box;
    return boxStorage.get(key);
  }

  Future<void> deleteByKey(dynamic key) async {
    final boxStorage = await box;
    await boxStorage.delete(key);
  }
  
  Future<void> deleteWhere(Condition<T> condition) async {
    final boxStorage = await box;
    final values = boxStorage.values.where(condition).toList();
    
    for (var value in values) {
      final index = boxStorage.values.toList().indexOf(value);
      await boxStorage.deleteAt(index);
    }
  }

  Future<void> close() async {
    if(_box != null && _box!.isOpen) {
      await _box!.close();
    }
  }
}
