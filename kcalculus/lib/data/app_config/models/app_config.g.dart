// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  openFoodFactsBaseUrl: json['openFoodFactsBaseUrl'] as String,
  openFoodFactsTimeoutMillis: (json['openFoodFactsTimeoutMillis'] as num)
      .toInt(),
  contactEmail: json['contactEmail'] as String,
  interstitialAdUnitId: json['interstitialAdUnitId'] as String,
  interstitialAdTimeoutMillis: (json['interstitialAdTimeoutMillis'] as num)
      .toInt(),
  interstitialAdCooldownDurationMins:
      (json['interstitialAdCooldownDurationMins'] as num).toInt(),
  unlockAdUnitId: json['unlockAdUnitId'] as String,
  unlockAdTimeoutMillis: (json['unlockAdTimeoutMillis'] as num).toInt(),
  unlockWithAdDurationMins: (json['unlockWithAdDurationMins'] as num).toInt(),
  adsEnabled: json['adsEnabled'] as bool,
  emailVerificationCooldownDurationSecs:
      (json['emailVerificationCooldownDurationSecs'] as num?)?.toInt() ??
      kDefaultEmailVerificationCooldownDurationSecs,
  recentLookbackDurationSecs:
      (json['recentLookbackDurationSecs'] as num?)?.toInt() ??
      kDefaultRecentLookbackDurationSecs,
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'openFoodFactsBaseUrl': instance.openFoodFactsBaseUrl,
      'openFoodFactsTimeoutMillis': instance.openFoodFactsTimeoutMillis,
      'contactEmail': instance.contactEmail,
      'interstitialAdUnitId': instance.interstitialAdUnitId,
      'interstitialAdTimeoutMillis': instance.interstitialAdTimeoutMillis,
      'interstitialAdCooldownDurationMins':
          instance.interstitialAdCooldownDurationMins,
      'unlockAdUnitId': instance.unlockAdUnitId,
      'unlockAdTimeoutMillis': instance.unlockAdTimeoutMillis,
      'unlockWithAdDurationMins': instance.unlockWithAdDurationMins,
      'adsEnabled': instance.adsEnabled,
      'emailVerificationCooldownDurationSecs':
          instance.emailVerificationCooldownDurationSecs,
      'recentLookbackDurationSecs': instance.recentLookbackDurationSecs,
    };
