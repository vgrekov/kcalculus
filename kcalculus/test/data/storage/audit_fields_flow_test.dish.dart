// ignore_for_file: invalid_use_of_visible_for_overriding_member
part of 'audit_fields_flow_test.dart';

final _kDishFallback = Dish(
  name: '',
  description: '',
  ingredients: [],
  nutritionRatios: {},
);

void dishTests() {
  group(
    'Dish',
    () {
      late MockDatabase db;
      late MockDatabaseService dbService;
      late MockLocalNutritionFactsDao localNfDao;
      late MockAuthService authService;
      late MockFirebaseFirestore firestore;
      late MockFirestoreEdibleDao firestoreEdibleDao;
      late MockFirestoreEdibleService firestoreEdibleService;
      late ProviderContainer container;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
        registerFallbackValue(_kDbConfigFallback);
        registerFallbackValue(_kEdibleFirestoreModelFallback);
        registerFallbackValue(_kUser);
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

        firestoreEdibleDao = MockFirestoreEdibleDao();

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

        container = ProviderContainer(
          overrides: [
            databaseServiceProvider.overrideWith(() => dbService),
            localNutritionFactsDaoProvider.overrideWith(() => localNfDao),
            authServiceProvider.overrideWith(() => authService),
            firestoreProvider.overrideWith((ref) => firestore),
            firestoreEdibleDaoProvider.overrideWith(
              () => firestoreEdibleDao,
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
          final foodLastEatenAt = DateTime(2026, 1, 14, 11, 15);

          final dishCreatedAt = DateTime(2026, 1, 14, 11, 0, 1);
          final dishUpdatedAt = DateTime(2026, 1, 14, 11, 5, 1);
          final dishDeletedAt = DateTime(2026, 1, 14, 12, 0, 1);
          final dishLastEatenAt = DateTime(2026, 1, 14, 11, 15, 1);

          when(
            () => db.rawQuery(
              any(
                that: matches(
                  RegExp(
                    r'FROM\s+dishes',
                    caseSensitive: false,
                  ),
                ),
              ),
              any(),
            ),
          ).thenAnswer(
            (_) async => [
              {
                'id': 'test-dish',
                'name': 'Test',
                'description': 'Dish',
                'mass_per_amount_value': 100,
                'mass_per_amount_unit': 'gram',
                'mass_total_amount_value': 100,
                'mass_total_amount_unit': 'gram',
                'volume_per_amount_value': null,
                'volume_per_amount_unit': null,
                'volume_total_amount_value': null,
                'volume_total_amount_unit': null,
                'quantity_per_amount_value': null,
                'quantity_per_amount_unit': null,
                'quantity_total_amount_value': null,
                'quantity_total_amount_unit': null,
                'created_at': dt.formatISO8601(dishCreatedAt),
                'updated_at': dt.formatISO8601(dishUpdatedAt),
                'deleted_at': dt.formatISO8601(dishDeletedAt),
                'last_eaten_at': dt.formatISO8601(dishLastEatenAt),
              },
            ],
          );

          when(
            () => db.rawQuery(
              any(
                that: matches(
                  RegExp(
                    r'FROM\s+ingredients',
                    caseSensitive: false,
                  ),
                ),
              ),
              any(),
            ),
          ).thenAnswer(
            (_) async => [
              {
                'dish_id': 'test-dish',
                'edible_id': 'test-food',
                'amount_value': 100,
                'amount_unit': 'gram',
                'edible_food_id': 'test-food',
                'edible_dish_id': null,
              },
            ],
          );

          when(
            () => db.rawQuery(
              any(
                that: matches(
                  RegExp(
                    r'FROM\s+foods',
                    caseSensitive: false,
                  ),
                ),
              ),
              any(),
            ),
          ).thenAnswer(
            (_) async => [
              {
                'id': 'test-food',
                'name': 'Test',
                'description': 'Food',
                'created_at': dt.formatISO8601(foodCreatedAt),
                'updated_at': dt.formatISO8601(foodUpdatedAt),
                'deleted_at': dt.formatISO8601(foodDeletedAt),
                'last_eaten_at': dt.formatISO8601(foodLastEatenAt),
              },
            ],
          );

          when(
            () => firestoreEdibleDao.getById(
              any(),
              user: any(named: 'user'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => _kDishFallback,
          );

          when(
            () => firestoreEdibleService.get(
              any(),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => null,
          );

          when(
            () => firestoreEdibleService.save(
              any(),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer(
            (_) async => 'test',
          );

          final localDishRepo = container.read(
            localDishRepositoryProvider.notifier,
          );

          var dish = await localDishRepo.getById('');

          expect(dish, isNotNull);

          // remove ingredient IDs
          dish = dish!.copyWith(
            ingredients: dish.ingredients
                .map(
                  (i) => i.copyWith(
                    edible: (i.edible as Food).copyWith(id: null),
                  ),
                )
                .toList(),
          );

          final firestoreDishRepo = container.read(
            firestoreDishRepositoryProvider.notifier,
          );

          await firestoreDishRepo.save(dish);

          final verifiedFood = verify(
            () => firestoreEdibleService.save(
              captureAny(
                that: isA<EdibleFirestoreModel>().having(
                  (e) => e.type,
                  'type',
                  equals(EdibleType.food),
                ),
              ),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          );

          final verifiedDish = verify(
            () => firestoreEdibleService.save(
              captureAny(
                that: isA<EdibleFirestoreModel>().having(
                  (e) => e.type,
                  'type',
                  equals(EdibleType.dish),
                ),
              ),
              skipAudit: any(named: 'skipAudit'),
              txn: any(named: 'txn'),
            ),
          );

          verifiedFood.called(1);

          final foodFirestoreModel = verifiedFood.captured
              .cast<EdibleFirestoreModel>()
              .single;

          expect(foodFirestoreModel.createdAt, foodCreatedAt);
          expect(foodFirestoreModel.updatedAt, foodUpdatedAt);
          expect(foodFirestoreModel.deletedAt, foodDeletedAt);
          expect(foodFirestoreModel.eatenAt, foodLastEatenAt);

          verifiedDish.called(1);

          final dishFirestoreModel = verifiedDish.captured
              .cast<EdibleFirestoreModel>()
              .single;

          expect(dishFirestoreModel.createdAt, dishCreatedAt);
          expect(dishFirestoreModel.updatedAt, dishUpdatedAt);
          expect(dishFirestoreModel.deletedAt, dishDeletedAt);
          expect(dishFirestoreModel.eatenAt, dishLastEatenAt);
        },
      );
    },
  );
}
