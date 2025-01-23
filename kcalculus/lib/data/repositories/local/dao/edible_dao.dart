import 'package:kcalculus/data/repositories/local/converters/edible_search_result_converter.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:sqflite/sqflite.dart';

class LocalEdibleDao {
  LocalEdibleDao({
    required DatabaseService dbService,
    required LocalEdibleSearchResultConverter edibleSearchResultConverter,
  })  : _dbService = dbService,
        _edibleSearchResultConverter = edibleSearchResultConverter;

  final DatabaseService _dbService;

  final LocalEdibleSearchResultConverter _edibleSearchResultConverter;

  Future<List<EdibleSearchResult>> search(String? query,
      {EdibleSearchResultType? type}) {
    return _dbService.edible
        .search(
          query,
          onlyFoods: type == EdibleSearchResultType.food,
          onlyDishes: type == EdibleSearchResultType.dish,
        )
        .then(
          (data) => data.map(_edibleSearchResultConverter.toModel).toList(),
        );
  }

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) {
    return _dbService.edible.exists(
      name,
      description,
      exceptWithId: exceptWithId,
    );
  }

  Future<bool> wasEaten(String id) {
    return _dbService.edible.wasEaten(id);
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.edible.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.edible.restore(id, txn: txn);
  }
}
