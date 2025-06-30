import 'package:kcalculus/domain/models/food_container.dart';

abstract interface class FoodContainerRepository {
  Future<List<FoodContainer>> search(
    String? query, {
    int? limit,
    int? offset,
  });

  Future<FoodContainer?> getById(String id);

  Future<FoodContainer> save(FoodContainer container);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}
