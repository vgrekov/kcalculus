// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientDataImpl _$$NutrientDataImplFromJson(Map<String, dynamic> json) =>
    _$NutrientDataImpl(
      calories: (json['calories'] as num).toDouble(),
      fatInGrams: (json['fatInGrams'] as num).toDouble(),
      carbsInGrams: (json['carbsInGrams'] as num).toDouble(),
      fiberInGrams: (json['fiberInGrams'] as num).toDouble(),
      proteinInGrams: (json['proteinInGrams'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutrientDataImplToJson(_$NutrientDataImpl instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'fatInGrams': instance.fatInGrams,
      'carbsInGrams': instance.carbsInGrams,
      'fiberInGrams': instance.fiberInGrams,
      'proteinInGrams': instance.proteinInGrams,
    };
