// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_goal_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutrientGoalFirestoreModel _$NutrientGoalFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _NutrientGoalFirestoreModel(
      id: json['id'] as String?,
      nutrient: json['nutrient'] as String,
      unit: json['unit'] as String,
      value: (json['value'] as num).toDouble(),
      createdAt: timestampToDate(json['createdAt']),
      deletedAt: timestampToDate(json['deletedAt']),
    );

Map<String, dynamic> _$NutrientGoalFirestoreModelToJson(
        _NutrientGoalFirestoreModel instance) =>
    <String, dynamic>{
      'nutrient': instance.nutrient,
      'unit': instance.unit,
      'value': instance.value,
    };
