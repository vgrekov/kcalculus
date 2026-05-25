// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealDbModel _$MealDbModelFromJson(Map<String, dynamic> json) => _MealDbModel(
  id: json['id'] as String,
  edible_id: json['edible_id'] as String,
  edible_food_id: json['edible_food_id'] as String?,
  edible_dish_id: json['edible_dish_id'] as String?,
  amount_unit: json['amount_unit'] as String,
  amount_value: (json['amount_value'] as num).toDouble(),
  eaten_at: json['eaten_at'] as String,
  created_at: json['created_at'] as String?,
  updated_at: json['updated_at'] as String?,
  deleted_at: json['deleted_at'] as String?,
);

Map<String, dynamic> _$MealDbModelToJson(_MealDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'edible_id': instance.edible_id,
      'amount_unit': instance.amount_unit,
      'amount_value': instance.amount_value,
      'eaten_at': instance.eaten_at,
    };
