// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdiblePreview _$EdiblePreviewFromJson(Map<String, dynamic> json) =>
    _EdiblePreview(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$EdiblePreviewTypeEnumMap, json['type']),
      nutritionFactsPreview: json['nutritionFactsPreview'] == null
          ? null
          : NutritionFactsPreview.fromJson(
              json['nutritionFactsPreview'] as Map<String, dynamic>),
      lastEatenAt: json['lastEatenAt'] == null
          ? null
          : DateTime.parse(json['lastEatenAt'] as String),
      touchedAt: json['touchedAt'] == null
          ? null
          : DateTime.parse(json['touchedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isRecent: json['isRecent'] as bool? ?? false,
    );

Map<String, dynamic> _$EdiblePreviewToJson(_EdiblePreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$EdiblePreviewTypeEnumMap[instance.type]!,
      'nutritionFactsPreview': instance.nutritionFactsPreview?.toJson(),
      'lastEatenAt': instance.lastEatenAt?.toIso8601String(),
      'touchedAt': instance.touchedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'isRecent': instance.isRecent,
    };

const _$EdiblePreviewTypeEnumMap = {
  EdiblePreviewType.food: 'food',
  EdiblePreviewType.dish: 'dish',
  EdiblePreviewType.usda: 'usda',
};
