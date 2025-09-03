class EmailValidator {
  static final _kEmailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  const EmailValidator();

  bool isValidEmail(String email) {
    return _kEmailRegex.hasMatch(email);
  }
}
