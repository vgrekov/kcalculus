// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interstitial_ads_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterstitialAdsConfig _$InterstitialAdsConfigFromJson(
  Map<String, dynamic> json,
) => _InterstitialAdsConfig(
  unitId: json['unitId'] as String,
  timeoutMillis: (json['timeoutMillis'] as num).toInt(),
  cooldownDurationMins: (json['cooldownDurationMins'] as num).toInt(),
  probability: (json['probability'] as num).toDouble(),
);

Map<String, dynamic> _$InterstitialAdsConfigToJson(
  _InterstitialAdsConfig instance,
) => <String, dynamic>{
  'unitId': instance.unitId,
  'timeoutMillis': instance.timeoutMillis,
  'cooldownDurationMins': instance.cooldownDurationMins,
  'probability': instance.probability,
};
