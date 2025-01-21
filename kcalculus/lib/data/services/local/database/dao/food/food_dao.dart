import 'package:kcalculus/data/services/local/database/dao/edible/edible_db_model.dart';
import 'package:sqflite/sqflite.dart';

class FoodDao {
  FoodDao(this.database);

  final Future<Database> database;

  Future<FoodDbModel?> getById(String id) async {
    final db = await database;
    return db.rawQuery(
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
    final db = await database;
    DatabaseExecutor executor = txn ?? db;

    await executor.insert(
      'foods',
      model.toJson(),
    );
  }
}
