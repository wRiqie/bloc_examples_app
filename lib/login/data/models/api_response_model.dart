class ApiResponseModel<T> {
  final bool isSuccess;
  final T? object;
  final String? message;

  ApiResponseModel({
    required this.isSuccess,
    this.object,
    this.message,
  });

  @override
  String toString() => 'ApiResponseModel(isSuccess: $isSuccess, object: $object, message: $message)';
}
