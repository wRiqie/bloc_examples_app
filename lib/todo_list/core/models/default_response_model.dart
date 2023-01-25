class DefaultResponseModel<T> {
  bool isSuccess;
  T? data;
  String message;

  DefaultResponseModel({
    required this.isSuccess,
    this.data,
    this.message = '',
  });
}
