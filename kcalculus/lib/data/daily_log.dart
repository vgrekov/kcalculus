import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/meal_dao.dart';
import 'package:kcalculus/models/meal.dart';

class DailyLogNotifier extends Notifier<Future<List<Meal>>> {
  @override
  Future<List<Meal>> build() async {
    final mealDao = await ref.watch(localMealDaoProvider);
    return mealDao.getByDate(DateTime.now());
  }

  Future<void> addMeal(Meal meal) async {
    final mealDao = await ref.read(localMealDaoProvider);
    await mealDao.add(meal);
    state = mealDao.getByDate(DateTime.now());
  }

  Future<bool> deleteMeal(Meal meal) async {
    final mealDao = await ref.read(localMealDaoProvider);
    final result = await mealDao.delete(meal.id!);
    state = mealDao.getByDate(DateTime.now());
    return result;
  }
}

final dailyLogProvider = NotifierProvider<DailyLogNotifier, Future<List<Meal>>>(
  DailyLogNotifier.new,
);
