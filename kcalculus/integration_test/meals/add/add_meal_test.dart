// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';
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
            return [];
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
