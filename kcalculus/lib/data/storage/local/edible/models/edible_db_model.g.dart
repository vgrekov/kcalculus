// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdibleDbModel _$EdibleDbModelFromJson(
  Map<String, dynamic> json,
) => _EdibleDbModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  nf_preview_per_unit: json['nf_preview_per_unit'] as String?,
  nf_preview_per_value: (json['nf_preview_per_value'] as num?)?.toDouble(),
  nf_preview_calories_unit: json['nf_preview_calories_unit'] as String?,
  nf_preview_calories_value: (json['nf_preview_calories_value'] as num?)
      ?.toDouble(),
  nf_preview_fat_unit: json['nf_preview_fat_unit'] as String?,
  nf_preview_fat_value: (json['nf_preview_fat_value'] as num?)?.toDouble(),
  nf_preview_carbs_unit: json['nf_preview_carbs_unit'] as String?,
  nf_preview_carbs_value: (json['nf_preview_carbs_value'] as num?)?.toDouble(),
  nf_preview_protein_unit: json['nf_preview_protein_unit'] as String?,
  nf_preview_protein_value: (json['nf_preview_protein_value'] as num?)
      ?.toDouble(),
  nf_preview_fiber_unit: json['nf_preview_fiber_unit'] as String?,
  nf_preview_fiber_value: (json['nf_preview_fiber_value'] as num?)?.toDouble(),
  created_at: json['created_at'] as String?,
  updated_at: json['updated_at'] as String?,
  deleted_at: json['deleted_at'] as String?,
);

Map<String, dynamic> _$EdibleDbModelToJson(_EdibleDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
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
