// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_shared_pref_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSettingsSharedPrefModel {
  String? get themeName => throw _privateConstructorUsedError;
  bool? get crashlyticsEnabled => throw _privateConstructorUsedError;
  int? get signedAgreementVersion => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingsSharedPrefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsSharedPrefModelCopyWith<AppSettingsSharedPrefModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsSharedPrefModelCopyWith<$Res> {
  factory $AppSettingsSharedPrefModelCopyWith(AppSettingsSharedPrefModel value,
          $Res Function(AppSettingsSharedPrefModel) then) =
      _$AppSettingsSharedPrefModelCopyWithImpl<$Res,
          AppSettingsSharedPrefModel>;
  @useResult
  $Res call(
      {String? themeName,
      bool? crashlyticsEnabled,
      int? signedAgreementVersion});
}

/// @nodoc
class _$AppSettingsSharedPrefModelCopyWithImpl<$Res,
        $Val extends AppSettingsSharedPrefModel>
    implements $AppSettingsSharedPrefModelCopyWith<$Res> {
  _$AppSettingsSharedPrefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsSharedPrefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeName = freezed,
    Object? crashlyticsEnabled = freezed,
    Object? signedAgreementVersion = freezed,
  }) {
    return _then(_value.copyWith(
      themeName: freezed == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      crashlyticsEnabled: freezed == crashlyticsEnabled
          ? _value.crashlyticsEnabled
          : crashlyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedAgreementVersion: freezed == signedAgreementVersion
          ? _value.signedAgreementVersion
          : signedAgreementVersion // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsSharedPrefModelImplCopyWith<$Res>
    implements $AppSettingsSharedPrefModelCopyWith<$Res> {
  factory _$$AppSettingsSharedPrefModelImplCopyWith(
          _$AppSettingsSharedPrefModelImpl value,
          $Res Function(_$AppSettingsSharedPrefModelImpl) then) =
      __$$AppSettingsSharedPrefModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? themeName,
      bool? crashlyticsEnabled,
      int? signedAgreementVersion});
}

/// @nodoc
class __$$AppSettingsSharedPrefModelImplCopyWithImpl<$Res>
    extends _$AppSettingsSharedPrefModelCopyWithImpl<$Res,
        _$AppSettingsSharedPrefModelImpl>
    implements _$$AppSettingsSharedPrefModelImplCopyWith<$Res> {
  __$$AppSettingsSharedPrefModelImplCopyWithImpl(
      _$AppSettingsSharedPrefModelImpl _value,
      $Res Function(_$AppSettingsSharedPrefModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingsSharedPrefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeName = freezed,
    Object? crashlyticsEnabled = freezed,
    Object? signedAgreementVersion = freezed,
  }) {
    return _then(_$AppSettingsSharedPrefModelImpl(
      themeName: freezed == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      crashlyticsEnabled: freezed == crashlyticsEnabled
          ? _value.crashlyticsEnabled
          : crashlyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedAgreementVersion: freezed == signedAgreementVersion
          ? _value.signedAgreementVersion
          : signedAgreementVersion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AppSettingsSharedPrefModelImpl implements _AppSettingsSharedPrefModel {
  const _$AppSettingsSharedPrefModelImpl(
      {this.themeName, this.crashlyticsEnabled, this.signedAgreementVersion});

  @override
  final String? themeName;
  @override
  final bool? crashlyticsEnabled;
  @override
  final int? signedAgreementVersion;

  @override
  String toString() {
    return 'AppSettingsSharedPrefModel(themeName: $themeName, crashlyticsEnabled: $crashlyticsEnabled, signedAgreementVersion: $signedAgreementVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsSharedPrefModelImpl &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName) &&
            (identical(other.crashlyticsEnabled, crashlyticsEnabled) ||
                other.crashlyticsEnabled == crashlyticsEnabled) &&
            (identical(other.signedAgreementVersion, signedAgreementVersion) ||
                other.signedAgreementVersion == signedAgreementVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, themeName, crashlyticsEnabled, signedAgreementVersion);

  /// Create a copy of AppSettingsSharedPrefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsSharedPrefModelImplCopyWith<_$AppSettingsSharedPrefModelImpl>
      get copyWith => __$$AppSettingsSharedPrefModelImplCopyWithImpl<
          _$AppSettingsSharedPrefModelImpl>(this, _$identity);
}

abstract class _AppSettingsSharedPrefModel
    implements AppSettingsSharedPrefModel {
  const factory _AppSettingsSharedPrefModel(
      {final String? themeName,
      final bool? crashlyticsEnabled,
      final int? signedAgreementVersion}) = _$AppSettingsSharedPrefModelImpl;

  @override
  String? get themeName;
  @override
  bool? get crashlyticsEnabled;
  @override
  int? get signedAgreementVersion;

  /// Create a copy of AppSettingsSharedPrefModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsSharedPrefModelImplCopyWith<_$AppSettingsSharedPrefModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
