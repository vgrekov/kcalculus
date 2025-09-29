// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionFactsPreview _$NutritionFactsPreviewFromJson(
        Map<String, dynamic> json) =>
    _NutritionFactsPreview(
      per: Amount.fromJson(json['per'] as Map<String, dynamic>),
      calories: Amount.fromJson(json['calories'] as Map<String, dynamic>),
      fat: json['fat'] == null
          ? null
          : Amount.fromJson(json['fat'] as Map<String, dynamic>),
      carbs: json['carbs'] == null
          ? null
          : Amount.fromJson(json['carbs'] as Map<String, dynamic>),
      protein: json['protein'] == null
          ? null
          : Amount.fromJson(json['protein'] as Map<String, dynamic>),
      fiber: json['fiber'] == null
          ? null
          : Amount.fromJson(json['fiber'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutritionFactsPreviewToJson(
        _NutritionFactsPreview instance) =>
    <String, dynamic>{
      'per': instance.per.toJson(),
      'calories': instance.calories.toJson(),
      'fat': instance.fat?.toJson(),
      'carbs': instance.carbs?.toJson(),
      'protein': instance.protein?.toJson(),
      'fiber': instance.fiber?.toJson(),
    };
