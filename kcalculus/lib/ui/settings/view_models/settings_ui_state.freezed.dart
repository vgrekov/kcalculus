// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsUiState {
  AppSettings get settings => throw _privateConstructorUsedError;
  PackageInfo? get packageInfo => throw _privateConstructorUsedError;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsUiStateCopyWith<SettingsUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsUiStateCopyWith<$Res> {
  factory $SettingsUiStateCopyWith(
          SettingsUiState value, $Res Function(SettingsUiState) then) =
      _$SettingsUiStateCopyWithImpl<$Res, SettingsUiState>;
  @useResult
  $Res call({AppSettings settings, PackageInfo? packageInfo});

  $AppSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$SettingsUiStateCopyWithImpl<$Res, $Val extends SettingsUiState>
    implements $SettingsUiStateCopyWith<$Res> {
  _$SettingsUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? packageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      packageInfo: freezed == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo?,
    ) as $Val);
  }

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res> get settings {
    return $AppSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsUiStateImplCopyWith<$Res>
    implements $SettingsUiStateCopyWith<$Res> {
  factory _$$SettingsUiStateImplCopyWith(_$SettingsUiStateImpl value,
          $Res Function(_$SettingsUiStateImpl) then) =
      __$$SettingsUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppSettings settings, PackageInfo? packageInfo});

  @override
  $AppSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$SettingsUiStateImplCopyWithImpl<$Res>
    extends _$SettingsUiStateCopyWithImpl<$Res, _$SettingsUiStateImpl>
    implements _$$SettingsUiStateImplCopyWith<$Res> {
  __$$SettingsUiStateImplCopyWithImpl(
      _$SettingsUiStateImpl _value, $Res Function(_$SettingsUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? packageInfo = freezed,
  }) {
    return _then(_$SettingsUiStateImpl(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      packageInfo: freezed == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo?,
    ));
  }
}

/// @nodoc

class _$SettingsUiStateImpl implements _SettingsUiState {
  const _$SettingsUiStateImpl({required this.settings, this.packageInfo});

  @override
  final AppSettings settings;
  @override
  final PackageInfo? packageInfo;

  @override
  String toString() {
    return 'SettingsUiState(settings: $settings, packageInfo: $packageInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsUiStateImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings, packageInfo);

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsUiStateImplCopyWith<_$SettingsUiStateImpl> get copyWith =>
      __$$SettingsUiStateImplCopyWithImpl<_$SettingsUiStateImpl>(
          this, _$identity);
}

abstract class _SettingsUiState implements SettingsUiState {
  const factory _SettingsUiState(
      {required final AppSettings settings,
      final PackageInfo? packageInfo}) = _$SettingsUiStateImpl;

  @override
  AppSettings get settings;
  @override
  PackageInfo? get packageInfo;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsUiStateImplCopyWith<_$SettingsUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
