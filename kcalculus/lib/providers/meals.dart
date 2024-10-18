import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';

class DailyLogProviderNotifier extends StateNotifier<Future<List<Meal>>> {
  late List<Meal> _localState;

  DailyLogProviderNotifier(super._state) {
    state.then(onLoadState);
  }

  List<Meal> onLoadState(List<Meal> value) {
    _localState = [...value];
    return value;
  }

  Future<bool> deleteMeal(Meal meal) async {
    // Failure example
    // return Future.delayed(const Duration(seconds: 1), () {
    //   throw 'Deletion failed';
    // });

    // Negative example
    // return Future.delayed(const Duration(seconds: 2), () {
    //   return false;
    // });

    // Positive example
    return Future.delayed(const Duration(seconds: 2), () {
      _localState.removeWhere((m) => m.id == meal.id);
      state = Future.value(_localState);
      return true;
    });
  }
}

final dailyLogProvider =
    StateNotifierProvider<DailyLogProviderNotifier, Future<List<Meal>>>((ref) {
  return DailyLogProviderNotifier(Future.delayed(
    const Duration(seconds: 1),
    () {
      // throw 'Failed to load meals';
      // return [];
      return [
        Meal(
          edible: Food(
            name: 'Beef Sirloin Steak, lean only, broiled',
            nutritionFacts: [
              NutritionFacts(
                amount: Amount(
                  unit: Unit.gram,
                  value: 100,
                ),
                nutrientData: const NutrientData(
                  calories: 183,
                  fatInGrams: 5.8,
                  carbsInGrams: 0,
                  fiberInGrams: 0,
                  proteinInGrams: 30.6,
                ),
              ),
            ],
          ),
          amount: Amount(
            unit: Unit.gram,
            value: 600,
          ),
          eatenAt: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        Meal(
          edible: Food(
            name: 'Fuji Apple',
            nutritionFacts: [
              NutritionFacts(
                amount: Amount(
                  unit: Unit.gram,
                  value: 100,
                ),
                nutrientData: const NutrientData(
                  calories: 63,
                  fatInGrams: 0.2,
                  carbsInGrams: 15.2,
                  fiberInGrams: 2.1,
                  proteinInGrams: 0.2,
                ),
              ),
            ],
          ),
          amount: Amount(
            unit: Unit.gram,
            value: 250,
          ),
          eatenAt: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        Meal(
          edible: Food(
            name: 'Bananas',
            nutritionFacts: [
              NutritionFacts(
                amount: Amount(
                  unit: Unit.gram,
                  value: 100,
                ),
                nutrientData: const NutrientData(
                  calories: 89,
                  fatInGrams: 0.3,
                  carbsInGrams: 22.8,
                  fiberInGrams: 2.6,
                  proteinInGrams: 1.1,
                ),
              ),
            ],
          ),
          amount: Amount(
            unit: Unit.gram,
            value: 120,
          ),
          eatenAt: DateTime.now(),
        ),
      ];
    },
  ));
});
