import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';

class LocalEdibleRepository extends EdibleRepository {
  LocalEdibleDao get _edibleDao => ref.read(localEdibleDaoProvider.notifier);

  @override
  Future<List<EdibleSearchResult>> search(
    String? query, {
    PageConfig<EdibleSearchResult>? pageConfig,
  }) {
    return _edibleDao.search(
      query,
      limit: pageConfig?.size,
      offset: pageConfig?.offset,
    );
  }

  @override
  Future<int> count(String? query) {
    return _edibleDao.count(query);
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

final localEdibleRepositoryProvider = NotifierProvider<EdibleRepository, void>(
  LocalEdibleRepository.new,
);
