// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_ratio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionRatioImpl _$$NutritionRatioImplFromJson(Map<String, dynamic> json) =>
    _$NutritionRatioImpl(
      perAmount: Amount.fromJson(json['perAmount'] as Map<String, dynamic>),
      totalAmount: Amount.fromJson(json['totalAmount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NutritionRatioImplToJson(
        _$NutritionRatioImpl instance) =>
    <String, dynamic>{
      'perAmount': instance.perAmount,
      'totalAmount': instance.totalAmount,
    };
