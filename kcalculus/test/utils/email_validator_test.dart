import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/utils/email_validator.dart';

void main() {
  final validEmails = [
    'simple@example.com',
    'user.name@example.com',
    'user_name@example.com',
    'user-name@example.com',
    'user+tag@example.co.uk',
    'USER@EXAMPLE.COM',
    'mixedCase@Example.Org',
    'numbers123@domain123.com',
    'underscores_in_local@domain.com',
    'dashes-in-domain@sub-domain.example.com',
    'twoletter@domain.io',
  ];

  final invalidEmails = {
    '': 'empty',
    'plainaddress': 'no @',
    '@no-local-part.com': 'missing local part',
    'no-at-symbol.com': 'missing @',
    'user@.com': 'domain starts with dot',
    'user@domain': 'no TLD',
    'user@domain.': 'ends with dot',
    'user@domain.c': 'TLD only 1 letter',
    'user@domain.com.': 'trailing dot',
    'user@@domain.com': 'double @',
    'user name@example.com': 'space in local part',
    'user@exa mple.com': 'space in domain',
    'user@domain.c_m': 'underscore in TLD',
    ' twoletter@domain.io': 'spaces before',
    'twoletter@domain.io. ': 'spaces after',
    ' twoletter@domain.io  ': 'spaces around',
  };

  test(
    'EmailValidator.isValidEmail()',
    () {
      final validator = EmailValidator();

      for (final email in validEmails) {
        expect(
          validator.isValidEmail(email),
          true,
        );
      }

      for (final entry in invalidEmails.entries) {
        expect(
          validator.isValidEmail(entry.key),
          false,
          reason: entry.value,
        );
      }
    },
  );
}
