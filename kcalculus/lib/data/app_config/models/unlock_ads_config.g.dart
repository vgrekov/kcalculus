// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlock_ads_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnlockAdsConfig _$UnlockAdsConfigFromJson(Map<String, dynamic> json) =>
    _UnlockAdsConfig(
      unitId: json['unitId'] as String,
      timeoutMillis: (json['timeoutMillis'] as num).toInt(),
      rewardDurationMins: (json['rewardDurationMins'] as num).toInt(),
    );

Map<String, dynamic> _$UnlockAdsConfigToJson(_UnlockAdsConfig instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'timeoutMillis': instance.timeoutMillis,
      'rewardDurationMins': instance.rewardDurationMins,
    };
