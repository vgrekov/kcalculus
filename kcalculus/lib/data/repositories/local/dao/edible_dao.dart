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

  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
    Transaction? txn,
  }) {
    return _dbService.edible
        .search(
          query,
          onlyFoods: type == EdibleSearchResultType.food,
          onlyDishes: type == EdibleSearchResultType.dish,
          limit: limit,
          offset: offset,
          txn: txn,
        )
        .then(
          (data) => data.map(_edibleSearchResultConverter.toModel).toList(),
        );
  }

  Future<int> count(
    String? query, {
    EdibleSearchResultType? type,
    Transaction? txn,
  }) {
    return _dbService.edible.count(
      query,
      onlyFoods: type == EdibleSearchResultType.food,
      onlyDishes: type == EdibleSearchResultType.dish,
      txn: txn,
    );
  }

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
    Transaction? txn,
  }) {
    return _dbService.edible.exists(
      name.trim(),
      description.trim(),
      exceptWithId: exceptWithId,
      txn: txn,
    );
  }

  Future<bool> wasEaten(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.edible.wasEaten(id, txn: txn);
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
