import 'package:flutter_test/flutter_test.dart';

import 'test_model.dart';

void main() {
  group(
    'Basic',
    () {
      test(
        'Naming',
        () {
          expect(TestModelJsonFields.id, 'id');
          expect(TestModelJsonFields.name, 'name');
          expect(TestModelJsonFields.description, 'desc');
        },
      );
    },
  );
}
