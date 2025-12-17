// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionFactsDbModel _$NutritionFactsDbModelFromJson(
  Map<String, dynamic> json,
) => _NutritionFactsDbModel(
  id: json['id'] as String,
  edible_id: json['edible_id'] as String,
  amount_unit: json['amount_unit'] as String,
  amount_value: (json['amount_value'] as num).toDouble(),
);

Map<String, dynamic> _$NutritionFactsDbModelToJson(
  _NutritionFactsDbModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'edible_id': instance.edible_id,
  'amount_unit': instance.amount_unit,
  'amount_value': instance.amount_value,
};
