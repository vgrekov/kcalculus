import 'package:kcalculus/data/repositories/edible_repository.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

class LocalEdibleRepository implements EdibleRepository {
  LocalEdibleRepository({
    required DatabaseService dbService,
  }) : _dbService = dbService;

  final DatabaseService _dbService;

  @override
  Future<List<EdibleSearchResult>> search(String? query,
      {EdibleSearchResultType? type}) {
    return _dbService.edibleDao
        .search(
          query,
          onlyFoods: type == EdibleSearchResultType.food,
          onlyDishes: type == EdibleSearchResultType.dish,
        )
        .then(
          (data) => data
              .map((dbModel) => EdibleSearchResult(
                    id: dbModel.id,
                    name: dbModel.name,
                    description: dbModel.description ?? '',
                    type: dbModel.food_id != null
                        ? EdibleSearchResultType.food
                        : EdibleSearchResultType.dish,
                  ))
              .toList(),
        );
  }

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) {
    return _dbService.edibleDao.exists(
      name,
      description,
      exceptWithId: exceptWithId,
    );
  }

  @override
  Future<bool> wasEaten(String id) {
    return _dbService.edibleDao.wasEaten(id);
  }

  @override
  Future<bool> delete(String id) {
    return _dbService.edibleDao.delete(id);
  }

  @override
  Future<bool> restore(String id) {
    return _dbService.edibleDao.restore(id);
  }
}
