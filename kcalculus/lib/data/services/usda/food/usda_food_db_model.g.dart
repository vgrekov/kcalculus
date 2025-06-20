// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_food_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsdaFoodDbModel _$UsdaFoodDbModelFromJson(Map<String, dynamic> json) =>
    _UsdaFoodDbModel(
      fdc_id: (json['fdc_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      data_type: json['data_type'] as String,
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$UsdaFoodDbModelToJson(_UsdaFoodDbModel instance) =>
    <String, dynamic>{
      'fdc_id': instance.fdc_id,
      'name': instance.name,
      'description': instance.description,
      'data_type': instance.data_type,
      'priority': instance.priority,
    };
