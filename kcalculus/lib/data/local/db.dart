import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

const _dbName = 'kcalculus.db';

final dbProvider = Provider.autoDispose<Future<Database>>((ref) async {
  final dbDir = await getDatabasesPath();
  final dbPath = path.join(dbDir, _dbName);
  final db = await openDatabase(dbPath);

  ref.onDispose(() {
    db.close();
  });

  return db;
});
