import 'package:kcalculus/data/repositories/food_container_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/food_container_dao.dart';
import 'package:kcalculus/domain/models/food_container.dart';

class LocalContainerRepository implements FoodContainerRepository {
  LocalContainerRepository({
    required LocalFoodContainerDao containerDao,
  }) : _containerDao = containerDao;

  final LocalFoodContainerDao _containerDao;

  @override
  Future<List<FoodContainer>> search(
    String? query, {
    int? limit,
    int? offset,
  }) {
    return _containerDao.search(
      query,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<FoodContainer?> getById(String id) {
    return _containerDao.getById(id);
  }

  @override
  Future<FoodContainer> save(FoodContainer container) async {
    final id = await _containerDao.save(container);
    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) {
    return _containerDao.delete(id);
  }

  @override
  Future<bool> restore(String id) {
    return _containerDao.restore(id);
  }
}
