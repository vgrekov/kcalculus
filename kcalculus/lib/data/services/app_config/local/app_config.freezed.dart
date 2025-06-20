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
mixin _$LocalAppConfig {
  String get openFoodFactsBaseUrl;
  int get openFoodFactsTimeoutMillis;
  String get contactEmail;
  String get androidInterstitialAdUnitId;
  String get iOsInterstitialAdUnitId;
  int get interstitialAdTimeoutMillis;
  String get androidUnlockAdUnitId;
  String get iOsUnlockAdUnitId;
  int get unlockAdTimeoutMillis;
  int get unlockWithAdDurationMins;
  int get interstitialAdCooldownDurationMins;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalAppConfigCopyWith<LocalAppConfig> get copyWith =>
      _$LocalAppConfigCopyWithImpl<LocalAppConfig>(
          this as LocalAppConfig, _$identity);

  /// Serializes this LocalAppConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalAppConfig &&
            (identical(other.openFoodFactsBaseUrl, openFoodFactsBaseUrl) ||
                other.openFoodFactsBaseUrl == openFoodFactsBaseUrl) &&
            (identical(other.openFoodFactsTimeoutMillis, openFoodFactsTimeoutMillis) ||
                other.openFoodFactsTimeoutMillis ==
                    openFoodFactsTimeoutMillis) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.androidInterstitialAdUnitId,
                    androidInterstitialAdUnitId) ||
                other.androidInterstitialAdUnitId ==
                    androidInterstitialAdUnitId) &&
            (identical(other.iOsInterstitialAdUnitId, iOsInterstitialAdUnitId) ||
                other.iOsInterstitialAdUnitId == iOsInterstitialAdUnitId) &&
            (identical(other.interstitialAdTimeoutMillis,
                    interstitialAdTimeoutMillis) ||
                other.interstitialAdTimeoutMillis ==
                    interstitialAdTimeoutMillis) &&
            (identical(other.androidUnlockAdUnitId, androidUnlockAdUnitId) ||
                other.androidUnlockAdUnitId == androidUnlockAdUnitId) &&
            (identical(other.iOsUnlockAdUnitId, iOsUnlockAdUnitId) ||
                other.iOsUnlockAdUnitId == iOsUnlockAdUnitId) &&
            (identical(other.unlockAdTimeoutMillis, unlockAdTimeoutMillis) ||
                other.unlockAdTimeoutMillis == unlockAdTimeoutMillis) &&
            (identical(
                    other.unlockWithAdDurationMins, unlockWithAdDurationMins) ||
                other.unlockWithAdDurationMins == unlockWithAdDurationMins) &&
            (identical(other.interstitialAdCooldownDurationMins,
                    interstitialAdCooldownDurationMins) ||
                other.interstitialAdCooldownDurationMins ==
                    interstitialAdCooldownDurationMins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      openFoodFactsBaseUrl,
      openFoodFactsTimeoutMillis,
      contactEmail,
      androidInterstitialAdUnitId,
      iOsInterstitialAdUnitId,
      interstitialAdTimeoutMillis,
      androidUnlockAdUnitId,
      iOsUnlockAdUnitId,
      unlockAdTimeoutMillis,
      unlockWithAdDurationMins,
      interstitialAdCooldownDurationMins);

  @override
  String toString() {
    return 'LocalAppConfig(openFoodFactsBaseUrl: $openFoodFactsBaseUrl, openFoodFactsTimeoutMillis: $openFoodFactsTimeoutMillis, contactEmail: $contactEmail, androidInterstitialAdUnitId: $androidInterstitialAdUnitId, iOsInterstitialAdUnitId: $iOsInterstitialAdUnitId, interstitialAdTimeoutMillis: $interstitialAdTimeoutMillis, androidUnlockAdUnitId: $androidUnlockAdUnitId, iOsUnlockAdUnitId: $iOsUnlockAdUnitId, unlockAdTimeoutMillis: $unlockAdTimeoutMillis, unlockWithAdDurationMins: $unlockWithAdDurationMins, interstitialAdCooldownDurationMins: $interstitialAdCooldownDurationMins)';
  }
}

/// @nodoc
abstract mixin class $LocalAppConfigCopyWith<$Res> {
  factory $LocalAppConfigCopyWith(
          LocalAppConfig value, $Res Function(LocalAppConfig) _then) =
      _$LocalAppConfigCopyWithImpl;
  @useResult
  $Res call(
      {String openFoodFactsBaseUrl,
      int openFoodFactsTimeoutMillis,
      String contactEmail,
      String androidInterstitialAdUnitId,
      String iOsInterstitialAdUnitId,
      int interstitialAdTimeoutMillis,
      String androidUnlockAdUnitId,
      String iOsUnlockAdUnitId,
      int unlockAdTimeoutMillis,
      int unlockWithAdDurationMins,
      int interstitialAdCooldownDurationMins});
}

/// @nodoc
class _$LocalAppConfigCopyWithImpl<$Res>
    implements $LocalAppConfigCopyWith<$Res> {
  _$LocalAppConfigCopyWithImpl(this._self, this._then);

  final LocalAppConfig _self;
  final $Res Function(LocalAppConfig) _then;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openFoodFactsBaseUrl = null,
    Object? openFoodFactsTimeoutMillis = null,
    Object? contactEmail = null,
    Object? androidInterstitialAdUnitId = null,
    Object? iOsInterstitialAdUnitId = null,
    Object? interstitialAdTimeoutMillis = null,
    Object? androidUnlockAdUnitId = null,
    Object? iOsUnlockAdUnitId = null,
    Object? unlockAdTimeoutMillis = null,
    Object? unlockWithAdDurationMins = null,
    Object? interstitialAdCooldownDurationMins = null,
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
      androidInterstitialAdUnitId: null == androidInterstitialAdUnitId
          ? _self.androidInterstitialAdUnitId
          : androidInterstitialAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      iOsInterstitialAdUnitId: null == iOsInterstitialAdUnitId
          ? _self.iOsInterstitialAdUnitId
          : iOsInterstitialAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      interstitialAdTimeoutMillis: null == interstitialAdTimeoutMillis
          ? _self.interstitialAdTimeoutMillis
          : interstitialAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      androidUnlockAdUnitId: null == androidUnlockAdUnitId
          ? _self.androidUnlockAdUnitId
          : androidUnlockAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      iOsUnlockAdUnitId: null == iOsUnlockAdUnitId
          ? _self.iOsUnlockAdUnitId
          : iOsUnlockAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockAdTimeoutMillis: null == unlockAdTimeoutMillis
          ? _self.unlockAdTimeoutMillis
          : unlockAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      unlockWithAdDurationMins: null == unlockWithAdDurationMins
          ? _self.unlockWithAdDurationMins
          : unlockWithAdDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
      interstitialAdCooldownDurationMins: null ==
              interstitialAdCooldownDurationMins
          ? _self.interstitialAdCooldownDurationMins
          : interstitialAdCooldownDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LocalAppConfig implements LocalAppConfig {
  const _LocalAppConfig(
      {required this.openFoodFactsBaseUrl,
      required this.openFoodFactsTimeoutMillis,
      required this.contactEmail,
      required this.androidInterstitialAdUnitId,
      required this.iOsInterstitialAdUnitId,
      required this.interstitialAdTimeoutMillis,
      required this.androidUnlockAdUnitId,
      required this.iOsUnlockAdUnitId,
      required this.unlockAdTimeoutMillis,
      required this.unlockWithAdDurationMins,
      required this.interstitialAdCooldownDurationMins});
  factory _LocalAppConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalAppConfigFromJson(json);

  @override
  final String openFoodFactsBaseUrl;
  @override
  final int openFoodFactsTimeoutMillis;
  @override
  final String contactEmail;
  @override
  final String androidInterstitialAdUnitId;
  @override
  final String iOsInterstitialAdUnitId;
  @override
  final int interstitialAdTimeoutMillis;
  @override
  final String androidUnlockAdUnitId;
  @override
  final String iOsUnlockAdUnitId;
  @override
  final int unlockAdTimeoutMillis;
  @override
  final int unlockWithAdDurationMins;
  @override
  final int interstitialAdCooldownDurationMins;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalAppConfigCopyWith<_LocalAppConfig> get copyWith =>
      __$LocalAppConfigCopyWithImpl<_LocalAppConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocalAppConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalAppConfig &&
            (identical(other.openFoodFactsBaseUrl, openFoodFactsBaseUrl) ||
                other.openFoodFactsBaseUrl == openFoodFactsBaseUrl) &&
            (identical(other.openFoodFactsTimeoutMillis, openFoodFactsTimeoutMillis) ||
                other.openFoodFactsTimeoutMillis ==
                    openFoodFactsTimeoutMillis) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.androidInterstitialAdUnitId,
                    androidInterstitialAdUnitId) ||
                other.androidInterstitialAdUnitId ==
                    androidInterstitialAdUnitId) &&
            (identical(other.iOsInterstitialAdUnitId, iOsInterstitialAdUnitId) ||
                other.iOsInterstitialAdUnitId == iOsInterstitialAdUnitId) &&
            (identical(other.interstitialAdTimeoutMillis,
                    interstitialAdTimeoutMillis) ||
                other.interstitialAdTimeoutMillis ==
                    interstitialAdTimeoutMillis) &&
            (identical(other.androidUnlockAdUnitId, androidUnlockAdUnitId) ||
                other.androidUnlockAdUnitId == androidUnlockAdUnitId) &&
            (identical(other.iOsUnlockAdUnitId, iOsUnlockAdUnitId) ||
                other.iOsUnlockAdUnitId == iOsUnlockAdUnitId) &&
            (identical(other.unlockAdTimeoutMillis, unlockAdTimeoutMillis) ||
                other.unlockAdTimeoutMillis == unlockAdTimeoutMillis) &&
            (identical(
                    other.unlockWithAdDurationMins, unlockWithAdDurationMins) ||
                other.unlockWithAdDurationMins == unlockWithAdDurationMins) &&
            (identical(other.interstitialAdCooldownDurationMins,
                    interstitialAdCooldownDurationMins) ||
                other.interstitialAdCooldownDurationMins ==
                    interstitialAdCooldownDurationMins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      openFoodFactsBaseUrl,
      openFoodFactsTimeoutMillis,
      contactEmail,
      androidInterstitialAdUnitId,
      iOsInterstitialAdUnitId,
      interstitialAdTimeoutMillis,
      androidUnlockAdUnitId,
      iOsUnlockAdUnitId,
      unlockAdTimeoutMillis,
      unlockWithAdDurationMins,
      interstitialAdCooldownDurationMins);

  @override
  String toString() {
    return 'LocalAppConfig(openFoodFactsBaseUrl: $openFoodFactsBaseUrl, openFoodFactsTimeoutMillis: $openFoodFactsTimeoutMillis, contactEmail: $contactEmail, androidInterstitialAdUnitId: $androidInterstitialAdUnitId, iOsInterstitialAdUnitId: $iOsInterstitialAdUnitId, interstitialAdTimeoutMillis: $interstitialAdTimeoutMillis, androidUnlockAdUnitId: $androidUnlockAdUnitId, iOsUnlockAdUnitId: $iOsUnlockAdUnitId, unlockAdTimeoutMillis: $unlockAdTimeoutMillis, unlockWithAdDurationMins: $unlockWithAdDurationMins, interstitialAdCooldownDurationMins: $interstitialAdCooldownDurationMins)';
  }
}

/// @nodoc
abstract mixin class _$LocalAppConfigCopyWith<$Res>
    implements $LocalAppConfigCopyWith<$Res> {
  factory _$LocalAppConfigCopyWith(
          _LocalAppConfig value, $Res Function(_LocalAppConfig) _then) =
      __$LocalAppConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String openFoodFactsBaseUrl,
      int openFoodFactsTimeoutMillis,
      String contactEmail,
      String androidInterstitialAdUnitId,
      String iOsInterstitialAdUnitId,
      int interstitialAdTimeoutMillis,
      String androidUnlockAdUnitId,
      String iOsUnlockAdUnitId,
      int unlockAdTimeoutMillis,
      int unlockWithAdDurationMins,
      int interstitialAdCooldownDurationMins});
}

/// @nodoc
class __$LocalAppConfigCopyWithImpl<$Res>
    implements _$LocalAppConfigCopyWith<$Res> {
  __$LocalAppConfigCopyWithImpl(this._self, this._then);

  final _LocalAppConfig _self;
  final $Res Function(_LocalAppConfig) _then;

  /// Create a copy of LocalAppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? openFoodFactsBaseUrl = null,
    Object? openFoodFactsTimeoutMillis = null,
    Object? contactEmail = null,
    Object? androidInterstitialAdUnitId = null,
    Object? iOsInterstitialAdUnitId = null,
    Object? interstitialAdTimeoutMillis = null,
    Object? androidUnlockAdUnitId = null,
    Object? iOsUnlockAdUnitId = null,
    Object? unlockAdTimeoutMillis = null,
    Object? unlockWithAdDurationMins = null,
    Object? interstitialAdCooldownDurationMins = null,
  }) {
    return _then(_LocalAppConfig(
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
      androidInterstitialAdUnitId: null == androidInterstitialAdUnitId
          ? _self.androidInterstitialAdUnitId
          : androidInterstitialAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      iOsInterstitialAdUnitId: null == iOsInterstitialAdUnitId
          ? _self.iOsInterstitialAdUnitId
          : iOsInterstitialAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      interstitialAdTimeoutMillis: null == interstitialAdTimeoutMillis
          ? _self.interstitialAdTimeoutMillis
          : interstitialAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      androidUnlockAdUnitId: null == androidUnlockAdUnitId
          ? _self.androidUnlockAdUnitId
          : androidUnlockAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      iOsUnlockAdUnitId: null == iOsUnlockAdUnitId
          ? _self.iOsUnlockAdUnitId
          : iOsUnlockAdUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockAdTimeoutMillis: null == unlockAdTimeoutMillis
          ? _self.unlockAdTimeoutMillis
          : unlockAdTimeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
      unlockWithAdDurationMins: null == unlockWithAdDurationMins
          ? _self.unlockWithAdDurationMins
          : unlockWithAdDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
      interstitialAdCooldownDurationMins: null ==
              interstitialAdCooldownDurationMins
          ? _self.interstitialAdCooldownDurationMins
          : interstitialAdCooldownDurationMins // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
