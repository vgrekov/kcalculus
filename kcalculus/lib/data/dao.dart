import 'package:kcalculus/models/meal.dart';

abstract interface class MealDao {
  Future<void> add(Meal model);

  Future<List<Meal>> getByDate(DateTime date);

  Future<bool> delete(String id);
}
