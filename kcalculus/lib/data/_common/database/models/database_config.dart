import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'database_config.freezed.dart';

const _kDefaultSqlStatementSeparator = '--SQL-STATEMENT-SEPARATOR';

final _kDefaultMigrationNumberFormatter = NumberFormat('000');

String _defaultMigrationScriptProvider(int version) {
  final formattedVersion = _kDefaultMigrationNumberFormatter.format(version);
  return '$formattedVersion.sql';
}

@freezed
sealed class DatabaseConfig with _$DatabaseConfig {
  const DatabaseConfig._();

  const factory DatabaseConfig({
    required String name,
    required int version,
    String? initScript,
    required String migrationsDir,
    @Default(
      _defaultMigrationScriptProvider,
    )
    String Function(int version) migrationScriptProvider,
    @Default(
      _kDefaultSqlStatementSeparator,
    )
    String sqlStatementSeparator,
  }) = _DatabaseConfig;

  String migrationScriptFor(int version) {
    return '$migrationsDir/${migrationScriptProvider(version)}';
  }
}
