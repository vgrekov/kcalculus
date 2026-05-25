// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_data_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutrientDataV1 _$NutrientDataV1FromJson(Map<String, dynamic> json) =>
    _NutrientDataV1(
      calories: (json['calories'] as num).toDouble(),
      fatInGrams: (json['fatInGrams'] as num).toDouble(),
      carbsInGrams: (json['carbsInGrams'] as num).toDouble(),
      fiberInGrams: (json['fiberInGrams'] as num).toDouble(),
      proteinInGrams: (json['proteinInGrams'] as num).toDouble(),
    );

Map<String, dynamic> _$NutrientDataV1ToJson(_NutrientDataV1 instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'fatInGrams': instance.fatInGrams,
      'carbsInGrams': instance.carbsInGrams,
      'fiberInGrams': instance.fiberInGrams,
      'proteinInGrams': instance.proteinInGrams,
    };
