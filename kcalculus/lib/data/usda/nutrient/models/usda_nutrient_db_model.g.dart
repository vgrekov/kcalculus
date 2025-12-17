// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_nutrient_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsdaNutrientDbModel _$UsdaNutrientDbModelFromJson(Map<String, dynamic> json) =>
    _UsdaNutrientDbModel(
      fdc_id: (json['fdc_id'] as num).toInt(),
      number: json['number'] as String,
      amount: (json['amount'] as num).toDouble(),
      unit_name: json['unit_name'] as String,
    );

Map<String, dynamic> _$UsdaNutrientDbModelToJson(
  _UsdaNutrientDbModel instance,
) => <String, dynamic>{
  'fdc_id': instance.fdc_id,
  'number': instance.number,
  'amount': instance.amount,
  'unit_name': instance.unit_name,
};
