import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/meal_dao.dart';
import 'package:kcalculus/data/log_date.dart';
import 'package:kcalculus/models/meal.dart';

class DailyLogNotifier extends Notifier<Future<List<Meal>>> {
  @override
  Future<List<Meal>> build() async {
    final mealDao = await ref.watch(localMealDaoProvider);
    final date = ref.watch(logDateProvider);
    return mealDao.getByDate(date);
  }

  Future<void> addMeal(Meal meal) async {
    final mealDao = await ref.read(localMealDaoProvider);
    await mealDao.add(meal);
    ref.read(logDateProvider.notifier).selectDate(DateTime.now());
  }

  Future<bool> deleteMeal(Meal meal) async {
    final mealDao = await ref.read(localMealDaoProvider);
    final result = await mealDao.delete(meal.id!);
    ref.read(logDateProvider.notifier).selectDate(DateTime.now());
    return result;
  }
}

final dailyLogProvider = NotifierProvider<DailyLogNotifier, Future<List<Meal>>>(
  DailyLogNotifier.new,
);
