import 'dart:async';

import 'package:kcalculus/_data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/_data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

class LocalEdibleRepository implements EdibleRepository {
  LocalEdibleRepository({
    required LocalEdibleDao edibleDao,
  }) : _edibleDao = edibleDao;

  final LocalEdibleDao _edibleDao;

  @override
  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
  }) {
    return _edibleDao.search(
      query,
      type: type,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<int> count(
    String? query, {
    EdibleSearchResultType? type,
  }) {
    return _edibleDao.count(
      query,
      type: type,
    );
  }

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) {
    return _edibleDao.exists(
      name,
      description,
      exceptWithId: exceptWithId,
    );
  }

  @override
  Future<bool> wasEaten(String id) {
    return _edibleDao.wasEaten(id);
  }

  @override
  FutureOr<bool> isMissingNutritionFactsPreviews() {
    return _edibleDao.isMissingNutritionFactsPreviews();
  }

  @override
  Future<List<EdibleSearchResult>> findEdiblesWithoutNutritionFactsPreviews() {
    return _edibleDao.findEdiblesWithoutNutritionFactsPreviews();
  }
}
