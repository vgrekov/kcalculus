class InvalidEmailException implements Exception {
  final dynamic message;

  InvalidEmailException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "InvalidEmailException: $message";
    }

    return "InvalidEmailException";
  }
}
