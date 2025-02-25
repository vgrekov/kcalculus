// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalAppConfig _$LocalAppConfigFromJson(Map<String, dynamic> json) {
  return _LocalAppConfig.fromJson(json);
}

/// @nodoc
mixin _$LocalAppConfig {
  String get openFoodFactsBaseUrl => throw _privateConstructorUsedError;
  String get contactEmail => throw _privateConstructorUsedError;

  /// Serializes this LocalAppConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalAppConfigCopyWith<LocalAppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAppConfigCopyWith<$Res> {
  factory $LocalAppConfigCopyWith(
          LocalAppConfig value, $Res Function(LocalAppConfig) then) =
      _$LocalAppConfigCopyWithImpl<$Res, LocalAppConfig>;
  @useResult
  $Res call({String openFoodFactsBaseUrl, String contactEmail});
}

/// @nodoc
class _$LocalAppConfigCopyWithImpl<$Res, $Val extends LocalAppConfig>
    implements $LocalAppConfigCopyWith<$Res> {
  _$LocalAppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openFoodFactsBaseUrl = null,
    Object? contactEmail = null,
  }) {
    return _then(_value.copyWith(
      openFoodFactsBaseUrl: null == openFoodFactsBaseUrl
          ? _value.openFoodFactsBaseUrl
          : openFoodFactsBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: null == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalAppConfigImplCopyWith<$Res>
    implements $LocalAppConfigCopyWith<$Res> {
  factory _$$LocalAppConfigImplCopyWith(_$LocalAppConfigImpl value,
          $Res Function(_$LocalAppConfigImpl) then) =
      __$$LocalAppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String openFoodFactsBaseUrl, String contactEmail});
}

/// @nodoc
class __$$LocalAppConfigImplCopyWithImpl<$Res>
    extends _$LocalAppConfigCopyWithImpl<$Res, _$LocalAppConfigImpl>
    implements _$$LocalAppConfigImplCopyWith<$Res> {
  __$$LocalAppConfigImplCopyWithImpl(
      _$LocalAppConfigImpl _value, $Res Function(_$LocalAppConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openFoodFactsBaseUrl = null,
    Object? contactEmail = null,
  }) {
    return _then(_$LocalAppConfigImpl(
      openFoodFactsBaseUrl: null == openFoodFactsBaseUrl
          ? _value.openFoodFactsBaseUrl
          : openFoodFactsBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: null == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalAppConfigImpl implements _LocalAppConfig {
  const _$LocalAppConfigImpl(
      {required this.openFoodFactsBaseUrl, required this.contactEmail});

  factory _$LocalAppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalAppConfigImplFromJson(json);

  @override
  final String openFoodFactsBaseUrl;
  @override
  final String contactEmail;

  @override
  String toString() {
    return 'LocalAppConfig(openFoodFactsBaseUrl: $openFoodFactsBaseUrl, contactEmail: $contactEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAppConfigImpl &&
            (identical(other.openFoodFactsBaseUrl, openFoodFactsBaseUrl) ||
                other.openFoodFactsBaseUrl == openFoodFactsBaseUrl) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, openFoodFactsBaseUrl, contactEmail);

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAppConfigImplCopyWith<_$LocalAppConfigImpl> get copyWith =>
      __$$LocalAppConfigImplCopyWithImpl<_$LocalAppConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalAppConfigImplToJson(
      this,
    );
  }
}

abstract class _LocalAppConfig implements LocalAppConfig {
  const factory _LocalAppConfig(
      {required final String openFoodFactsBaseUrl,
      required final String contactEmail}) = _$LocalAppConfigImpl;

  factory _LocalAppConfig.fromJson(Map<String, dynamic> json) =
      _$LocalAppConfigImpl.fromJson;

  @override
  String get openFoodFactsBaseUrl;
  @override
  String get contactEmail;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalAppConfigImplCopyWith<_$LocalAppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
