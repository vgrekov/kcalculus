// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdibleSearchResult _$EdibleSearchResultFromJson(Map<String, dynamic> json) =>
    _EdibleSearchResult(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$EdibleSearchResultTypeEnumMap, json['type']),
      lastEatenAt: json['lastEatenAt'] == null
          ? null
          : DateTime.parse(json['lastEatenAt'] as String),
    );

Map<String, dynamic> _$EdibleSearchResultToJson(_EdibleSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$EdibleSearchResultTypeEnumMap[instance.type]!,
      'lastEatenAt': instance.lastEatenAt?.toIso8601String(),
    };

const _$EdibleSearchResultTypeEnumMap = {
  EdibleSearchResultType.food: 'food',
  EdibleSearchResultType.dish: 'dish',
  EdibleSearchResultType.usda: 'usda',
};
