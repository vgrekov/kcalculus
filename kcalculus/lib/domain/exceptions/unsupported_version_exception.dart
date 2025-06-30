class UnsupportedVersionException implements Exception {
  UnsupportedVersionException({
    this.message,
    required this.version,
  });

  final dynamic message;

  final int? version;

  @override
  String toString() {
    if (message != null) {
      return "UnsupportedVersionException: $message";
    }

    return "UnsupportedVersionException";
  }
}
