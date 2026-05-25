class SearchNotConfiguredException implements Exception {
  final dynamic message;

  SearchNotConfiguredException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "SearchNotConfiguredException: $message";
    }

    return "SearchNotConfiguredException";
  }
}
