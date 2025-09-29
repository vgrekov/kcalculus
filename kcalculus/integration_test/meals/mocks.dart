import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/ad/repositories/ad_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/_common/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/domain/use_cases/edible_search_use_case.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_state.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_use_case.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';
import 'package:mocktail/mocktail.dart';

class MockAppSettingsRepository extends AsyncNotifier<AppSettings>
    with Mock
    implements AppSettingsRepository {}

class MockAdRepository extends Notifier<void>
    with Mock
    implements AdRepository {}

class MockMealRepository extends ChangeSignalNotifier
    with Mock
    implements MealRepository {}

class MockEdibleRepository extends Notifier<void>
    with Mock
    implements EdibleRepository {}

class MockEdibleSearchUseCase with Mock implements EdibleSearchUseCase {}

class MockFoodRepository extends ChangeSignalNotifier
    with Mock
    implements FoodRepository {}

class MockDefaultNutrientRepository
    with Mock
    implements DefaultNutrientRepository {}

class MockNutrientGoalRepository extends Notifier<ChangeSignal?>
    with Mock
    implements NutrientGoalRepository {}

class MockMaintenanceUseCase extends MaintenanceUseCase {
  @override
  MaintenanceState build() => MaintenanceComplete();
}
