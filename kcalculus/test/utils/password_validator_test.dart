import 'package:kcalculus/utils/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'PasswordValidator()',
    () {
      test(
        'minLength < 0',
        () {
          expect(() {
            PasswordValidator(
              minLength: -1,
              maxLength: 1,
              uppercaseLetters: true,
              lowercaseLetters: true,
              digits: true,
              specialCharacters: true,
            );
          }, throwsArgumentError);
        },
      );

      test(
        'minLength == 0',
        () {
          expect(() {
            PasswordValidator(
              minLength: 0,
              maxLength: 1,
              uppercaseLetters: true,
              lowercaseLetters: true,
              digits: true,
              specialCharacters: true,
            );
          }, throwsArgumentError);
        },
      );

      test(
        'minLength > maxLength',
        () {
          expect(() {
            PasswordValidator(
              minLength: 8,
              maxLength: 6,
              uppercaseLetters: true,
              lowercaseLetters: true,
              digits: true,
              specialCharacters: true,
            );
          }, throwsArgumentError);
        },
      );

      test(
        'no flags',
        () {
          expect(() {
            PasswordValidator(
              minLength: 8,
              maxLength: 14,
              uppercaseLetters: false,
              lowercaseLetters: false,
              digits: false,
              specialCharacters: false,
            );
          }, throwsArgumentError);
        },
      );
    },
  );

  group(
    'PasswordValidator.isValidPassword()',
    () {
      test(
        'minLength constraint',
        () {
          final validator = PasswordValidator(
            minLength: 8,
            maxLength: 14,
            uppercaseLetters: true,
            lowercaseLetters: true,
            digits: true,
            specialCharacters: false,
          );

          expect(
            validator.isValidPassword(
              'aA1',
            ),
            false,
            reason: 'length < minLength',
          );

          expect(
            validator.isValidPassword(
              'a1B2c3D4',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'a1B2c3D4e5F6',
            ),
            true,
          );
        },
      );

      test(
        'maxLength constraint',
        () {
          final validator = PasswordValidator(
            minLength: 8,
            maxLength: 14,
            uppercaseLetters: true,
            lowercaseLetters: true,
            digits: true,
            specialCharacters: false,
          );

          expect(
            validator.isValidPassword(
              'a1B2c3D4e5F6g7H8',
            ),
            false,
            reason: 'length > maxLength',
          );

          expect(
            validator.isValidPassword(
              'a1B2c3D4e5F6g7',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'a1B2c3D4e5F6',
            ),
            true,
          );
        },
      );

      test(
        'upper constraint',
        () {
          final validator = PasswordValidator(
            minLength: 8,
            maxLength: 14,
            uppercaseLetters: true,
            lowercaseLetters: false,
            digits: false,
            specialCharacters: false,
          );

          expect(
            validator.isValidPassword(
              'aaaaaaaa',
            ),
            false,
          );

          expect(
            validator.isValidPassword(
              'aaaaaaaA',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'Aaaaaaaa',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'aaaAaaaa',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'AAAAAAAA',
            ),
            true,
          );
        },
      );

      test(
        'lower constraint',
        () {
          final validator = PasswordValidator(
            minLength: 8,
            maxLength: 14,
            uppercaseLetters: false,
            lowercaseLetters: true,
            digits: false,
            specialCharacters: false,
          );

          expect(
            validator.isValidPassword(
              'AAAAAAAA',
            ),
            false,
          );

          expect(
            validator.isValidPassword(
              'AAAAAAAa',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'aAAAAAAA',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'AAAaAAAA',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'aaaaaaaa',
            ),
            true,
          );
        },
      );

      test(
        'digits constraint',
        () {
          final validator = PasswordValidator(
            minLength: 8,
            maxLength: 14,
            uppercaseLetters: false,
            lowercaseLetters: false,
            digits: true,
            specialCharacters: false,
          );

          expect(
            validator.isValidPassword(
              'AAAAAAAA',
            ),
            false,
          );

          expect(
            validator.isValidPassword(
              'AAAAAAA0',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              '1AAAAAAA',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'AAA2AAAA',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              '0123456789',
            ),
            true,
          );
        },
      );

      test(
        'special chars constraint',
        () {
          final validator = PasswordValidator(
            minLength: 8,
            maxLength: 14,
            uppercaseLetters: true,
            lowercaseLetters: true,
            digits: true,
            specialCharacters: true,
          );

          expect(
            validator.isValidPassword(
              'A74WxJpgK2j6Kv',
            ),
            false,
          );

          expect(
            validator.isValidPassword(
              'Boa5i#q3%RgKXz',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'V6fXPob@wcY4Uw',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'EnQPjpj6h^i5AM',
            ),
            true,
          );

          expect(
            validator.isValidPassword(
              'zhZuh43C6*tZaD',
            ),
            true,
          );
        },
      );
    },
  );
}
