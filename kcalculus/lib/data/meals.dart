import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/log_date.dart';
import 'package:kcalculus/models/meal.dart';

final logDateProvider = NotifierProvider<LogDateNotifier, DateTime>(
  LogDateNotifier.new,
);

class MealsNotifier extends Notifier<Future<List<Meal>>> {
  @override
  Future<List<Meal>> build() async {
    final mealDao = await ref.watch(mealDaoProvider);
    final date = ref.watch(logDateProvider);
    return mealDao.getByDate(date);
  }

  Future<void> addMeal(Meal meal) async {
    final mealDao = await ref.read(mealDaoProvider);
    await mealDao.add(meal);
    refresh();
  }

  Future<void> updateMeal(Meal meal) async {
    final mealDao = await ref.read(mealDaoProvider);
    await mealDao.update(meal);
    refresh();
  }

  Future<bool> deleteMeal(Meal meal) async {
    final mealDao = await ref.read(mealDaoProvider);
    final result = await mealDao.delete(meal.id!);
    refresh();
    return result;
  }

  Future<bool> restoreMeal(String mealId) async {
    final mealDao = await ref.read(mealDaoProvider);
    final result = await mealDao.restore(mealId);
    refresh();
    return result;
  }

  void refresh() {
    ref.read(logDateProvider.notifier).selectDate(DateTime.now());
  }
}

final mealsProvider = NotifierProvider<MealsNotifier, Future<List<Meal>>>(
  MealsNotifier.new,
);
