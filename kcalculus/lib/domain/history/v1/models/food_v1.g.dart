// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodV1Impl _$$FoodV1ImplFromJson(Map<String, dynamic> json) => _$FoodV1Impl(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      nutritionFacts: (json['nutritionFacts'] as List<dynamic>)
          .map((e) => NutritionFactsV1.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FoodV1ImplToJson(_$FoodV1Impl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'nutritionFacts': instance.nutritionFacts,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
