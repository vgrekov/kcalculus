class DuplicationException<Model> implements Exception {
  DuplicationException([this.model, this.message]);

  final Model? model;

  final dynamic message;

  @override
  String toString() {
    if (message != null) {
      return "DuplicationException: $message";
    }

    return "DuplicationException";
  }
}
