import 'package:kcalculus/data/_common/database/models/database_config.dart';
import 'package:kcalculus/data/_common/database/services/database_service.dart';

const _kLocalStorageDbConfig = DatabaseConfig(
  name: 'kcalculus.db',
  version: 23,
  initScript: 'assets/db/enable_fk.sql',
  migrationsDir: 'assets/db/migrations',
);

final localStorageServiceProvider = databaseServiceProvider(
  _kLocalStorageDbConfig,
);
