// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchConfig _$SearchConfigFromJson(Map<String, dynamic> json) =>
    _SearchConfig(
      ediblesIndexName: json['ediblesIndexName'] as String,
      foodContainersIndexName: json['foodContainersIndexName'] as String,
      recentLookbackDurationSecs:
          (json['recentLookbackDurationSecs'] as num?)?.toInt() ??
          kDefaultRecentLookbackDurationSecs,
    );

Map<String, dynamic> _$SearchConfigToJson(_SearchConfig instance) =>
    <String, dynamic>{
      'ediblesIndexName': instance.ediblesIndexName,
      'foodContainersIndexName': instance.foodContainersIndexName,
      'recentLookbackDurationSecs': instance.recentLookbackDurationSecs,
    };
