// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DatabaseConfig {
  String get name;
  int get version;
  String? get initScript;
  String get migrationsDir;
  String Function(int version) get migrationScriptProvider;
  String get sqlStatementSeparator;

  /// Create a copy of DatabaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DatabaseConfigCopyWith<DatabaseConfig> get copyWith =>
      _$DatabaseConfigCopyWithImpl<DatabaseConfig>(
          this as DatabaseConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DatabaseConfig &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.initScript, initScript) ||
                other.initScript == initScript) &&
            (identical(other.migrationsDir, migrationsDir) ||
                other.migrationsDir == migrationsDir) &&
            (identical(
                    other.migrationScriptProvider, migrationScriptProvider) ||
                other.migrationScriptProvider == migrationScriptProvider) &&
            (identical(other.sqlStatementSeparator, sqlStatementSeparator) ||
                other.sqlStatementSeparator == sqlStatementSeparator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, version, initScript,
      migrationsDir, migrationScriptProvider, sqlStatementSeparator);

  @override
  String toString() {
    return 'DatabaseConfig(name: $name, version: $version, initScript: $initScript, migrationsDir: $migrationsDir, migrationScriptProvider: $migrationScriptProvider, sqlStatementSeparator: $sqlStatementSeparator)';
  }
}

/// @nodoc
abstract mixin class $DatabaseConfigCopyWith<$Res> {
  factory $DatabaseConfigCopyWith(
          DatabaseConfig value, $Res Function(DatabaseConfig) _then) =
      _$DatabaseConfigCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      int version,
      String? initScript,
      String migrationsDir,
      String Function(int version) migrationScriptProvider,
      String sqlStatementSeparator});
}

/// @nodoc
class _$DatabaseConfigCopyWithImpl<$Res>
    implements $DatabaseConfigCopyWith<$Res> {
  _$DatabaseConfigCopyWithImpl(this._self, this._then);

  final DatabaseConfig _self;
  final $Res Function(DatabaseConfig) _then;

  /// Create a copy of DatabaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? initScript = freezed,
    Object? migrationsDir = null,
    Object? migrationScriptProvider = null,
    Object? sqlStatementSeparator = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      initScript: freezed == initScript
          ? _self.initScript
          : initScript // ignore: cast_nullable_to_non_nullable
              as String?,
      migrationsDir: null == migrationsDir
          ? _self.migrationsDir
          : migrationsDir // ignore: cast_nullable_to_non_nullable
              as String,
      migrationScriptProvider: null == migrationScriptProvider
          ? _self.migrationScriptProvider
          : migrationScriptProvider // ignore: cast_nullable_to_non_nullable
              as String Function(int version),
      sqlStatementSeparator: null == sqlStatementSeparator
          ? _self.sqlStatementSeparator
          : sqlStatementSeparator // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DatabaseConfig extends DatabaseConfig {
  const _DatabaseConfig(
      {required this.name,
      required this.version,
      this.initScript,
      required this.migrationsDir,
      this.migrationScriptProvider = _defaultMigrationScriptProvider,
      this.sqlStatementSeparator = _kDefaultSqlStatementSeparator})
      : super._();

  @override
  final String name;
  @override
  final int version;
  @override
  final String? initScript;
  @override
  final String migrationsDir;
  @override
  @JsonKey()
  final String Function(int version) migrationScriptProvider;
  @override
  @JsonKey()
  final String sqlStatementSeparator;

  /// Create a copy of DatabaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DatabaseConfigCopyWith<_DatabaseConfig> get copyWith =>
      __$DatabaseConfigCopyWithImpl<_DatabaseConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DatabaseConfig &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.initScript, initScript) ||
                other.initScript == initScript) &&
            (identical(other.migrationsDir, migrationsDir) ||
                other.migrationsDir == migrationsDir) &&
            (identical(
                    other.migrationScriptProvider, migrationScriptProvider) ||
                other.migrationScriptProvider == migrationScriptProvider) &&
            (identical(other.sqlStatementSeparator, sqlStatementSeparator) ||
                other.sqlStatementSeparator == sqlStatementSeparator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, version, initScript,
      migrationsDir, migrationScriptProvider, sqlStatementSeparator);

  @override
  String toString() {
    return 'DatabaseConfig(name: $name, version: $version, initScript: $initScript, migrationsDir: $migrationsDir, migrationScriptProvider: $migrationScriptProvider, sqlStatementSeparator: $sqlStatementSeparator)';
  }
}

/// @nodoc
abstract mixin class _$DatabaseConfigCopyWith<$Res>
    implements $DatabaseConfigCopyWith<$Res> {
  factory _$DatabaseConfigCopyWith(
          _DatabaseConfig value, $Res Function(_DatabaseConfig) _then) =
      __$DatabaseConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      int version,
      String? initScript,
      String migrationsDir,
      String Function(int version) migrationScriptProvider,
      String sqlStatementSeparator});
}

/// @nodoc
class __$DatabaseConfigCopyWithImpl<$Res>
    implements _$DatabaseConfigCopyWith<$Res> {
  __$DatabaseConfigCopyWithImpl(this._self, this._then);

  final _DatabaseConfig _self;
  final $Res Function(_DatabaseConfig) _then;

  /// Create a copy of DatabaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? initScript = freezed,
    Object? migrationsDir = null,
    Object? migrationScriptProvider = null,
    Object? sqlStatementSeparator = null,
  }) {
    return _then(_DatabaseConfig(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      initScript: freezed == initScript
          ? _self.initScript
          : initScript // ignore: cast_nullable_to_non_nullable
              as String?,
      migrationsDir: null == migrationsDir
          ? _self.migrationsDir
          : migrationsDir // ignore: cast_nullable_to_non_nullable
              as String,
      migrationScriptProvider: null == migrationScriptProvider
          ? _self.migrationScriptProvider
          : migrationScriptProvider // ignore: cast_nullable_to_non_nullable
              as String Function(int version),
      sqlStatementSeparator: null == sqlStatementSeparator
          ? _self.sqlStatementSeparator
          : sqlStatementSeparator // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
