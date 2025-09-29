class InvalidCredentialsException implements Exception {
  final dynamic message;

  InvalidCredentialsException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "InvalidCredentialsException: $message";
    }

    return "InvalidCredentialsException";
  }
}
