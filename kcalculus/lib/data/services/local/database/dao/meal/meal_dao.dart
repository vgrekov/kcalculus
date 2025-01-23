import 'package:kcalculus/data/services/local/database/dao/meal/meal_db_model.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:sqflite/sqflite.dart';

class MealDao {
  MealDao(this.database);

  final Future<Database> database;

  Future<List<MealDbModel>> getByDate(DateTime date) async {
    final db = await database;
    return db.rawQuery(
      '''
      SELECT
        meals.*,
        foods.id AS edible_food_id,
        dishes.id AS edible_dish_id
      FROM
        meals
      LEFT JOIN foods ON
        foods.id = meals.edible_id
      LEFT JOIN dishes ON
        dishes.id = meals.edible_id
      WHERE
        meals.deleted_at IS NULL
        AND STRFTIME('%d-%m-%Y', meals.eaten_at) = ?
      ORDER BY
        meals.eaten_at
      ''',
      [dt.formatDate(date)],
    ).then((data) => data.map(MealDbModel.fromJson).toList());
  }

  Future<void> add(
    MealDbModel model, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    await executor.insert(
      'meals',
      model.toJson(),
    );
  }

  Future<void> update(
    MealDbModel model, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    await executor.update(
      'meals',
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    final count = await executor.update(
      'meals',
      {
        'deleted_at': dt.formatISO8601(DateTime.now()),
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) async {
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    final count = await executor.update(
      'meals',
      {
        'deleted_at': null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    return count > 0;
  }
}
