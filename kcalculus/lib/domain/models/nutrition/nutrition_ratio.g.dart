// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_ratio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionRatio _$NutritionRatioFromJson(Map<String, dynamic> json) =>
    _NutritionRatio(
      perAmount: Amount.fromJson(json['perAmount'] as Map<String, dynamic>),
      totalAmount: Amount.fromJson(json['totalAmount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutritionRatioToJson(_NutritionRatio instance) =>
    <String, dynamic>{
      'perAmount': instance.perAmount.toJson(),
      'totalAmount': instance.totalAmount.toJson(),
    };
