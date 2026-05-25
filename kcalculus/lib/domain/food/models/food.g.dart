// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Food _$FoodFromJson(Map<String, dynamic> json) => _Food(
  id: json['id'] as String?,
  name: json['name'] as String,
  description: json['description'] as String,
  nutritionFacts: (json['nutritionFacts'] as List<dynamic>)
      .map((e) => NutritionFacts.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  lastEatenAt: json['lastEatenAt'] == null
      ? null
      : DateTime.parse(json['lastEatenAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$FoodToJson(_Food instance) => <String, dynamic>{
  'version': instance.version,
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'nutritionFacts': instance.nutritionFacts.map((e) => e.toJson()).toList(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'lastEatenAt': instance.lastEatenAt?.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};
