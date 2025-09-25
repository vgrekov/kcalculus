import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/_common/database/models/database_config.dart';
import 'package:kcalculus/_data/_common/database/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

const kLocalStorageDbConfig = DatabaseConfig(
  name: 'kcalculus.db',
  version: 22,
  initScript: 'assets/db/enable_fk.sql',
  migrationsDir: 'assets/db/migrations',
);

Future<Database> database(Ref ref) => ref.read(
      databaseServiceProvider(kLocalStorageDbConfig).future,
    );

DatabaseService databaseService(Ref ref) => ref.read(
      databaseServiceProvider(kLocalStorageDbConfig).notifier,
    );
