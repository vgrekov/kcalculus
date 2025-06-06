// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionFactsV1Impl _$$NutritionFactsV1ImplFromJson(
        Map<String, dynamic> json) =>
    _$NutritionFactsV1Impl(
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      nutrientData:
          NutrientDataV1.fromJson(json['nutrientData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NutritionFactsV1ImplToJson(
        _$NutritionFactsV1Impl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'nutrientData': instance.nutrientData,
    };
