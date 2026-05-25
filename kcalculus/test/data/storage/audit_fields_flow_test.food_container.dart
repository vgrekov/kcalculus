// ignore_for_file: invalid_use_of_visible_for_overriding_member
part of 'audit_fields_flow_test.dart';

void foodContainerTests() {
  group(
    'Food Container',
    () {
      late ProviderContainer container;
      late MockDatabase db;
      late MockDatabaseService dbService;
      late MockAuthService authService;
      late MockFirebaseFirestore firestore;
      late MockFirestoreFoodContainerService firestoreFoodContainerService;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
        registerFallbackValue(_kDbConfigFallback);
        registerFallbackValue(_kFoodContainerFirestoreModelFallback);
      });

      setUp(() {
        db = MockDatabase();

        dbService = MockDatabaseService();
        when(() => dbService.build(any())).thenAnswer(
          (_) async => db,
        );

        authService = MockAuthService();
        when(() => authService.build()).thenAnswer((_) => _kUser);

        firestore = MockFirebaseFirestore();

        firestoreFoodContainerService = MockFirestoreFoodContainerService();

        container = ProviderContainer(
          overrides: [
            databaseServiceProvider.overrideWith(() => dbService),
            authServiceProvider.overrideWith(() => authService),
            firestoreProvider.overrideWith((ref) => firestore),
            firestoreFoodContainerServiceProvider.overrideWith(
              () => firestoreFoodContainerService,
            ),
          ],
        );
      });

      test(
        'Local -> Firestore',
        () async {
          final createdAt = DateTime(2026, 1, 23, 10, 0);
          final updatedAt = DateTime(2026, 1, 23, 10, 5);
          final deletedAt = DateTime(2026, 1, 23, 10, 10);

          _stubQuery(db, 'food_containers', [
            {
              'id': 'food-container',
              'name': 'Food',
              'description': 'Container',
              'weight_unit': 'gram',
              'weight_value': 100,
              'created_at': dt.formatISO8601(createdAt),
              'updated_at': dt.formatISO8601(updatedAt),
              'deleted_at': dt.formatISO8601(deletedAt),
            },
          ]);

          when(
            () => firestoreFoodContainerService.save(
              any(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer((_) async => 'food-container');

          final localRepo = container.read(
            localFoodContainerRepositoryProvider.notifier,
          );

          final foodContainers = await localRepo.getAll(includeDeleted: true);

          expect(foodContainers.length, 1);

          final foodContainer = foodContainers.first;

          final firestoreRepo = container.read(
            firestoreFoodContainerRepositoryProvider.notifier,
          );

          await firestoreRepo.save(foodContainer);

          final verified = verify(
            () => firestoreFoodContainerService.save(
              captureAny(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          );

          verified.called(1);

          final firestoreModel = verified.captured
              .cast<FoodContainerFirestoreModel>()
              .single;

          expect(firestoreModel.createdAt, createdAt);
          expect(firestoreModel.updatedAt, updatedAt);
          expect(firestoreModel.deletedAt, deletedAt);
        },
      );
    },
  );
}
