// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kcalculus/data/access/repositories/subscription_repository.dart';
import 'package:kcalculus/data/auth/auth.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';
import 'package:kcalculus/domain/import/use_cases/import_use_case.dart';
import 'package:kcalculus/domain/maintenance/use_cases/maintenance_use_case.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
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
      late MockMealRepository mealRepository;
      late MockDefaultNutrientRepository defaultNutrientRepository;
      late MockNutrientGoalRepository nutrientGoalRepository;
      late MockUserRepository userRepository;
      late MockImportUseCase importUseCase;
      late MockSubscriptionRepository subscriptionRepository;

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
              scannerDisclaimerEnabled: false,
            );
          },
        );

        mealRepository = MockMealRepository();

        when(() => mealRepository.getByDate(any())).thenAnswer(
          (_) async {
            return [
              existingMeal,
            ];
          },
        );

        defaultNutrientRepository = MockDefaultNutrientRepository();

        when(() => defaultNutrientRepository.build()).thenAnswer(
          (_) async => [
            Nutrient.energy,
            Nutrient.fat,
            Nutrient.totalCarbs,
            Nutrient.fiber,
            Nutrient.protein,
          ],
        );

        nutrientGoalRepository = MockNutrientGoalRepository();

        when(() => nutrientGoalRepository.getActiveGoals(any())).thenAnswer(
          (_) async => [],
        );

        userRepository = MockUserRepository();

        when(() => userRepository.build()).thenAnswer(
          (_) async => null,
        );

        when(() => userRepository.isAnonymousModeSelected()).thenAnswer(
          (_) async => true,
        );

        importUseCase = MockImportUseCase();

        when(() => importUseCase.build()).thenAnswer(
          (_) async => const ImportProcess.unavailable(),
        );

        subscriptionRepository = MockSubscriptionRepository();

        when(() => subscriptionRepository.build()).thenAnswer(
          (_) async => const SubscriptionActive(
            appUserId: '',
            isTrial: false,
          ),
        );

        commonOverrides = [
          appSettingsRepositoryProvider.overrideWith(
            () => appSettingsRepository,
          ),
          maintenanceUseCaseProvider.overrideWith(
            MockMaintenanceUseCase.new,
          ),
          mealRepositoryProvider.overrideWith(
            () => mealRepository,
          ),
          defaultNutrientRepositoryProvider.overrideWith(
            () => defaultNutrientRepository,
          ),
          nutrientGoalRepositoryProvider.overrideWith(
            () => nutrientGoalRepository,
          ),
          userRepositoryProvider.overrideWith(
            () => userRepository,
          ),
          importUseCaseProvider.overrideWith(
            () => importUseCase,
          ),
          subscriptionRepositoryProvider.overrideWith(
            () => subscriptionRepository,
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
