// ignore_for_file: invalid_use_of_visible_for_overriding_member
part of 'audit_fields_flow_test.dart';

void nutrientGoalTests() {
  group(
    'Nutrient Goal',
    () {
      late ProviderContainer container;
      late MockDatabase db;
      late MockDatabaseService dbService;
      late MockAuthService authService;
      late MockFirebaseFirestore firestore;
      late MockFirestoreNutrientGoalService firestoreNutrientGoalService;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
        registerFallbackValue(_kDbConfigFallback);
        registerFallbackValue(_kNutrientGoalFirestoreModelFallback);
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

        firestoreNutrientGoalService = MockFirestoreNutrientGoalService();

        container = ProviderContainer(
          overrides: [
            databaseServiceProvider.overrideWith(() => dbService),
            authServiceProvider.overrideWith(() => authService),
            firestoreProvider.overrideWith((ref) => firestore),
            firestoreNutrientGoalServiceProvider.overrideWith(
              () => firestoreNutrientGoalService,
            ),
          ],
        );
      });

      test(
        'Local -> Firestore',
        () async {
          final createdAt = DateTime(2026, 1, 23, 10, 0);
          final deletedAt = DateTime(2026, 1, 23, 10, 10);

          _stubQuery(db, 'nutrient_goals', [
            {
              'id': 'nutrient-goal',
              'nutrient': 'fat',
              'amount_unit': 'gram',
              'amount_value': 100,
              'created_at': dt.formatISO8601(createdAt),
              'deleted_at': dt.formatISO8601(deletedAt),
            },
          ]);

          when(
            () => firestoreNutrientGoalService.save(
              any(),
              any(),
              txn: any(named: 'txn'),
            ),
          ).thenAnswer((_) async => 'nutrient-goal');

          final localRepo = container.read(
            localNutrientGoalRepositoryProvider.notifier,
          );

          final nutrientGoals = await localRepo.getAll(includeDeleted: true);

          expect(nutrientGoals.length, 1);

          final nutrientGoal = nutrientGoals.first;

          final firestoreRepo = container.read(
            firestoreNutrientGoalRepositoryProvider.notifier,
          );

          await firestoreRepo.save(nutrientGoal);

          final verified = verify(
            () => firestoreNutrientGoalService.save(
              captureAny(),
              any(),
              txn: any(named: 'txn'),
            ),
          );

          verified.called(1);

          final firestoreModel = verified.captured
              .cast<NutrientGoalFirestoreModel>()
              .single;

          expect(firestoreModel.createdAt, createdAt);
          expect(firestoreModel.deletedAt, deletedAt);
        },
      );
    },
  );
}
