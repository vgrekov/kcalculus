class ImportLockedByAnotherDeviceException implements Exception {
  final dynamic message;

  ImportLockedByAnotherDeviceException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "ImportLockedByAnotherDeviceException: $message";
    }

    return "ImportLockedByAnotherDeviceException";
  }
}
