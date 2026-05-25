// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenFoodFactsConfig _$OpenFoodFactsConfigFromJson(Map<String, dynamic> json) =>
    _OpenFoodFactsConfig(
      baseUrl: json['baseUrl'] as String,
      timeoutMillis: (json['timeoutMillis'] as num).toInt(),
      contactEmail: json['contactEmail'] as String,
    );

Map<String, dynamic> _$OpenFoodFactsConfigToJson(
  _OpenFoodFactsConfig instance,
) => <String, dynamic>{
  'baseUrl': instance.baseUrl,
  'timeoutMillis': instance.timeoutMillis,
  'contactEmail': instance.contactEmail,
};
