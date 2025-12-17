import 'package:flutter_test/flutter_test.dart';

import 'test_model.dart';

void main() {
  group(
    'Action.create',
    () {
      test(
        'Audit fields not provided',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
          );

          final json = model.toJsonFlavour(Action.create);

          expect(json['created_at'], kServerTimestamp);
          expect(json['updatedAt'], kServerTimestamp);

          expect(json.containsKey('deletedAt'), true);
          expect(json['deletedAt'], null);

          expect(json['deleted'], false);
        },
      );

      test(
        'Audit fields provided, but overridden',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: DateTime.now(),
            deleted: true,
          );

          final json = model.toJsonFlavour(Action.create);

          expect(json['created_at'], kServerTimestamp);
          expect(json['updatedAt'], kServerTimestamp);

          expect(json.containsKey('deletedAt'), true);
          expect(json['deletedAt'], null);

          expect(json['deleted'], false);
        },
      );
    },
  );

  group(
    'Action.update',
    () {
      test(
        'Audit fields not provided',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
          );

          final json = model.toJsonFlavour(Action.update);

          expect(json.containsKey('created_at'), false);

          expect(json['updatedAt'], kServerTimestamp);

          expect(json.containsKey('deletedAt'), false);
          expect(json.containsKey('deleted'), false);
        },
      );

      test(
        'Audit fields provided, but overridden',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: DateTime.now(),
            deleted: true,
          );

          final json = model.toJsonFlavour(Action.update);

          expect(json.containsKey('created_at'), false);

          expect(json['updatedAt'], kServerTimestamp);

          expect(json.containsKey('deletedAt'), false);
          expect(json.containsKey('deleted'), false);
        },
      );
    },
  );

  group(
    'Action.delete',
    () {
      test(
        'Audit fields not provided',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
          );

          final json = model.toJsonFlavour(Action.delete);

          expect(json.containsKey('created_at'), false);
          expect(json.containsKey('updatedAt'), false);

          expect(json['deletedAt'], kServerTimestamp);
          expect(json['deleted'], true);
        },
      );

      test(
        'Audit fields provided, but overridden',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: DateTime.now(),
            deleted: true,
          );

          final json = model.toJsonFlavour(Action.delete);

          expect(json.containsKey('created_at'), false);
          expect(json.containsKey('updatedAt'), false);

          expect(json['deletedAt'], kServerTimestamp);
          expect(json['deleted'], true);
        },
      );
    },
  );

  group(
    'Exclusivity',
    () {
      test(
        'ID not provided',
        () {
          final model = TestModel(
            name: 'Model Name',
          );

          var json = model.toJsonFlavour(Action.create);

          expect(json['id'], kGeneratedId);

          json = model.toJsonFlavour(Action.update);

          expect(json.containsKey('id'), true);
          expect(json['id'], null);

          json = model.toJsonFlavour(Action.delete);

          expect(json.containsKey('id'), true);
          expect(json['id'], null);
        },
      );

      test(
        'ID provided',
        () {
          final id = 'model-id';

          final model = TestModel(
            id: id,
            name: 'Model Name',
          );

          var json = model.toJsonFlavour(Action.create);

          expect(json['id'], id);

          json = model.toJsonFlavour(Action.update);

          expect(json['id'], id);

          json = model.toJsonFlavour(Action.delete);

          expect(json['id'], id);
        },
      );
    },
  );

  group(
    'Filtering',
    () {
      test(
        'Description not provided (null)',
        () {
          final model = TestModel(
            name: 'Model Name',
          );

          var json = model.toJsonFlavour(Action.create);

          expect(json.containsKey('description'), false);
        },
      );

      test(
        'Description provided (non-null)',
        () {
          final description = 'Model Description';

          final model = TestModel(
            name: 'Model Name',
            description: description,
          );

          var json = model.toJsonFlavour(Action.create);

          expect(json.containsKey('description'), true);
          expect(json['description'], description);
        },
      );
    },
  );
}
