// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$EdibleSearchResultImplToJson(
        _$EdibleSearchResultImpl instance) =>
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
};
