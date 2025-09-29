import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/dish/models/dish_db_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDishService extends Notifier<void> {
  @override
  void build() {}

  Future<Database> get _database =>
      ref.read(localStorageServiceProvider.future);

  Future<DishDbModel?> getById(
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
        dishes.mass_per_amount_value AS mass_per_amount_value,
        dishes.mass_per_amount_unit AS mass_per_amount_unit,
        dishes.mass_total_amount_value AS mass_total_amount_value,
        dishes.mass_total_amount_unit AS mass_total_amount_unit,
        dishes.volume_per_amount_value AS volume_per_amount_value,
        dishes.volume_per_amount_unit AS volume_per_amount_unit,
        dishes.volume_total_amount_value AS volume_total_amount_value,
        dishes.volume_total_amount_unit AS volume_total_amount_unit,
        dishes.quantity_per_amount_value AS quantity_per_amount_value,
        dishes.quantity_per_amount_unit AS quantity_per_amount_unit,
        dishes.quantity_total_amount_value AS quantity_total_amount_value,
        dishes.quantity_total_amount_unit AS quantity_total_amount_unit,
        edibles.created_at AS created_at,
        edibles.updated_at AS updated_at
      FROM
        dishes
      LEFT JOIN edibles ON
        edibles.id = dishes.id
      WHERE
        dishes.id = ?
      ''',
      [id],
    ).then((data) => data.map(DishDbModel.fromJson).firstOrNull);
  }

  Future<void> add(
    DishDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.insert(
      'dishes',
      model.toJson(),
    );
  }

  Future<void> update(
    DishDbModel model, {
    Transaction? txn,
  }) async {
    final executor = txn ?? await _database;

    await executor.update(
      'dishes',
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}

final localDishServiceProvider = NotifierProvider<LocalDishService, void>(
  LocalDishService.new,
);
