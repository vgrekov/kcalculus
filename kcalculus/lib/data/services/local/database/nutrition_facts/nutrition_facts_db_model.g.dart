// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionFactsDbModelImpl _$$NutritionFactsDbModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutritionFactsDbModelImpl(
      edible_id: json['edible_id'] as String,
      amount_unit: json['amount_unit'] as String,
      amount_value: (json['amount_value'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
      fat_in_grams: (json['fat_in_grams'] as num).toDouble(),
      carbs_in_grams: (json['carbs_in_grams'] as num).toDouble(),
      fiber_in_grams: (json['fiber_in_grams'] as num).toDouble(),
      protein_in_grams: (json['protein_in_grams'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutritionFactsDbModelImplToJson(
        _$NutritionFactsDbModelImpl instance) =>
    <String, dynamic>{
      'edible_id': instance.edible_id,
      'amount_unit': instance.amount_unit,
      'amount_value': instance.amount_value,
      'calories': instance.calories,
      'fat_in_grams': instance.fat_in_grams,
      'carbs_in_grams': instance.carbs_in_grams,
      'fiber_in_grams': instance.fiber_in_grams,
      'protein_in_grams': instance.protein_in_grams,
    };
