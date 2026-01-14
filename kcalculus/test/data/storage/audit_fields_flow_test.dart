// ignore_for_file: invalid_use_of_visible_for_overriding_member
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/_common/database/models/database_config.dart';
import 'package:kcalculus/data/_common/database/services/database_service.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/local/edible/dao/nutrition_facts_dao.dart';
import 'package:kcalculus/data/storage/local/food/repositories/food_repository.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group(
    'Food',
    () {
      late MockDatabase db;
      late MockDatabaseService dbService;
      late MockLocalNutritionFactsDao localNfDao;
      late MockAuthService authService;
      late MockFirestoreEdibleService firestoreEdibleService;
      late ProviderContainer container;

      final defaultNf = NutritionFacts(
        amount: Amount(unit: Unit.gram, value: 100),
        nutrientData: NutrientData(
          nutrientAmounts: [
            NutrientAmount(
              nutrient: Nutrient.energy,
              amount: Amount(
                unit: Unit.calorie,
                value: 100,
              ),
            ),
            NutrientAmount(
              nutrient: Nutrient.fat,
              amount: Amount(
                unit: Unit.gram,
                value: 4,
              ),
            ),
            NutrientAmount(
              nutrient: Nutrient.totalCarbs,
              amount: Amount(
                unit: Unit.gram,
                value: 10,
              ),
            ),
            NutrientAmount(
              nutrient: Nutrient.fiber,
              amount: Amount(
                unit: Unit.gram,
                value: 1,
              ),
            ),
            NutrientAmount(
              nutrient: Nutrient.protein,
              amount: Amount(
                unit: Unit.gram,
                value: 9,
              ),
            ),
          ],
        ),
      );

      final user = MockUser(uid: 'user-id');

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();

        registerFallbackValue(
          DatabaseConfig(
            name: '',
            version: 0,
            migrationsDir: '',
          ),
        );

        registerFallbackValue(
          EdibleFirestoreModel(
            type: EdibleType.food,
            name: '',
            description: '',
            ownerId: '',
          ),
        );
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
          (_) async => [defaultNf],
        );

        authService = MockAuthService();
        when(() => authService.build()).thenAnswer((_) => user);

        firestoreEdibleService = MockFirestoreEdibleService();

        container = ProviderContainer(
          overrides: [
            databaseServiceProvider.overrideWith(() => dbService),
            localNutritionFactsDaoProvider.overrideWith(() => localNfDao),
            authServiceProvider.overrideWith(() => authService),
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
            (_) async => 'test_food',
          );

          final localFoodRepo = container.read(
            localFoodRepositoryProvider.notifier,
          );

          final food = await localFoodRepo.getById('test_food');

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
