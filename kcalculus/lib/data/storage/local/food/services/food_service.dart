import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/food/models/food_db_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<FoodDbModel?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    return executor
        .rawQuery(
          '''
      SELECT
        id,
        name,
        description,
        created_at,
        updated_at,
        deleted_at,
        MAX(eaten_at) AS last_eaten_at
      FROM (
        SELECT
          edibles.id,
          edibles.name,
          edibles.description,
          edibles.created_at,
          edibles.updated_at,
          edibles.deleted_at,
          meals.eaten_at
        FROM
          foods
        LEFT JOIN edibles ON
          edibles.id = foods.id
        LEFT JOIN meals ON
          meals.edible_id = edibles.id
          AND meals.deleted_at IS NULL
        WHERE
          foods.id = ?
      )
      GROUP BY
        id,
        name,
        description,
        created_at,
        updated_at,
        deleted_at
      ''',
          [id],
        )
        .then((data) => data.map(FoodDbModel.fromJson).firstOrNull);
  }

  Future<void> add(
    FoodDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.insert(
      'foods',
      model.toJson(),
    );
  }
}

final localFoodServiceProvider = NotifierProvider<LocalFoodService, void>(
  LocalFoodService.new,
);
