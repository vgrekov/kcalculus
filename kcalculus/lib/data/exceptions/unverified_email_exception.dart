class UnverifiedEmailException implements Exception {
  final dynamic message;

  UnverifiedEmailException(
    this.cooldownEnd, [
    this.message,
  ]);

  final DateTime? cooldownEnd;

  @override
  String toString() {
    if (message != null) {
      return "UnverifiedEmailException: $message";
    }

    return "UnverifiedEmailException";
  }
}
