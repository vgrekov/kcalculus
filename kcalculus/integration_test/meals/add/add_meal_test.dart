// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kcalculus/data/ad/repositories/ad_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/domain/maintenance/use_cases/maintenance_use_case.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../mocks.dart';
import 'edible_already_exists.dart';
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
    'Add meal',
    () {
      late MockAppSettingsRepository appSettingsRepository;
      late MockAdRepository adRepository;
      late MockMealRepository mealRepository;
      late MockDefaultNutrientRepository defaultNutrientRepository;
      late MockNutrientGoalRepository nutrientGoalRepository;

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

        adRepository = MockAdRepository();

        mealRepository = MockMealRepository();

        when(() => mealRepository.getByDate(any())).thenAnswer(
          (_) async {
            return [];
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

        commonOverrides = [
          appSettingsRepositoryProvider.overrideWith(
            () => appSettingsRepository,
          ),
          adRepositoryProvider.overrideWith(
            () => adRepository,
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
        ];
      });

      testWidgets(
        'No common measure between per amounts and meal amount',
        (tester) => testNoCommonMeasure(
          tester,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Edible already exists',
        (tester) => testEdibleAlreadyExists(
          tester,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible already exists',
        (tester) => testModifiedSelectedEdibleAlreadyExists(
          tester,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible - uses selected',
        (tester) => testModifiedSelectedEdibleUsesSelected(
          tester,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible - creates new',
        (tester) => testModifiedSelectedEdibleCreatesNew(
          tester,
          overrides: commonOverrides,
        ),
      );

      testWidgets(
        'Modified selected edible - uses selected with no common measure',
        (tester) => testModifiedSelectedEdibleUsesSelectedNoCommonMeasure(
          tester,
          overrides: commonOverrides,
        ),
      );
    },
  );
}
