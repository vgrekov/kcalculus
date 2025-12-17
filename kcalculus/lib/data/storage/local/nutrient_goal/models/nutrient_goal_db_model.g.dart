// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_goal_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutrientGoalDbModel _$NutrientGoalDbModelFromJson(Map<String, dynamic> json) =>
    _NutrientGoalDbModel(
      id: json['id'] as String,
      nutrient: json['nutrient'] as String,
      amount_unit: json['amount_unit'] as String,
      amount_value: (json['amount_value'] as num).toDouble(),
    );

Map<String, dynamic> _$NutrientGoalDbModelToJson(
  _NutrientGoalDbModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'nutrient': instance.nutrient,
  'amount_unit': instance.amount_unit,
  'amount_value': instance.amount_value,
};
