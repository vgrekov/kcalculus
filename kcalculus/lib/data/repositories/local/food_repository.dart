import 'package:kcalculus/data/repositories/food_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/edible_dao.dart';
import 'package:kcalculus/data/repositories/local/dao/food_dao.dart';
import 'package:kcalculus/domain/models/food.dart';

class LocalFoodRepository implements FoodRepository {
  LocalFoodRepository({
    required LocalFoodDao foodDao,
    required LocalEdibleDao edibleDao,
  })  : _foodDao = foodDao,
        _edibleDao = edibleDao;

  final LocalFoodDao _foodDao;

  final LocalEdibleDao _edibleDao;

  @override
  Future<Food?> getById(String id) {
    return _foodDao.getById(id);
  }

  @override
  Future<Food> save(Food food) async {
    final id = await _foodDao.save(food);
    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) {
    return _edibleDao.delete(id);
  }

  @override
  Future<bool> restore(String id) {
    return _edibleDao.restore(id);
  }
}
