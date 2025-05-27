// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_amount_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientAmountDbModelImpl _$$NutrientAmountDbModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutrientAmountDbModelImpl(
      nutrition_facts_id: json['nutrition_facts_id'] as String,
      nutrient: json['nutrient'] as String,
      amount_unit: json['amount_unit'] as String,
      amount_value: (json['amount_value'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutrientAmountDbModelImplToJson(
        _$NutrientAmountDbModelImpl instance) =>
    <String, dynamic>{
      'nutrition_facts_id': instance.nutrition_facts_id,
      'nutrient': instance.nutrient,
      'amount_unit': instance.amount_unit,
      'amount_value': instance.amount_value,
    };
