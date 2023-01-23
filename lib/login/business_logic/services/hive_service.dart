import 'package:bloc_app/login/core/utils/extensions.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/utils/custom_types.dart';

class HiveService<T> {
  Box<T>? _box;
  final String _boxName;

  HiveService(this._boxName);

  Box<T> get box {
    if(_box == null) {
      _openBox();
    }
    return _box!;
  }

  Future<void> _openBox() async {
    _box ??= await Hive.openBox<T>(_boxName);
  }

  Future<int> add(T value) async {
    await _openBox();
    return _box!.add(value);
  }

  Future<Iterable<int>> addAll(List<T> values) async {
    await _openBox();
    return _box!.addAll(values);
  }

  Future<void> put(dynamic key, T value) async {
    await _openBox();
    return _box!.put(key, value);
  }

  Future<void> putAll(Map<dynamic, T> values) async {
    await _openBox();
    return _box!.putAll(values);
  }

  Future<T?> findOne(Condition<T> condition) async {
    await _openBox();
    return _box!.values.firstWhereOrNull(condition);
  }

  Future<List<T>> findAll() async {
    await _openBox();
    return _box!.values.toList();
  }

  Future<List<T>> findAllWhere(Condition<T> condition) async {
    await _openBox();
    return _box!.values.where(condition).toList();
  }

  Future<T?> findByKey(dynamic key) async {
    await _openBox();
    print(_box!.keys);
    print(_box!.values);
    return _box!.get(key);
  }

  Future<void> deleteByKey(dynamic key) async {
    await _openBox();
    await _box!.delete(key);
  }
  
  Future<void> deleteWhere(Condition<T> condition) async {
    await _openBox();
    final values = _box!.values.where(condition).toList();
    
    for (var value in values) {
      final index = _box!.values.toList().indexOf(value);
      await _box!.deleteAt(index);
    }
  }

  Future<void> close() async {
    if(_box != null && _box!.isOpen) {
      await _box!.close();
    }
  }
}
