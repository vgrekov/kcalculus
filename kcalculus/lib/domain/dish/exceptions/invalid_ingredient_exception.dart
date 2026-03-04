class InvalidIngredientException implements Exception {
  final dynamic message;

  InvalidIngredientException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "InvalidIngredientException: $message";
    }

    return "InvalidIngredientException";
  }
}
