class Paginable<T> {
  int totalItemsCount;
  int page;
  List<T> items;

  Paginable({
    required this.totalItemsCount,
    required this.page,
    required this.items,
  });

  factory Paginable.clean() => Paginable<T>(totalItemsCount: 0, items: [], page: 1);
  
  bool get isEnd => items.length == totalItemsCount;

  int get nextPage => page + 1;
}
