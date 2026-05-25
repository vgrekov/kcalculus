class TooManyRequestsException implements Exception {
  final dynamic message;

  TooManyRequestsException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "TooManyRequestsException: $message";
    }

    return "TooManyRequestsException";
  }
}
