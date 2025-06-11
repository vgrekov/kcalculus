// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdibleDbModel _$EdibleDbModelFromJson(Map<String, dynamic> json) =>
    _EdibleDbModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$EdibleDbModelToJson(_EdibleDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
