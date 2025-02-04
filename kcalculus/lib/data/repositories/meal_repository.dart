import 'package:kcalculus/domain/models/meal.dart';

abstract interface class MealRepository {
  Future<List<Meal>> getByDate(DateTime date);

  Future<Meal> save(Meal meal);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}
