import 'package:kcalculus/domain/models/food.dart';

abstract interface class FoodRepository {
  Future<Food?> getById(String id);

  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  });

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}
