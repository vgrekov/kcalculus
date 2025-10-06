// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_ratio_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionRatioFirestoreModel _$NutritionRatioFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _NutritionRatioFirestoreModel(
      per: AmountFirestoreModel.fromJson(json['per'] as Map<String, dynamic>),
      total:
          AmountFirestoreModel.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutritionRatioFirestoreModelToJson(
        _NutritionRatioFirestoreModel instance) =>
    <String, dynamic>{
      'per': instance.per.toJson(),
      'total': instance.total.toJson(),
    };
