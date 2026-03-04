class ImportUnsavedModelException implements Exception {
  final dynamic message;

  ImportUnsavedModelException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "ImportUnsavedModelException: $message";
    }

    return "ImportUnsavedModelException";
  }
}
