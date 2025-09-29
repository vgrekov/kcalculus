class DuplicationException implements Exception {
  final dynamic message;

  DuplicationException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "DuplicationException: $message";
    }

    return "DuplicationException";
  }
}
