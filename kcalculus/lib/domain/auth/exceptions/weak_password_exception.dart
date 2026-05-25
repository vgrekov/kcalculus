class WeakPasswordException implements Exception {
  final dynamic message;

  WeakPasswordException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "WeakPasswordException: $message";
    }

    return "WeakPasswordException";
  }
}
