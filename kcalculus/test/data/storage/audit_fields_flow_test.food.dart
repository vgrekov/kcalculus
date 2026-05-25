// ignore_for_file: invalid_use_of_visible_for_overriding_member
part of 'audit_fields_flow_test.dart';

void foodTests() {
  group(
    'Food',
    () {
      late MockDatabase db;
      late MockDatabaseService dbService;
      late MockLocalNutritionFactsDao localNfDao;
      late MockAuthService authService;
      late MockFirebaseFirestore firestore;
      late MockFirestoreEdibleService firestoreEdibleService;
      late ProviderContainer container;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
        registerFallbackValue(_kDbConfigFallback);
        registerFallbackValue(_kEdibleFirestoreModelFallback);
      });

      setUp(() {
        db = MockDatabase();

        dbService = MockDatabaseService();
        when(() => dbService.build(any())).thenAnswer(
          (_) async => db,
        );

        localNfDao = MockLocalNutritionFactsDao();
        when(
          () => localNfDao.getByEdible(any(), txn: any(named: 'txn')),
        ).thenAnswer(
          (_) async => [_kDefaultNf],
        );

        authService = MockAuthService();
        when(() => authService.build()).thenAnswer((_) => _kUser);

        firestore = MockFirebaseFirestore();

        firestoreEdibleService = MockFirestoreEdibleService();
        when(
          () => firestoreEdibleService.exists(
            any(),
            any(),
            userId: any(named: 'userId'),
            exceptWithId: any(named: 'exceptWithId'),
          ),
        ).thenAnswer(
          (_) async => false,
        );
        when(
          () => firestoreEdibleService.getDishesByIngredient(
            any(),
            userId: any(named: 'userId'),
          ),
        ).thenAnswer(
          (_) async => const [],
        );

        container = ProviderContainer(
          overrides: [
            databaseServiceProvider.overrideWith(() => dbService),
            localNutritionFactsDaoProvider.overrideWith(() => localNfDao),
            authServiceProvider.overrideWith(() => authService),
            firestoreProvider.overrideWith((ref) => firestore),
            firestoreEdibleServiceProvider.overrideWith(
              () => firestoreEdibleService,
            ),
          ],
        );
      });

      test(
        'Local -> Firestore',
        () async {
          final createdAt = DateTime(2026, 1, 14, 11, 0);
          final updatedAt = DateTime(2026, 1, 14, 11, 5);
          final deletedAt = DateTime(2026, 1, 14, 12, 0);
          final lastEatenAt = DateTime(2026, 1, 14, 11, 15);

          when(
            () => db.rawQuery(any(), any()),
          ).thenAnswer(
            (_) async => [
              {
                'id': 'test-food',
                'name': 'Test',
                'description': 'Food',
                'created_at': dt.formatISO8601(createdAt),
                'updated_at': dt.formatISO8601(updatedAt),
                'deleted_at': dt.formatISO8601(deletedAt),
                'last_eaten_at': dt.formatISO8601(lastEatenAt),
              },
            ],
          );

          when(
            () => firestoreEdibleService.save(
              any(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => 'test-food',
          );

          final localFoodRepo = container.read(
            localFoodRepositoryProvider.notifier,
          );

          final food = await localFoodRepo.getById('test-food');

          expect(food, isNotNull);

          final firestoreFoodRepo = container.read(
            firestoreFoodRepositoryProvider.notifier,
          );

          await firestoreFoodRepo.save(food!);

          final verified = verify(
            () => firestoreEdibleService.save(
              captureAny(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          );

          verified.called(1);

          final edibleFirestoreModel = verified.captured
              .cast<EdibleFirestoreModel>()
              .single;

          expect(edibleFirestoreModel.createdAt, createdAt);
          expect(edibleFirestoreModel.updatedAt, updatedAt);
          expect(edibleFirestoreModel.deletedAt, deletedAt);
          expect(edibleFirestoreModel.eatenAt, lastEatenAt);
        },
      );
    },
  );
}
