class PasswordValidator {
  PasswordValidator({
    required this.minLength,
    required this.maxLength,
    required this.uppercaseLetters,
    required this.lowercaseLetters,
    required this.digits,
    required this.specialCharacters,
  }) {
    if (minLength <= 0) {
      throw ArgumentError('"minLength" must be a positive number.');
    }

    if (minLength > maxLength) {
      throw ArgumentError('"minLength" must not be bigger than "maxLength".');
    }

    if (!uppercaseLetters &&
        !lowercaseLetters &&
        !digits &&
        !specialCharacters) {
      final flags = [
        'uppercaseLetters',
        'lowercaseLetters',
        'digits',
        'specialCharacters',
      ].map(
        (e) => '"$e"',
      );
      throw ArgumentError('At least one of the $flags flags must be true.');
    }

    _regex = _buildPasswordRegEx();
  }

  final int minLength;

  final int maxLength;

  final bool uppercaseLetters;

  final bool lowercaseLetters;

  final bool digits;

  final bool specialCharacters;

  late final RegExp _regex;

  bool isValidPassword(String password) {
    return _regex.hasMatch(password);
  }

  RegExp _buildPasswordRegEx() {
    final charGroups = {
      r'A-Z': uppercaseLetters,
      r'a-z': lowercaseLetters,
      r'0-9': digits,
      r'!@#$%^&*': specialCharacters,
    };

    final lookAheads = charGroups.entries
        .where((e) => e.value)
        .map((e) => '(?=.*[${e.key}])')
        .join();

    final structure = '[${charGroups.keys.join()}]{$minLength,$maxLength}';

    final expression = '^$lookAheads$structure\$';

    return RegExp(expression);
  }
}
