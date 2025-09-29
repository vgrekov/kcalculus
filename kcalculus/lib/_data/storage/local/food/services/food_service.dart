import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/_data/storage/local/food/models/food_db_model.dart';
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

    return executor.rawQuery(
      '''
      SELECT
        edibles.id AS id,
        edibles.name AS name,
        edibles.description AS description,
        edibles.created_at AS created_at,
        edibles.updated_at AS updated_at
      FROM
        foods
      LEFT JOIN edibles ON
        edibles.id = foods.id
      WHERE
        foods.id = ?
      ''',
      [id],
    ).then((data) => data.map(FoodDbModel.fromJson).firstOrNull);
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
