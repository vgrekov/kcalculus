import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';

import 'test_model.dart';

void main() {
  group(
    'StorageActionCreate',
    () {
      test(
        'Audit fields not provided',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
          );

          final json = model.toJsonFlavour(const StorageActionCreate());

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

          final json = model.toJsonFlavour(const StorageActionCreate());

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
    'StorageActionUpdate',
    () {
      test(
        'Audit fields not provided',
        () {
          final model = TestModel(
            id: 'model-id',
            name: 'Model Name',
          );

          final json = model.toJsonFlavour(const StorageActionUpdate());

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

          final json = model.toJsonFlavour(const StorageActionUpdate());

          expect(json.containsKey('created_at'), false);

          expect(json['updatedAt'], kServerTimestamp);

          expect(json.containsKey('deletedAt'), false);
          expect(json.containsKey('deleted'), false);
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

          var json = model.toJsonFlavour(const StorageActionCreate());

          expect(json['id'], kGeneratedId);

          json = model.toJsonFlavour(const StorageActionUpdate());

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

          var json = model.toJsonFlavour(const StorageActionCreate());

          expect(json['id'], id);

          json = model.toJsonFlavour(const StorageActionUpdate());

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

          var json = model.toJsonFlavour(const StorageActionCreate());

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

          var json = model.toJsonFlavour(const StorageActionCreate());

          expect(json.containsKey('description'), true);
          expect(json['description'], description);
        },
      );
    },
  );
}
