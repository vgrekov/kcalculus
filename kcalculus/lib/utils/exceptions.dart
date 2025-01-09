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

class IngredientsCycleException implements Exception {
  final dynamic message;

  IngredientsCycleException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "IngredientsCycleException: $message";
    }

    return "IngredientsCycleException";
  }
}
