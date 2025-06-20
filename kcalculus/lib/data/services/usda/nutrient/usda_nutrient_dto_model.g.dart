// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_nutrient_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsdaNutrientDtoModel _$UsdaNutrientDtoModelFromJson(
        Map<String, dynamic> json) =>
    _UsdaNutrientDtoModel(
      number: json['number'] as String,
      amount: (json['amount'] as num).toDouble(),
      unitName: json['unitName'] as String,
    );

Map<String, dynamic> _$UsdaNutrientDtoModelToJson(
        _UsdaNutrientDtoModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'amount': instance.amount,
      'unitName': instance.unitName,
    };
