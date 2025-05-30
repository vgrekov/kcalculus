// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../mocks.dart';
import 'modified_selected_edible_already_exists.dart';
import 'modified_selected_edible_creates_new.dart';
import 'modified_selected_edible_uses_selected.dart';
import 'modified_selected_edible_uses_selected_no_common_measure.dart';
import 'no_common_measure.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await setUpApp();
  });

  group(
    'Edit meal',
    () {
      late MockAppSettingsRepository appSettingsRepository;
      late MockAdRepository adRepository;
      late MockMealRepository mealRepository;

      final existingMeal = Meal(
        id: 'meal_id',
        edible: Food(
          id: 'food_id',
          name: 'Test Food',
          description: '',
          nutritionFacts: [
            NutritionFacts(
              amount: Amount(
                unit: Unit.gram,
                value: 100,
              ),
              nutrientData: NutrientData.legacy(
                calories: 100,
                fatInGrams: 4,
                carbsInGrams: 10,
                fiberInGrams: 1,
                proteinInGrams: 9,
              ),
            ),
          ],
        ),
        amount: Amount(
          unit: Unit.gram,
          value: 100,
        ),
        eatenAt: DateTime.now(),
      );

      late List<Override> commonOverrides;

      setUp(() {
        appSettingsRepository = MockAppSettingsRepository();

        when(() => appSettingsRepository.build()).thenAnswer(
          (_) async {
            return AppSettings(
              theme: AppTheme.system,
              analyticsEnabled: false,
              crashlyticsEnabled: false,
              signedAgreementVersion: kAgreementVersion,
            );
          },
        );

        adRepository = MockAdRepository();

        mealRepository = MockMealRepository();

        when(() => mealRepository.getByDate(any())).thenAnswer(
          (_) async {
            return [
              existingMeal,
            ];
          },
        );

        commonOverrides = [
          appSettingsRepositoryProvider.overrideWith(
            () => appSettingsRepository,
          ),
          adRepositoryProvider.overrideWith(
            (ref) => adRepository,
          ),
          maintenanceStatusRepository.overrideWith(
            (ref) => MaintenanceStatus.complete,
          ),
          maintenanceTaskRepository.overrideWith(
            (ref) => [],
          ),
          mealRepositoryProvider.overrideWith(
            (ref) => mealRepository,
          ),
        ];
      });

      testWidgets(
        'No common measure between per amounts and meal amount',
        (tester) => testNoCommonMeasure(
          tester,
          existingMeal,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible already exists',
        (tester) => testModifiedSelectedEdibleAlreadyExists(
          tester,
          existingMeal,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible - uses selected',
        (tester) => testModifiedSelectedEdibleUsesSelected(
          tester,
          existingMeal,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible - creates new',
        (tester) => testModifiedSelectedEdibleCreatesNew(
          tester,
          existingMeal,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible - uses selected with no common measure',
        (tester) => testModifiedSelectedEdibleUsesSelectedNoCommonMeasure(
          tester,
          existingMeal,
          overrides: commonOverrides,
        ),
      );
    },
  );
}
