class ValidationErrorHttp implements Exception {
  final String message;


  ValidationErrorHttp({required this.message});

  @override
  String toString() {
    return 'ValidationErrorHttp: $message' ;
  }
}
