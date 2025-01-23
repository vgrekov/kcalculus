import 'package:kcalculus/domain/models/dish/dish.dart';

abstract interface class DishRepository {
  Future<Dish?> getById(String id);

  Future<Dish> save(Dish dish);
}
