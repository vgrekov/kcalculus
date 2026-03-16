// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdsConfig _$AdsConfigFromJson(Map<String, dynamic> json) => _AdsConfig(
  enabled: json['enabled'] as bool? ?? true,
  interstitial: InterstitialAdsConfig.fromJson(
    json['interstitial'] as Map<String, dynamic>,
  ),
  unlock: UnlockAdsConfig.fromJson(json['unlock'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdsConfigToJson(_AdsConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'interstitial': instance.interstitial.toJson(),
      'unlock': instance.unlock.toJson(),
    };
