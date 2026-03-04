// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_container_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodContainerDbModel _$FoodContainerDbModelFromJson(
  Map<String, dynamic> json,
) => _FoodContainerDbModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  weight_unit: json['weight_unit'] as String,
  weight_value: (json['weight_value'] as num).toDouble(),
  created_at: json['created_at'] as String?,
  updated_at: json['updated_at'] as String?,
  deleted_at: json['deleted_at'] as String?,
);

Map<String, dynamic> _$FoodContainerDbModelToJson(
  _FoodContainerDbModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'weight_unit': instance.weight_unit,
  'weight_value': instance.weight_value,
};
