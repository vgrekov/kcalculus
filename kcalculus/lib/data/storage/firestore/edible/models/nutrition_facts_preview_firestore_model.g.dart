// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts_preview_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionFactsPreviewFirestoreModel
_$NutritionFactsPreviewFirestoreModelFromJson(
  Map<String, dynamic> json,
) => _NutritionFactsPreviewFirestoreModel(
  per: AmountFirestoreModel.fromJson(json['per'] as Map<String, dynamic>),
  calories: AmountFirestoreModel.fromJson(
    json['calories'] as Map<String, dynamic>,
  ),
  fat: json['fat'] == null
      ? null
      : AmountFirestoreModel.fromJson(json['fat'] as Map<String, dynamic>),
  carbs: json['carbs'] == null
      ? null
      : AmountFirestoreModel.fromJson(json['carbs'] as Map<String, dynamic>),
  protein: json['protein'] == null
      ? null
      : AmountFirestoreModel.fromJson(json['protein'] as Map<String, dynamic>),
  fiber: json['fiber'] == null
      ? null
      : AmountFirestoreModel.fromJson(json['fiber'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NutritionFactsPreviewFirestoreModelToJson(
  _NutritionFactsPreviewFirestoreModel instance,
) => <String, dynamic>{
  'per': instance.per.toJson(),
  'calories': instance.calories.toJson(),
  'fat': instance.fat?.toJson(),
  'carbs': instance.carbs?.toJson(),
  'protein': instance.protein?.toJson(),
  'fiber': instance.fiber?.toJson(),
};
