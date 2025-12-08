// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionFactsV1 _$NutritionFactsV1FromJson(Map<String, dynamic> json) =>
    _NutritionFactsV1(
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      nutrientData: NutrientDataV1.fromJson(
        json['nutrientData'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$NutritionFactsV1ToJson(_NutritionFactsV1 instance) =>
    <String, dynamic>{
      'amount': instance.amount.toJson(),
      'nutrientData': instance.nutrientData.toJson(),
    };
