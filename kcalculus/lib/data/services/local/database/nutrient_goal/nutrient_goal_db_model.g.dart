// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_goal_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientGoalDbModelImpl _$$NutrientGoalDbModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutrientGoalDbModelImpl(
      id: json['id'] as String,
      nutrient: json['nutrient'] as String,
      amount_unit: json['amount_unit'] as String,
      amount_value: (json['amount_value'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutrientGoalDbModelImplToJson(
        _$NutrientGoalDbModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nutrient': instance.nutrient,
      'amount_unit': instance.amount_unit,
      'amount_value': instance.amount_value,
    };
