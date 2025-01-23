// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientDbModelImpl _$$IngredientDbModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientDbModelImpl(
      dish_id: json['dish_id'] as String,
      edible_id: json['edible_id'] as String,
      edible_food_id: json['edible_food_id'] as String?,
      edible_dish_id: json['edible_dish_id'] as String?,
      amount_unit: json['amount_unit'] as String,
      amount_value: (json['amount_value'] as num).toDouble(),
    );

Map<String, dynamic> _$$IngredientDbModelImplToJson(
        _$IngredientDbModelImpl instance) =>
    <String, dynamic>{
      'dish_id': instance.dish_id,
      'edible_id': instance.edible_id,
      'amount_unit': instance.amount_unit,
      'amount_value': instance.amount_value,
    };
