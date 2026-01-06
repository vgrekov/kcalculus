import 'package:flutter_test/flutter_test.dart';

import 'model_l0.dart';

void main() {
  group(
    'Hierarchy',
    () {
      test(
        'L0',
        () {
          final l0Fields = ModelL0JsonFields.root();

          expect(l0Fields.id, 'id');
          expect(l0Fields.name, 'name');
          expect(l0Fields.description, 'desc');

          expect(l0Fields.child.id, 'child.id');
          expect(l0Fields.child.name, 'child.name');
          expect(l0Fields.child.description, 'child.desc');
          expect(l0Fields.child.child.id, 'child.child.id');
          expect(l0Fields.child.child.name, 'child.child.name');
          expect(l0Fields.child.child.description, 'child.child.desc');

          expect(l0Fields.grandChild.id, 'grand_child.id');
          expect(l0Fields.grandChild.name, 'grand_child.name');
          expect(l0Fields.grandChild.description, 'grand_child.desc');
        },
      );
    },
  );
}
