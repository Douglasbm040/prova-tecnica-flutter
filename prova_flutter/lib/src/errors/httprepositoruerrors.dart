class HttpRepositoryErrors {
  String message;
  int? statusCode;
  HttpRepositoryErrors({required this.message, required this.statusCode});

  @override
  String toString() {
    return 'HttpRepositoruErrors: $statusCode , $message';
  }
}
