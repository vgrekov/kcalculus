// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdibleFirestoreModel _$EdibleFirestoreModelFromJson(
  Map<String, dynamic> json,
) => _EdibleFirestoreModel(
  id: json['id'] as String?,
  type: $enumDecode(_$EdibleTypeEnumMap, json['type']),
  name: json['name'] as String,
  nameLower: json['name_lower'] as String,
  description: json['description'] as String,
  descriptionLower: json['description_lower'] as String,
  ownerId: json['ownerId'] as String,
  nutritionFactsPreview: json['nutritionFactsPreview'] == null
      ? null
      : NutritionFactsPreviewFirestoreModel.fromJson(
          json['nutritionFactsPreview'] as Map<String, dynamic>,
        ),
  nutritionFacts: (json['nutritionFacts'] as List<dynamic>?)
      ?.map(
        (e) => NutritionFactsFirestoreModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  nutritionRatios: (json['nutritionRatios'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      $enumDecode(_$MeasureEnumMap, k),
      NutritionRatioFirestoreModel.fromJson(e as Map<String, dynamic>),
    ),
  ),
  ingredients: (json['ingredients'] as List<dynamic>?)
      ?.map((e) => IngredientFirestoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: timestampToDate(json['createdAt']),
  updatedAt: timestampToDate(json['updatedAt']),
  eatenAt: timestampToDate(json['eatenAt']),
  touchedAt: timestampToDate(json['touchedAt']),
  deletedAt: timestampToDate(json['deletedAt']),
  deleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$EdibleFirestoreModelToJson(
  _EdibleFirestoreModel instance,
) => <String, dynamic>{
  'type': _$EdibleTypeEnumMap[instance.type]!,
  'name': instance.name,
  'name_lower': instance.nameLower,
  'description': instance.description,
  'description_lower': instance.descriptionLower,
  'ownerId': instance.ownerId,
  'nutritionFactsPreview': instance.nutritionFactsPreview?.toJson(),
  'nutritionFacts': instance.nutritionFacts?.map((e) => e.toJson()).toList(),
  'nutritionRatios': instance.nutritionRatios?.map(
    (k, e) => MapEntry(_$MeasureEnumMap[k]!, e.toJson()),
  ),
  'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
  'createdAt': dateToTimestamp(instance.createdAt),
  'updatedAt': dateToTimestamp(instance.updatedAt),
  'eatenAt': dateToTimestamp(instance.eatenAt),
  'touchedAt': dateToTimestamp(instance.touchedAt),
  'deletedAt': dateToTimestamp(instance.deletedAt),
  'deleted': instance.deleted,
};

const _$EdibleTypeEnumMap = {EdibleType.food: 'food', EdibleType.dish: 'dish'};

const _$MeasureEnumMap = {
  Measure.mass: 'mass',
  Measure.volume: 'volume',
  Measure.quantity: 'quantity',
  Measure.energy: 'energy',
};
