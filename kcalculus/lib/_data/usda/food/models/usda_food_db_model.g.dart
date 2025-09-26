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
      nf_preview_calories_unit: json['nf_preview_calories_unit'] as String?,
      nf_preview_calories_value:
          (json['nf_preview_calories_value'] as num?)?.toDouble(),
      nf_preview_fat_unit: json['nf_preview_fat_unit'] as String?,
      nf_preview_fat_value: (json['nf_preview_fat_value'] as num?)?.toDouble(),
      nf_preview_carbs_unit: json['nf_preview_carbs_unit'] as String?,
      nf_preview_carbs_value:
          (json['nf_preview_carbs_value'] as num?)?.toDouble(),
      nf_preview_protein_unit: json['nf_preview_protein_unit'] as String?,
      nf_preview_protein_value:
          (json['nf_preview_protein_value'] as num?)?.toDouble(),
      nf_preview_fiber_unit: json['nf_preview_fiber_unit'] as String?,
      nf_preview_fiber_value:
          (json['nf_preview_fiber_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UsdaFoodDbModelToJson(_UsdaFoodDbModel instance) =>
    <String, dynamic>{
      'fdc_id': instance.fdc_id,
      'name': instance.name,
      'description': instance.description,
      'data_type': instance.data_type,
      'priority': instance.priority,
      'nf_preview_calories_unit': instance.nf_preview_calories_unit,
      'nf_preview_calories_value': instance.nf_preview_calories_value,
      'nf_preview_fat_unit': instance.nf_preview_fat_unit,
      'nf_preview_fat_value': instance.nf_preview_fat_value,
      'nf_preview_carbs_unit': instance.nf_preview_carbs_unit,
      'nf_preview_carbs_value': instance.nf_preview_carbs_value,
      'nf_preview_protein_unit': instance.nf_preview_protein_unit,
      'nf_preview_protein_value': instance.nf_preview_protein_value,
      'nf_preview_fiber_unit': instance.nf_preview_fiber_unit,
      'nf_preview_fiber_value': instance.nf_preview_fiber_value,
    };
