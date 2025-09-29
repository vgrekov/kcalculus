class UserDisabledException implements Exception {
  final dynamic message;

  UserDisabledException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "UserDisabledException: $message";
    }

    return "UserDisabledException";
  }
}
