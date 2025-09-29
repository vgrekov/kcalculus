class UserNotFoundException implements Exception {
  final dynamic message;

  UserNotFoundException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "UserNotFoundException: $message";
    }

    return "UserNotFoundException";
  }
}
