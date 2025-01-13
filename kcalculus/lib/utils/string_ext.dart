extension Versioning on String {
  static final versionRegEx = RegExp(r'\s+(\d+)$');

  String nextVersion() {
    if (isEmpty) return '2';

    final version = versionRegEx.firstMatch(this);
    if (version == null) {
      return '$this 2';
    }

    final newVersion = int.parse(version[1]!) + 1;
    return replaceAll(versionRegEx, ' $newVersion');
  }
}
