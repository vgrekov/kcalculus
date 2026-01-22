// ignore_for_file: invalid_use_of_visible_for_overriding_member
part of 'audit_fields_flow_test.dart';

void mealTests() {
  group(
    'Meal',
    () {
      late MockDatabase db;
      late MockDatabaseService dbService;
      late MockLocalNutritionFactsDao localNfDao;
      late MockAuthService authService;
      late MockFirebaseFirestore firestore;
      late MockFirestoreMealService firestoreMealService;
      late MockFirestoreEdibleService firestoreEdibleService;
      late ProviderContainer container;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
        registerFallbackValue(_kDbConfigFallback);
        registerFallbackValue(_kEdibleFirestoreModelFallback);
        registerFallbackValue(_kMealFirestoreModelFallback);
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

        firestoreMealService = MockFirestoreMealService();

        firestoreEdibleService = MockFirestoreEdibleService();

        container = ProviderContainer(
          overrides: [
            databaseServiceProvider.overrideWith(() => dbService),
            localNutritionFactsDaoProvider.overrideWith(() => localNfDao),
            authServiceProvider.overrideWith(() => authService),
            firestoreProvider.overrideWith((ref) => firestore),
            firestoreMealServiceProvider.overrideWith(
              () => firestoreMealService,
            ),
            firestoreEdibleServiceProvider.overrideWith(
              () => firestoreEdibleService,
            ),
          ],
        );
      });

      test(
        'Local -> Firestore',
        () async {
          final foodCreatedAt = DateTime(2026, 1, 14, 11, 0);
          final foodUpdatedAt = DateTime(2026, 1, 14, 11, 5);
          final foodDeletedAt = DateTime(2026, 1, 14, 12, 0);

          final mealCreatedAt = DateTime(2026, 1, 14, 11, 3);
          final mealUpdatedAt = DateTime(2026, 1, 14, 11, 20);
          final mealEatenAt = DateTime(2026, 1, 14, 11, 15);
          final mealDeletedAt = DateTime(2026, 1, 14, 11, 16);

          _stubQuery(db, 'meals', [
            {
              'id': 'test-meal',
              'edible_id': 'test-food',
              'amount_unit': 'gram',
              'amount_value': 100,
              'eaten_at': dt.formatISO8601(mealEatenAt),
              'created_at': dt.formatISO8601(mealCreatedAt),
              'updated_at': dt.formatISO8601(mealUpdatedAt),
              'deleted_at': dt.formatISO8601(mealDeletedAt),
              'edible_food_id': 'test-food',
              'edible_dish_id': null,
            },
          ]);

          _stubQuery(db, 'foods', [
            {
              'id': 'test-food',
              'name': 'Test',
              'description': 'Food',
              'created_at': dt.formatISO8601(foodCreatedAt),
              'updated_at': dt.formatISO8601(foodUpdatedAt),
              'deleted_at': dt.formatISO8601(foodDeletedAt),
              'last_eaten_at': null,
            },
          ]);

          when(
            () => firestoreEdibleService.save(
              any(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => 'test-food',
          );

          when(
            () => firestoreEdibleService.markEaten(
              any(),
              at: captureAny(named: 'at'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => true,
          );

          when(
            () => firestoreEdibleService.get(
              any(),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => _kEdibleFirestoreModelFallback,
          );

          when(
            () => firestoreMealService.save(
              any(),
              userId: any(named: 'userId'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => 'test-meal',
          );

          when(
            () => firestoreMealService.get(
              any(),
              userId: any(named: 'userId'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => _kMealFirestoreModelFallback,
          );

          final localMealRepo = container.read(
            localMealRepositoryProvider.notifier,
          );

          final meals = await localMealRepo.getAll();

          expect(meals.length, 1);

          var meal = meals[0];

          // remove food ID
          meal = meal.copyWith(
            edible: (meal.edible as Food).copyWith(id: null),
          );

          final firestoreMealRepo = container.read(
            firestoreMealRepositoryProvider.notifier,
          );

          await firestoreMealRepo.save(meal);

          final verifiedFood = verify(
            () => firestoreEdibleService.save(
              captureAny(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          );

          final verifiedEatenMark = verify(
            () => firestoreEdibleService.markEaten(
              any(),
              at: captureAny(named: 'at'),
              txn: any(named: 'txn'),
            ),
          );

          final verifiedMeal = verify(
            () => firestoreMealService.save(
              captureAny(),
              userId: any(named: 'userId'),
              txn: any(named: 'txn'),
            ),
          );

          verifiedFood.called(1);

          final edibleFirestoreModel = verifiedFood.captured
              .cast<EdibleFirestoreModel>()
              .single;

          expect(edibleFirestoreModel.createdAt, foodCreatedAt);
          expect(edibleFirestoreModel.updatedAt, foodUpdatedAt);
          expect(edibleFirestoreModel.deletedAt, foodDeletedAt);
          expect(edibleFirestoreModel.eatenAt, null);

          verifiedEatenMark.called(1);

          final eatenAt = verifiedEatenMark.captured.cast<DateTime>().single;

          expect(eatenAt, mealEatenAt);

          verifiedMeal.called(1);

          final mealFirestoreModel = verifiedMeal.captured
              .cast<MealFirestoreModel>()
              .single;

          expect(mealFirestoreModel.createdAt, mealCreatedAt);
          expect(mealFirestoreModel.updatedAt, mealUpdatedAt);
          expect(mealFirestoreModel.deletedAt, mealDeletedAt);
          expect(mealFirestoreModel.eatenAt, mealEatenAt);
        },
      );
    },
  );
}
