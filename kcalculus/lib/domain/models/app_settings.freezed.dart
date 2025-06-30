// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {
  AppTheme get theme;
  bool? get crashlyticsEnabled;
  bool? get analyticsEnabled;
  int? get signedAgreementVersion;
  bool get scannerDisclaimerEnabled;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppSettings &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.crashlyticsEnabled, crashlyticsEnabled) ||
                other.crashlyticsEnabled == crashlyticsEnabled) &&
            (identical(other.analyticsEnabled, analyticsEnabled) ||
                other.analyticsEnabled == analyticsEnabled) &&
            (identical(other.signedAgreementVersion, signedAgreementVersion) ||
                other.signedAgreementVersion == signedAgreementVersion) &&
            (identical(
                    other.scannerDisclaimerEnabled, scannerDisclaimerEnabled) ||
                other.scannerDisclaimerEnabled == scannerDisclaimerEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, theme, crashlyticsEnabled,
      analyticsEnabled, signedAgreementVersion, scannerDisclaimerEnabled);

  @override
  String toString() {
    return 'AppSettings(theme: $theme, crashlyticsEnabled: $crashlyticsEnabled, analyticsEnabled: $analyticsEnabled, signedAgreementVersion: $signedAgreementVersion, scannerDisclaimerEnabled: $scannerDisclaimerEnabled)';
  }
}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) _then) =
      _$AppSettingsCopyWithImpl;
  @useResult
  $Res call(
      {AppTheme theme,
      bool? crashlyticsEnabled,
      bool? analyticsEnabled,
      int? signedAgreementVersion,
      bool scannerDisclaimerEnabled});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? crashlyticsEnabled = freezed,
    Object? analyticsEnabled = freezed,
    Object? signedAgreementVersion = freezed,
    Object? scannerDisclaimerEnabled = null,
  }) {
    return _then(_self.copyWith(
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      crashlyticsEnabled: freezed == crashlyticsEnabled
          ? _self.crashlyticsEnabled
          : crashlyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      analyticsEnabled: freezed == analyticsEnabled
          ? _self.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedAgreementVersion: freezed == signedAgreementVersion
          ? _self.signedAgreementVersion
          : signedAgreementVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      scannerDisclaimerEnabled: null == scannerDisclaimerEnabled
          ? _self.scannerDisclaimerEnabled
          : scannerDisclaimerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppSettings implements AppSettings {
  const _AppSettings(
      {required this.theme,
      this.crashlyticsEnabled,
      this.analyticsEnabled,
      this.signedAgreementVersion,
      required this.scannerDisclaimerEnabled});
  factory _AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  @override
  final AppTheme theme;
  @override
  final bool? crashlyticsEnabled;
  @override
  final bool? analyticsEnabled;
  @override
  final int? signedAgreementVersion;
  @override
  final bool scannerDisclaimerEnabled;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppSettings &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.crashlyticsEnabled, crashlyticsEnabled) ||
                other.crashlyticsEnabled == crashlyticsEnabled) &&
            (identical(other.analyticsEnabled, analyticsEnabled) ||
                other.analyticsEnabled == analyticsEnabled) &&
            (identical(other.signedAgreementVersion, signedAgreementVersion) ||
                other.signedAgreementVersion == signedAgreementVersion) &&
            (identical(
                    other.scannerDisclaimerEnabled, scannerDisclaimerEnabled) ||
                other.scannerDisclaimerEnabled == scannerDisclaimerEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, theme, crashlyticsEnabled,
      analyticsEnabled, signedAgreementVersion, scannerDisclaimerEnabled);

  @override
  String toString() {
    return 'AppSettings(theme: $theme, crashlyticsEnabled: $crashlyticsEnabled, analyticsEnabled: $analyticsEnabled, signedAgreementVersion: $signedAgreementVersion, scannerDisclaimerEnabled: $scannerDisclaimerEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) _then) =
      __$AppSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AppTheme theme,
      bool? crashlyticsEnabled,
      bool? analyticsEnabled,
      int? signedAgreementVersion,
      bool scannerDisclaimerEnabled});
}

/// @nodoc
class __$AppSettingsCopyWithImpl<$Res> implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? theme = null,
    Object? crashlyticsEnabled = freezed,
    Object? analyticsEnabled = freezed,
    Object? signedAgreementVersion = freezed,
    Object? scannerDisclaimerEnabled = null,
  }) {
    return _then(_AppSettings(
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      crashlyticsEnabled: freezed == crashlyticsEnabled
          ? _self.crashlyticsEnabled
          : crashlyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      analyticsEnabled: freezed == analyticsEnabled
          ? _self.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedAgreementVersion: freezed == signedAgreementVersion
          ? _self.signedAgreementVersion
          : signedAgreementVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      scannerDisclaimerEnabled: null == scannerDisclaimerEnabled
          ? _self.scannerDisclaimerEnabled
          : scannerDisclaimerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
