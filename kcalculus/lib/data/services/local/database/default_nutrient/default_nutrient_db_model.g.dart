// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_nutrient_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DefaultNutrientDbModel _$DefaultNutrientDbModelFromJson(
        Map<String, dynamic> json) =>
    _DefaultNutrientDbModel(
      name: json['name'] as String,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$DefaultNutrientDbModelToJson(
        _DefaultNutrientDbModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
    };
