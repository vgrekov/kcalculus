// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_preview_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdiblePreviewDbModel _$EdiblePreviewDbModelFromJson(
        Map<String, dynamic> json) =>
    _EdiblePreviewDbModel(
      id: json['id'] as String,
      food_id: json['food_id'] as String?,
      dish_id: json['dish_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String?,
      last_eaten_at: json['last_eaten_at'] as String?,
      nf_preview_per_unit: json['nf_preview_per_unit'] as String?,
      nf_preview_per_value: (json['nf_preview_per_value'] as num?)?.toDouble(),
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

Map<String, dynamic> _$EdiblePreviewDbModelToJson(
        _EdiblePreviewDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food_id': instance.food_id,
      'dish_id': instance.dish_id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'last_eaten_at': instance.last_eaten_at,
      'nf_preview_per_unit': instance.nf_preview_per_unit,
      'nf_preview_per_value': instance.nf_preview_per_value,
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
