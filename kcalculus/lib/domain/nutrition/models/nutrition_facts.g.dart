// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionFacts _$NutritionFactsFromJson(Map<String, dynamic> json) =>
    _NutritionFacts(
      id: json['id'] as String?,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      nutrientData:
          NutrientData.fromJson(json['nutrientData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutritionFactsToJson(_NutritionFacts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount.toJson(),
      'nutrientData': instance.nutrientData.toJson(),
    };
