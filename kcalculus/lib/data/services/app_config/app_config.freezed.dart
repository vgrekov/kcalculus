// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {
  String get openFoodFactsBaseUrl;
  int get openFoodFactsTimeoutMillis;
  String get contactEmail;
  String get interstitialAdUnitId;
  int get interstitialAdTimeoutMillis;
  int get interstitialAdCooldownDurationMins;
  String get unlockAdUnitId;
  int get unlockAdTimeoutMillis;
  int get unlockWithAdDurationMins;
  bool get adsEnabled;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<AppConfig> get copyWith =>
      _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppConfig &&
            (identical(other.openFoodFactsBaseUrl, openFoodFactsBaseUrl) ||
                other.openFoodFactsBaseUrl == openFoodFactsBaseUrl) &&
            (identical(other.openFoodFactsTimeoutMillis,
                    openFoodFactsTimeoutMillis) ||
                other.openFoodFactsTimeoutMillis ==
                    openFoodFactsTimeoutMillis) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.interstitialAdUnitId, interstitialAdUnitId) ||
                other.interstitialAdUnitId == interstitialAdUnitId) &&
            (identical(other.interstitialAdTimeoutMillis,
                    interstitialAdTimeoutMillis) ||
                other.interstitialAdTimeoutMillis ==
                    interstitialAdTimeoutMillis) &&
            (identical(other.interstitialAdCooldownDurationMins,
                    interstitialAdCooldownDurationMins) ||
                other.interstitialAdCooldownDurationMins ==
                    interstitialAdCooldownDurationMins) &&
            (identical(other.unlockAdUnitId, unlockAdUnitId) ||
                other.unlockAdUnitId == unlockAdUnitId) &&
            (identical(other.unlockAdTimeoutMillis, unlockAdTimeoutMillis) ||
                other.unlockAdTimeoutMillis == unlockAdTimeoutMillis) &&
            (identical(
                    other.unlockWithAdDurationMins, unlockWithAdDurationMins) ||
                other.unlockWithAdDurationMins == unlockWithAdDurationMins) &&
            (identical(other.adsEnabled, adsEnabled) ||
                other.adsEnabled == adsEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      openFoodFactsBaseUrl,
      openFoodFactsTimeoutMillis,
      contactEmail,
      interstitialAdUnitId,
      interstitialAdTimeoutMillis,
      interstitialAdCooldownDurationMins,
      unlockAdUnitId,
      unlockAdTimeoutMillis,
      unlockWithAdDurationMins,
      adsEnabled);

  @override
  String toString() {
    return 'AppConfig(openFoodFactsBaseUrl: $openFoodFactsBaseUrl, openFoodFactsTimeoutMillis: $openFoodFactsTimeoutMillis, contactEmail: $contactEmail, interstitialAdUnitId: $interstitialAdUnitId, interstitialAdTimeoutMillis: $interstitialAdTimeoutMillis, interstitialAdCooldownDurationMins: $interstitialAdCooldownDurationMins, unlockAdUnitId: $unlockAdUnitId, unlockAdTimeoutMillis: $unlockAdTimeoutMillis, unlockWithAdDurationMins: $unlockWithAdDurationMins, adsEnabled: $adsEnabled)';
  }
}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) =
      _$AppConfigCopyWithImpl;
  @useResult
  $Res call(
      {String openFoodFactsBaseUrl,
      int openFoodFactsTimeoutMillis,
      String contactEmail,
      String interstitialAdUnitId,
      int interstitialAdTimeoutMillis,
      int interstitialAdCooldownDurationMins,
      String unlockAdUnitId,
      int unlockAdTimeoutMillis,
      int unlockWithAdDurationMins,
      bool adsEnabled});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res> implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openFoodFactsBaseUrl = null,
    Object? openFoodFactsTimeoutMillis = null,
    Object? contactEmail = null,
    Object? interstitialAdUnitId = null,
    Object? interstitialAdTimeoutMillis = null,
    Object? interstitialAdCooldownDurationMins = null,
    Object? unlockAdUnitId = null,
    Object? unlockAdTimeoutMillis = null,
    Object? unlockWithAdDurationMins = null,
    Object? adsEnabled = null,
  }) {
    return _then(_self.copyWith(
      openFoodFactsBaseUrl: null == openFoodFactsBaseUrl
          ? _self.openFoodFactsBaseUrl
          : openFoodFactsBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      openFoodFactsTimeoutMillis: null == openFoodFactsTimeoutMillis
          ? _self.openFoodFactsTimeoutMillis
          : openFoodFactsTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      contactEmail: null == contactEmail
          ? _self.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
      interstitialAdUnitId: null == interstitialAdUnitId
          ? _self.interstitialAdUnitId
          : interstitialAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      interstitialAdTimeoutMillis: null == interstitialAdTimeoutMillis
          ? _self.interstitialAdTimeoutMillis
          : interstitialAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      interstitialAdCooldownDurationMins: null ==
              interstitialAdCooldownDurationMins
          ? _self.interstitialAdCooldownDurationMins
          : interstitialAdCooldownDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
      unlockAdUnitId: null == unlockAdUnitId
          ? _self.unlockAdUnitId
          : unlockAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockAdTimeoutMillis: null == unlockAdTimeoutMillis
          ? _self.unlockAdTimeoutMillis
          : unlockAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      unlockWithAdDurationMins: null == unlockWithAdDurationMins
          ? _self.unlockWithAdDurationMins
          : unlockWithAdDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
      adsEnabled: null == adsEnabled
          ? _self.adsEnabled
          : adsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppConfig implements AppConfig {
  const _AppConfig(
      {required this.openFoodFactsBaseUrl,
      required this.openFoodFactsTimeoutMillis,
      required this.contactEmail,
      required this.interstitialAdUnitId,
      required this.interstitialAdTimeoutMillis,
      required this.interstitialAdCooldownDurationMins,
      required this.unlockAdUnitId,
      required this.unlockAdTimeoutMillis,
      required this.unlockWithAdDurationMins,
      required this.adsEnabled});
  factory _AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  @override
  final String openFoodFactsBaseUrl;
  @override
  final int openFoodFactsTimeoutMillis;
  @override
  final String contactEmail;
  @override
  final String interstitialAdUnitId;
  @override
  final int interstitialAdTimeoutMillis;
  @override
  final int interstitialAdCooldownDurationMins;
  @override
  final String unlockAdUnitId;
  @override
  final int unlockAdTimeoutMillis;
  @override
  final int unlockWithAdDurationMins;
  @override
  final bool adsEnabled;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppConfigCopyWith<_AppConfig> get copyWith =>
      __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppConfig &&
            (identical(other.openFoodFactsBaseUrl, openFoodFactsBaseUrl) ||
                other.openFoodFactsBaseUrl == openFoodFactsBaseUrl) &&
            (identical(other.openFoodFactsTimeoutMillis,
                    openFoodFactsTimeoutMillis) ||
                other.openFoodFactsTimeoutMillis ==
                    openFoodFactsTimeoutMillis) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.interstitialAdUnitId, interstitialAdUnitId) ||
                other.interstitialAdUnitId == interstitialAdUnitId) &&
            (identical(other.interstitialAdTimeoutMillis,
                    interstitialAdTimeoutMillis) ||
                other.interstitialAdTimeoutMillis ==
                    interstitialAdTimeoutMillis) &&
            (identical(other.interstitialAdCooldownDurationMins,
                    interstitialAdCooldownDurationMins) ||
                other.interstitialAdCooldownDurationMins ==
                    interstitialAdCooldownDurationMins) &&
            (identical(other.unlockAdUnitId, unlockAdUnitId) ||
                other.unlockAdUnitId == unlockAdUnitId) &&
            (identical(other.unlockAdTimeoutMillis, unlockAdTimeoutMillis) ||
                other.unlockAdTimeoutMillis == unlockAdTimeoutMillis) &&
            (identical(
                    other.unlockWithAdDurationMins, unlockWithAdDurationMins) ||
                other.unlockWithAdDurationMins == unlockWithAdDurationMins) &&
            (identical(other.adsEnabled, adsEnabled) ||
                other.adsEnabled == adsEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      openFoodFactsBaseUrl,
      openFoodFactsTimeoutMillis,
      contactEmail,
      interstitialAdUnitId,
      interstitialAdTimeoutMillis,
      interstitialAdCooldownDurationMins,
      unlockAdUnitId,
      unlockAdTimeoutMillis,
      unlockWithAdDurationMins,
      adsEnabled);

  @override
  String toString() {
    return 'AppConfig(openFoodFactsBaseUrl: $openFoodFactsBaseUrl, openFoodFactsTimeoutMillis: $openFoodFactsTimeoutMillis, contactEmail: $contactEmail, interstitialAdUnitId: $interstitialAdUnitId, interstitialAdTimeoutMillis: $interstitialAdTimeoutMillis, interstitialAdCooldownDurationMins: $interstitialAdCooldownDurationMins, unlockAdUnitId: $unlockAdUnitId, unlockAdTimeoutMillis: $unlockAdTimeoutMillis, unlockWithAdDurationMins: $unlockWithAdDurationMins, adsEnabled: $adsEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(
          _AppConfig value, $Res Function(_AppConfig) _then) =
      __$AppConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String openFoodFactsBaseUrl,
      int openFoodFactsTimeoutMillis,
      String contactEmail,
      String interstitialAdUnitId,
      int interstitialAdTimeoutMillis,
      int interstitialAdCooldownDurationMins,
      String unlockAdUnitId,
      int unlockAdTimeoutMillis,
      int unlockWithAdDurationMins,
      bool adsEnabled});
}

/// @nodoc
class __$AppConfigCopyWithImpl<$Res> implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? openFoodFactsBaseUrl = null,
    Object? openFoodFactsTimeoutMillis = null,
    Object? contactEmail = null,
    Object? interstitialAdUnitId = null,
    Object? interstitialAdTimeoutMillis = null,
    Object? interstitialAdCooldownDurationMins = null,
    Object? unlockAdUnitId = null,
    Object? unlockAdTimeoutMillis = null,
    Object? unlockWithAdDurationMins = null,
    Object? adsEnabled = null,
  }) {
    return _then(_AppConfig(
      openFoodFactsBaseUrl: null == openFoodFactsBaseUrl
          ? _self.openFoodFactsBaseUrl
          : openFoodFactsBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      openFoodFactsTimeoutMillis: null == openFoodFactsTimeoutMillis
          ? _self.openFoodFactsTimeoutMillis
          : openFoodFactsTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      contactEmail: null == contactEmail
          ? _self.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
      interstitialAdUnitId: null == interstitialAdUnitId
          ? _self.interstitialAdUnitId
          : interstitialAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      interstitialAdTimeoutMillis: null == interstitialAdTimeoutMillis
          ? _self.interstitialAdTimeoutMillis
          : interstitialAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      interstitialAdCooldownDurationMins: null ==
              interstitialAdCooldownDurationMins
          ? _self.interstitialAdCooldownDurationMins
          : interstitialAdCooldownDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
      unlockAdUnitId: null == unlockAdUnitId
          ? _self.unlockAdUnitId
          : unlockAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockAdTimeoutMillis: null == unlockAdTimeoutMillis
          ? _self.unlockAdTimeoutMillis
          : unlockAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      unlockWithAdDurationMins: null == unlockWithAdDurationMins
          ? _self.unlockWithAdDurationMins
          : unlockWithAdDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
      adsEnabled: null == adsEnabled
          ? _self.adsEnabled
          : adsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
