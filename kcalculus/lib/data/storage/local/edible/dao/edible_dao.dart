import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/edible/converters/edible_search_result_converter.dart';
import 'package:kcalculus/data/storage/local/edible/services/edible_service.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:sqflite/sqflite.dart';

class LocalEdibleDao extends Notifier<void> {
  @override
  void build() {}

  LocalEdibleService get _edibleService =>
      ref.read(localEdibleServiceProvider.notifier);

  LocalEdibleSearchResultConverter get _edibleSearchResultConverter =>
      ref.read(localEdibleSearchResultConverterProvider.notifier);

  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
    Transaction? txn,
  }) {
    return _edibleService
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
    return _edibleService.count(
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
    return _edibleService.exists(
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
    return _edibleService.wasEaten(id, txn: txn);
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) {
    return _edibleService.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _edibleService.restore(id, txn: txn);
  }

  FutureOr<bool> isMissingNutritionFactsPreviews({
    Transaction? txn,
  }) {
    return _edibleService.isMissingNutritionFactsPreviews(txn: txn);
  }

  Future<List<EdibleSearchResult>> findEdiblesWithoutNutritionFactsPreviews({
    Transaction? txn,
  }) {
    return _edibleService.findEdiblesWithoutNutritionFactsPreviews().then(
          (data) => data.map(_edibleSearchResultConverter.toModel).toList(),
        );
  }
}

final localEdibleDaoProvider = NotifierProvider<LocalEdibleDao, void>(
  LocalEdibleDao.new,
);
