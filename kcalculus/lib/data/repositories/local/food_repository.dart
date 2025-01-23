import 'package:kcalculus/data/repositories/food_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/food_dao.dart';
import 'package:kcalculus/domain/models/food.dart';

class LocalFoodRepository implements FoodRepository {
  LocalFoodRepository({
    required LocalFoodDao foodDao,
  }) : _foodDao = foodDao;

  final LocalFoodDao _foodDao;

  @override
  Future<Food?> getById(String id) {
    return _foodDao.getById(id);
  }

  @override
  Future<Food> save(Food food) async {
    final id = await _foodDao.save(food);
    return (await getById(id))!;
  }
}
