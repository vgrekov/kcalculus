// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestModel _$TestModelFromJson(Map<String, dynamic> json) => _TestModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['desc'] as String?,
);

Map<String, dynamic> _$TestModelToJson(_TestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.description,
    };
