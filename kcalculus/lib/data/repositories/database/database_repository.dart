import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:sqflite/sqflite.dart';

final databaseRepository = FutureProvider.autoDispose<Database>((ref) async {
  final dbService = DatabaseService();
  final db = await dbService.openDatabase();

  ref.onDispose(() {
    db.close();
  });

  return db;
});
