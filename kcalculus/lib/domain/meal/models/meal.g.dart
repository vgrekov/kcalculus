// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MealToJson(_Meal instance) => <String, dynamic>{
  'id': instance.id,
  'edible': instance.edible.toJson(),
  'amount': instance.amount.toJson(),
  'eatenAt': instance.eatenAt.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};
