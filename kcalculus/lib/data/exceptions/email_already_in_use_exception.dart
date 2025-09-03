class EmailAlreadyInUseException implements Exception {
  final dynamic message;

  EmailAlreadyInUseException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "EmailAlreadyInUseException: $message";
    }

    return "EmailAlreadyInUseException";
  }
}
