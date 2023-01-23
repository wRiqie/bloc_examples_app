import 'package:bloc_app/login/core/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[List extension]', () {
    test('firstWhereOrNull', () {
      List<int> list = [1, 2, 3, 4];
      expect(list.firstWhereOrNull((e) => e == 1), 1);
      expect(list.firstWhereOrNull((e) => e == 5), null);
    });
  });

  group('[Iterable extension]', () {
    test('firstWhereOrNull', () {
      Iterable<int> iterable = [1, 2, 3, 4];
      expect(iterable.firstWhereOrNull((e) => e == 1), 1);
      expect(iterable.firstWhereOrNull((e) => e == 5), null);
    });
  });
}