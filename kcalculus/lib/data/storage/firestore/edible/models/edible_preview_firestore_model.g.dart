// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_preview_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdiblePreviewFirestoreModel _$EdiblePreviewFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _EdiblePreviewFirestoreModel(
      id: json['id'] as String,
      type: $enumDecode(_$EdibleTypeEnumMap, json['type']),
      name: json['name'] as String,
      description: json['description'] as String,
      ownerId: json['ownerId'] as String,
      nutritionFactsPreview: json['nutritionFactsPreview'] == null
          ? null
          : NutritionFactsPreviewFirestoreModel.fromJson(
              json['nutritionFactsPreview'] as Map<String, dynamic>),
      eatenAt: timestampToDate(json['eatenAt']),
      touchedAt: timestampToDate(json['touchedAt']),
    );

Map<String, dynamic> _$EdiblePreviewFirestoreModelToJson(
        _EdiblePreviewFirestoreModel instance) =>
    <String, dynamic>{
      'type': _$EdibleTypeEnumMap[instance.type]!,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
      'nutritionFactsPreview': instance.nutritionFactsPreview?.toJson(),
    };

const _$EdibleTypeEnumMap = {
  EdibleType.food: 'food',
  EdibleType.dish: 'dish',
};
