// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_amount_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutrientAmountDbModel _$NutrientAmountDbModelFromJson(
  Map<String, dynamic> json,
) => _NutrientAmountDbModel(
  nutrition_facts_id: json['nutrition_facts_id'] as String,
  nutrient: json['nutrient'] as String,
  amount_unit: json['amount_unit'] as String,
  amount_value: (json['amount_value'] as num).toDouble(),
  position: (json['position'] as num).toInt(),
);

Map<String, dynamic> _$NutrientAmountDbModelToJson(
  _NutrientAmountDbModel instance,
) => <String, dynamic>{
  'nutrition_facts_id': instance.nutrition_facts_id,
  'nutrient': instance.nutrient,
  'amount_unit': instance.amount_unit,
  'amount_value': instance.amount_value,
  'position': instance.position,
};
