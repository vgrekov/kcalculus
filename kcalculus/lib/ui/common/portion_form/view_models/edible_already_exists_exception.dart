class EdibleAlreadyExistsException implements Exception {
  final dynamic message;

  EdibleAlreadyExistsException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "EdibleAlreadyExistsException: $message";
    }

    return "EdibleAlreadyExistsException";
  }
}
