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

    return executor
        .rawQuery(
          '''
      SELECT
        id,
        name,
        description,
        mass_per_amount_value,
        mass_per_amount_unit,
        mass_total_amount_value,
        mass_total_amount_unit,
        volume_per_amount_value,
        volume_per_amount_unit,
        volume_total_amount_value,
        volume_total_amount_unit,
        quantity_per_amount_value,
        quantity_per_amount_unit,
        quantity_total_amount_value,
        quantity_total_amount_unit,
        created_at,
        updated_at,
        deleted_at,
        MAX(eaten_at) AS last_eaten_at
      FROM (
        SELECT
          edibles.id,
          edibles.name,
          edibles.description,
          dishes.mass_per_amount_value,
          dishes.mass_per_amount_unit,
          dishes.mass_total_amount_value,
          dishes.mass_total_amount_unit,
          dishes.volume_per_amount_value,
          dishes.volume_per_amount_unit,
          dishes.volume_total_amount_value,
          dishes.volume_total_amount_unit,
          dishes.quantity_per_amount_value,
          dishes.quantity_per_amount_unit,
          dishes.quantity_total_amount_value,
          dishes.quantity_total_amount_unit,
          edibles.created_at,
          edibles.updated_at,
          edibles.deleted_at,
          meals.eaten_at
        FROM
          dishes
        LEFT JOIN edibles ON
          edibles.id = dishes.id
        LEFT JOIN meals ON
          meals.edible_id = edibles.id
          AND meals.deleted_at IS NULL
        WHERE
          dishes.id = ?
      )
      GROUP BY
        id,
        name,
        description,
        mass_per_amount_value,
        mass_per_amount_unit,
        mass_total_amount_value,
        mass_total_amount_unit,
        volume_per_amount_value,
        volume_per_amount_unit,
        volume_total_amount_value,
        volume_total_amount_unit,
        quantity_per_amount_value,
        quantity_per_amount_unit,
        quantity_total_amount_value,
        quantity_total_amount_unit,
        created_at,
        updated_at,
        deleted_at
      ''',
          [id],
        )
        .then((data) => data.map(DishDbModel.fromJson).firstOrNull);
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
