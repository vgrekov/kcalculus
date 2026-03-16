// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  auth: AuthConfig.fromJson(json['auth'] as Map<String, dynamic>),
  search: SearchConfig.fromJson(json['search'] as Map<String, dynamic>),
  ads: AdsConfig.fromJson(json['ads'] as Map<String, dynamic>),
  openFoodFacts: OpenFoodFactsConfig.fromJson(
    json['openFoodFacts'] as Map<String, dynamic>,
  ),
  firestore: FirestoreConfig.fromJson(
    json['firestore'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'auth': instance.auth.toJson(),
      'search': instance.search.toJson(),
      'ads': instance.ads.toJson(),
      'openFoodFacts': instance.openFoodFacts.toJson(),
      'firestore': instance.firestore.toJson(),
    };
