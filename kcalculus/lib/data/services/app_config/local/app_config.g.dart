// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalAppConfigImpl _$$LocalAppConfigImplFromJson(Map<String, dynamic> json) =>
    _$LocalAppConfigImpl(
      openFoodFactsBaseUrl: json['openFoodFactsBaseUrl'] as String,
      contactEmail: json['contactEmail'] as String,
      androidInterstitialAdUnitId:
          json['androidInterstitialAdUnitId'] as String,
      iOsInterstitialAdUnitId: json['iOsInterstitialAdUnitId'] as String,
      androidUnlockAdUnitId: json['androidUnlockAdUnitId'] as String,
      iOsUnlockAdUnitId: json['iOsUnlockAdUnitId'] as String,
      unlockWithAdDurationMins:
          (json['unlockWithAdDurationMins'] as num).toInt(),
      interstitialAdCooldownDurationMins:
          (json['interstitialAdCooldownDurationMins'] as num).toInt(),
    );

Map<String, dynamic> _$$LocalAppConfigImplToJson(
        _$LocalAppConfigImpl instance) =>
    <String, dynamic>{
      'openFoodFactsBaseUrl': instance.openFoodFactsBaseUrl,
      'contactEmail': instance.contactEmail,
      'androidInterstitialAdUnitId': instance.androidInterstitialAdUnitId,
      'iOsInterstitialAdUnitId': instance.iOsInterstitialAdUnitId,
      'androidUnlockAdUnitId': instance.androidUnlockAdUnitId,
      'iOsUnlockAdUnitId': instance.iOsUnlockAdUnitId,
      'unlockWithAdDurationMins': instance.unlockWithAdDurationMins,
      'interstitialAdCooldownDurationMins':
          instance.interstitialAdCooldownDurationMins,
    };
