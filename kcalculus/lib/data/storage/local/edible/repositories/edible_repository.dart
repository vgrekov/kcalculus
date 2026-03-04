import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';

class LocalEdibleRepository extends EdibleRepository {
  LocalEdibleDao get _edibleDao => ref.read(localEdibleDaoProvider.notifier);

  @override
  Future<bool> isEmpty() => _edibleDao.isEmpty();

  @override
  Future<List<EdiblePreview>> getAll({
    bool includeDeleted = false,
    PageConfig<EdiblePreview>? pageConfig,
  }) {
    return _edibleDao.getAll(
      includeDeleted: includeDeleted,
      limit: pageConfig?.size,
      offset: pageConfig?.offset,
    );
  }

  @override
  Future<List<EdiblePreview>> search(
    String? query, {
    PageConfig<EdiblePreview>? pageConfig,
  }) {
    return _edibleDao.search(
      query,
      limit: pageConfig?.size,
      offset: pageConfig?.offset,
    );
  }

  @override
  Future<int> count([String? query]) {
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
  Future<List<EdiblePreview>> findEdiblesWithoutNutritionFactsPreviews() {
    return _edibleDao.findEdiblesWithoutNutritionFactsPreviews();
  }
}

final localEdibleRepositoryProvider = NotifierProvider<EdibleRepository, void>(
  LocalEdibleRepository.new,
);
