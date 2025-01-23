import 'package:kcalculus/data/repositories/local/dao/meal_dao.dart';
import 'package:kcalculus/data/repositories/meal_repository.dart';
import 'package:kcalculus/domain/models/meal.dart';

class LocalMealRepository implements MealRepository {
  LocalMealRepository({
    required LocalMealDao mealDao,
  }) : _mealDao = mealDao;

  final LocalMealDao _mealDao;

  @override
  Future<List<Meal>> getByDate(DateTime date) {
    return _mealDao.getByDate(date);
  }

  @override
  Future<Meal> save(Meal meal) {
    return _mealDao.save(meal);
  }

  @override
  Future<bool> delete(String id) {
    return _mealDao.delete(id);
  }

  @override
  Future<bool> restore(String id) {
    return _mealDao.restore(id);
  }
}
