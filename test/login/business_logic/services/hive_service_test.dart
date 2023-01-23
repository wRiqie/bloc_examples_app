import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  late HiveService<int> service;

  setUp(() async {
    await setUpTestHive();
    service = HiveService<int>('test');
  });

  tearDown(() async {
    await tearDownTestHive();
    service.close();
  });

  group('[Hive Service]', () {
    test('expect open two equal boxes when call box getter with _box = null', () async {
      final boxStorage1 = await service.box;
      final boxStorage2 = await service.box;
      expect(boxStorage1.hashCode, boxStorage2.hashCode);
    });

    test('expect success add "1"', () async {
      final boxStorage = await service.box;
      await service.add(1);
      expect(boxStorage.values.isEmpty, false);
      expect(boxStorage.values.first, 1);
    });

    test('expect success addAll', () async {
      final boxStorage = await service.box;
      await service.addAll([1, 2, 3]);
      expect(boxStorage.values.isEmpty, false);
      expect(boxStorage.values, [1, 2, 3]);
    });

    test('expect try addAll empty', () async {
      final boxStorage = await service.box;
      await service.addAll([]);
      expect(boxStorage.values.isEmpty, true);
      expect(boxStorage.values, []);
    });

    test('expect to success put {"n": 1}', () async {
      final boxStorage = await service.box;
      await service.put('n', 1);
      expect(boxStorage.values.isEmpty, false);
      expect(boxStorage.keys.first, 'n');
      expect(boxStorage.values.first, 1);
    });

    test('expect to try putAll empty', () async {
      final boxStorage = await service.box;
      await service.putAll({});
      expect(boxStorage.keys.isEmpty, true);
      expect(boxStorage.values.isEmpty, true);
    });

    test('expect to success putAll', () async {
      final boxStorage = await service.box;
      await service.putAll({
        'n1': 1,
        'n2': 2,
      });
      expect(boxStorage.values.isEmpty, false);
      expect(boxStorage.keys, ['n1', 'n2']);
      expect(boxStorage.values, [1, 2]);
    });

    test('expect return null when the box is empty when trying findOne',
        () async {
      final findedNumber = await service.findOne((e) => e == 0);
      expect(findedNumber, null);
    });

    test('expect find the added number "1" when trying findOne', () async {
      await service.add(1);
      final findedNumber = await service.findOne((e) => e == 1);
      expect(findedNumber, 1);
    });

    test(
        'expect not find the added number "1" and return null when trying findOne',
        () async {
      await service.add(1);
      final findedNumber = await service.findOne((e) => e == 2);
      expect(findedNumber, null);
    });

    test(
        'expect to return empty list when the box is empty when trying findAll',
        () async {
      final findedNumbers = await service.findAll();
      expect(findedNumbers.isEmpty, true);
    });

    test('expect to return list when trying findAll', () async {
      await service.addAll([1, 2]);
      final findedNumbers = await service.findAll();
      expect(findedNumbers.isEmpty, false);
      expect(findedNumbers, [1, 2]);
    });

    test(
        'expect to return empty list when the box is empty when trying findAllWhere',
        () async {
      final findedNumbers = await service.findAllWhere((e) => true);
      expect(findedNumbers.isEmpty, true);
    });

    test(
        'expect to return list when trying findAllWhere with items corresponding to the condition',
        () async {
      await service.addAll([1, 2, 3, 4]);
      final findedNumbers = await service.findAllWhere((e) => e % 2 == 0);
      expect(findedNumbers, [2, 4]);
    });

    test('expect find by key', () async {
      await service.putAll({'test1': 1, 'test2': 2});
      final findedNumber = await service.findByKey('test1');
      expect(findedNumber, 1);
    });

    test('expect find nothing by key', () async {
      await service.putAll({'test1': 1});
      final findedNumber = await service.findByKey('test2');
      expect(findedNumber, null);
    });

    test(
        'it is expected that nothing will happen when try to delete a non-existent item by key',
        () async {
      final boxStorage = await service.box;
      await service.deleteByKey('1');
      expect(boxStorage.values, []);
    });

    test('expect to delete "2" by the key', () async {
      final boxStorage = await service.box;
      await service.putAll({
        'n1': 1,
        'n2': 2,
      });
      await service.deleteByKey('n2');
      expect(boxStorage.values, [1]);
    });

    test('expect delete [2, 4] by condition when use deleteWhere', () async {
      final boxStorage = await service.box;
      await service.addAll([1, 2, 3, 4]);
      await service.deleteWhere((e) => e % 2 == 0);
      expect(boxStorage.values, [1, 3]);
    });

    test(
        'it is expected that nothing will happen when try to deleteWhere  a non-existent item by key',
        () async {
      final boxStorage = await service.box;
      await service.addAll([1]);
      await service.deleteWhere((e) => e % 2 == 0);
      expect(boxStorage.values, [1]);
    });

    test('Close box', () async {
      final boxStorage = await service.box;
      await service.add(1);
      await service.close();
      expect(boxStorage.isOpen, false);
    });
  });
}
