import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/db.dart';
import 'package:kcalculus/models/food.dart';
import 'package:sqflite/sqflite.dart';

class LocalEdibleDao {
  final Database db;

  LocalEdibleDao({
    required this.db,
  });

  Future<void> add(Edible model, {Transaction? txn}) async {
    DatabaseExecutor executor = txn ?? db;

    await executor.insert('edibles', {
      'id': model.id,
      'name': model.name,
    });
  }
}

final localEdibleDaoProvider = Provider<Future<LocalEdibleDao>>((ref) async {
  final db = await ref.watch(dbProvider);
  return LocalEdibleDao(db: db);
});
