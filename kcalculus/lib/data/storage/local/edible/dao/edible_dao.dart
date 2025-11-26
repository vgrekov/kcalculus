import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/edible/converters/edible_preview_converter.dart';
import 'package:kcalculus/data/storage/local/edible/services/edible_service.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:sqflite/sqflite.dart';

class LocalEdibleDao extends Notifier<void> {
  @override
  void build() {}

  LocalEdibleService get _edibleService =>
      ref.read(localEdibleServiceProvider.notifier);

  LocalEdiblePreviewConverter get _ediblePreviewConverter =>
      ref.read(localEdiblePreviewConverterProvider.notifier);

  Future<bool> isEmpty({
    Transaction? txn,
  }) =>
      _edibleService.isEmpty(
        txn: txn,
      );

  Future<List<EdiblePreview>> getAll({
    int? limit,
    int? offset,
    Transaction? txn,
  }) {
    return _edibleService
        .all(
          limit: limit,
          offset: offset,
          txn: txn,
        )
        .then(
          (data) => data.map(_ediblePreviewConverter.toModel).toList(),
        );
  }

  Future<List<EdiblePreview>> search(
    String? query, {
    int? limit,
    int? offset,
    Transaction? txn,
  }) {
    return _edibleService
        .search(
          query,
          limit: limit,
          offset: offset,
          txn: txn,
        )
        .then(
          (data) => data.map(_ediblePreviewConverter.toModel).toList(),
        );
  }

  Future<int> count(
    String? query, {
    EdiblePreviewType? type,
    Transaction? txn,
  }) {
    return _edibleService.count(
      query,
      onlyFoods: type == EdiblePreviewType.food,
      onlyDishes: type == EdiblePreviewType.dish,
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

  Future<List<EdiblePreview>> findEdiblesWithoutNutritionFactsPreviews({
    Transaction? txn,
  }) {
    return _edibleService.findEdiblesWithoutNutritionFactsPreviews().then(
          (data) => data.map(_ediblePreviewConverter.toModel).toList(),
        );
  }
}

final localEdibleDaoProvider = NotifierProvider<LocalEdibleDao, void>(
  LocalEdibleDao.new,
);
