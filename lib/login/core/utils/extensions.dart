
extension ListExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if(test(element)) return element; 
    }
    return null;
  }
}

extension IterableExt<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if(test(element)) return element; 
    }
    return null;
  }
}