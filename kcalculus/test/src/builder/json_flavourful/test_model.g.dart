// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestModel _$TestModelFromJson(Map<String, dynamic> json) => _TestModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  deleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$TestModelToJson(_TestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'deleted': instance.deleted,
    };
