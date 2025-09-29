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
