class NoCommonMeasureException implements Exception {
  final dynamic message;

  NoCommonMeasureException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "NoCommonMeasureException: $message";
    }

    return "NoCommonMeasureException";
  }
}
