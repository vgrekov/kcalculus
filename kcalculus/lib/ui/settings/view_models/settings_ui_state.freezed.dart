// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsUiState {
  AppSettings get settings;
  User? get user;
  AppInfo? get appInfo;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsUiStateCopyWith<SettingsUiState> get copyWith =>
      _$SettingsUiStateCopyWithImpl<SettingsUiState>(
          this as SettingsUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsUiState &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings, user, appInfo);

  @override
  String toString() {
    return 'SettingsUiState(settings: $settings, user: $user, appInfo: $appInfo)';
  }
}

/// @nodoc
abstract mixin class $SettingsUiStateCopyWith<$Res> {
  factory $SettingsUiStateCopyWith(
          SettingsUiState value, $Res Function(SettingsUiState) _then) =
      _$SettingsUiStateCopyWithImpl;
  @useResult
  $Res call({AppSettings settings, User? user, AppInfo? appInfo});

  $AppSettingsCopyWith<$Res> get settings;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SettingsUiStateCopyWithImpl<$Res>
    implements $SettingsUiStateCopyWith<$Res> {
  _$SettingsUiStateCopyWithImpl(this._self, this._then);

  final SettingsUiState _self;
  final $Res Function(SettingsUiState) _then;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? user = freezed,
    Object? appInfo = freezed,
  }) {
    return _then(_self.copyWith(
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      appInfo: freezed == appInfo
          ? _self.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo?,
    ));
  }

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res> get settings {
    return $AppSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _SettingsUiState implements SettingsUiState {
  const _SettingsUiState({required this.settings, this.user, this.appInfo});

  @override
  final AppSettings settings;
  @override
  final User? user;
  @override
  final AppInfo? appInfo;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsUiStateCopyWith<_SettingsUiState> get copyWith =>
      __$SettingsUiStateCopyWithImpl<_SettingsUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsUiState &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings, user, appInfo);

  @override
  String toString() {
    return 'SettingsUiState(settings: $settings, user: $user, appInfo: $appInfo)';
  }
}

/// @nodoc
abstract mixin class _$SettingsUiStateCopyWith<$Res>
    implements $SettingsUiStateCopyWith<$Res> {
  factory _$SettingsUiStateCopyWith(
          _SettingsUiState value, $Res Function(_SettingsUiState) _then) =
      __$SettingsUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({AppSettings settings, User? user, AppInfo? appInfo});

  @override
  $AppSettingsCopyWith<$Res> get settings;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$SettingsUiStateCopyWithImpl<$Res>
    implements _$SettingsUiStateCopyWith<$Res> {
  __$SettingsUiStateCopyWithImpl(this._self, this._then);

  final _SettingsUiState _self;
  final $Res Function(_SettingsUiState) _then;

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? settings = null,
    Object? user = freezed,
    Object? appInfo = freezed,
  }) {
    return _then(_SettingsUiState(
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      appInfo: freezed == appInfo
          ? _self.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo?,
    ));
  }

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res> get settings {
    return $AppSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of SettingsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
