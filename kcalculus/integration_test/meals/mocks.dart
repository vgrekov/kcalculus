import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/ad/ad.dart';
import 'package:kcalculus/data/auth/auth.dart';
import 'package:kcalculus/data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/auth/models/user.dart';
import 'package:kcalculus/domain/edible/use_cases/edible_search_use_case.dart';
import 'package:kcalculus/domain/maintenance/models/maintenance_state.dart';
import 'package:kcalculus/domain/maintenance/use_cases/maintenance_use_case.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
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

class MockEdibleSearchUseCase extends Notifier<void>
    with Mock
    implements EdibleSearchUseCase {}

class MockFoodRepository extends ChangeSignalNotifier
    with Mock
    implements FoodRepository {}

class MockDefaultNutrientRepository extends AsyncNotifier<List<Nutrient>>
    with Mock
    implements DefaultNutrientRepository {}

class MockNutrientGoalRepository extends Notifier<ChangeSignal?>
    with Mock
    implements NutrientGoalRepository {}

class MockMaintenanceUseCase extends MaintenanceUseCase {
  @override
  MaintenanceState build() => MaintenanceComplete();
}

class MockUserRepository extends AsyncNotifier<User?>
    with Mock
    implements UserRepository {}
