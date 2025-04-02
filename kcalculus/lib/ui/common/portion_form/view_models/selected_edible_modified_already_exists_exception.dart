class SelectedEdibleModifiedAlreadyExistsException implements Exception {
  final dynamic message;

  SelectedEdibleModifiedAlreadyExistsException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "SelectedEdibleModifiedAlreadyExistsException: $message";
    }

    return "SelectedEdibleModifiedAlreadyExistsException";
  }
}
