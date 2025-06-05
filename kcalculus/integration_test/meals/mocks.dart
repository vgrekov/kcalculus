import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/ad_repository.dart';
import 'package:kcalculus/data/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/repositories/edible_repository.dart';
import 'package:kcalculus/data/repositories/food_repository.dart';
import 'package:kcalculus/data/repositories/meal_repository.dart';
import 'package:kcalculus/data/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/data/repositories/nutrient_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:mocktail/mocktail.dart';

class MockAppSettingsRepository extends AsyncNotifier<AppSettings>
    with Mock
    implements AppSettingsRepository {}

class MockAdRepository with Mock implements AdRepository {}

class MockMealRepository with Mock implements MealRepository {}

class MockEdibleRepository with Mock implements EdibleRepository {}

class MockFoodRepository with Mock implements FoodRepository {}

class MockNutrientRepository with Mock implements NutrientRepository {}

class MockNutrientGoalRepository with Mock implements NutrientGoalRepository {}
