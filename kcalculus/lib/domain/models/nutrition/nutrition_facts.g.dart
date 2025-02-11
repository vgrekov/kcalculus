// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionFactsImpl _$$NutritionFactsImplFromJson(Map<String, dynamic> json) =>
    _$NutritionFactsImpl(
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      nutrientData:
          NutrientData.fromJson(json['nutrientData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NutritionFactsImplToJson(
        _$NutritionFactsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'nutrientData': instance.nutrientData,
    };
