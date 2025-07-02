// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
      openFoodFactsBaseUrl: json['openFoodFactsBaseUrl'] as String,
      openFoodFactsTimeoutMillis:
          (json['openFoodFactsTimeoutMillis'] as num).toInt(),
      contactEmail: json['contactEmail'] as String,
      androidInterstitialAdUnitId:
          json['androidInterstitialAdUnitId'] as String,
      iOsInterstitialAdUnitId: json['iOsInterstitialAdUnitId'] as String,
      interstitialAdTimeoutMillis:
          (json['interstitialAdTimeoutMillis'] as num).toInt(),
      androidUnlockAdUnitId: json['androidUnlockAdUnitId'] as String,
      iOsUnlockAdUnitId: json['iOsUnlockAdUnitId'] as String,
      unlockAdTimeoutMillis: (json['unlockAdTimeoutMillis'] as num).toInt(),
      unlockWithAdDurationMins:
          (json['unlockWithAdDurationMins'] as num).toInt(),
      interstitialAdCooldownDurationMins:
          (json['interstitialAdCooldownDurationMins'] as num).toInt(),
      adsEnabled: json['adsEnabled'] as bool,
    );

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'openFoodFactsBaseUrl': instance.openFoodFactsBaseUrl,
      'openFoodFactsTimeoutMillis': instance.openFoodFactsTimeoutMillis,
      'contactEmail': instance.contactEmail,
      'androidInterstitialAdUnitId': instance.androidInterstitialAdUnitId,
      'iOsInterstitialAdUnitId': instance.iOsInterstitialAdUnitId,
      'interstitialAdTimeoutMillis': instance.interstitialAdTimeoutMillis,
      'androidUnlockAdUnitId': instance.androidUnlockAdUnitId,
      'iOsUnlockAdUnitId': instance.iOsUnlockAdUnitId,
      'unlockAdTimeoutMillis': instance.unlockAdTimeoutMillis,
      'unlockWithAdDurationMins': instance.unlockWithAdDurationMins,
      'interstitialAdCooldownDurationMins':
          instance.interstitialAdCooldownDurationMins,
      'adsEnabled': instance.adsEnabled,
    };
