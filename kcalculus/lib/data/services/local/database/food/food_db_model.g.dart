// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodDbModel _$FoodDbModelFromJson(Map<String, dynamic> json) => _FoodDbModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$FoodDbModelToJson(_FoodDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
