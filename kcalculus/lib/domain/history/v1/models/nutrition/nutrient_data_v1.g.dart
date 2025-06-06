// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_data_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientDataV1Impl _$$NutrientDataV1ImplFromJson(Map<String, dynamic> json) =>
    _$NutrientDataV1Impl(
      calories: (json['calories'] as num).toDouble(),
      fatInGrams: (json['fatInGrams'] as num).toDouble(),
      carbsInGrams: (json['carbsInGrams'] as num).toDouble(),
      fiberInGrams: (json['fiberInGrams'] as num).toDouble(),
      proteinInGrams: (json['proteinInGrams'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutrientDataV1ImplToJson(
        _$NutrientDataV1Impl instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'fatInGrams': instance.fatInGrams,
      'carbsInGrams': instance.carbsInGrams,
      'fiberInGrams': instance.fiberInGrams,
      'proteinInGrams': instance.proteinInGrams,
    };
