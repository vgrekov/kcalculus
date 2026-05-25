class AuthRequiredException implements Exception {
  final dynamic message;

  AuthRequiredException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "AuthRequiredException: $message";
    }

    return "AuthRequiredException";
  }
}
