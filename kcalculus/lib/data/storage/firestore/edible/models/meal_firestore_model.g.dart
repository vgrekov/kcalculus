// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealFirestoreModel _$MealFirestoreModelFromJson(Map<String, dynamic> json) =>
    _MealFirestoreModel(
      id: json['id'] as String?,
      edibleId: json['edibleId'] as String,
      amount:
          AmountFirestoreModel.fromJson(json['amount'] as Map<String, dynamic>),
      eatenAt: timestampToDateNotNull(json['eatenAt'] as Timestamp),
      createdAt: timestampToDate(json['createdAt'] as Timestamp?),
      updatedAt: timestampToDate(json['updatedAt'] as Timestamp?),
      deletedAt: timestampToDate(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$MealFirestoreModelToJson(_MealFirestoreModel instance) =>
    <String, dynamic>{
      'edibleId': instance.edibleId,
      'amount': instance.amount.toJson(),
      'eatenAt': dateToTimestamp(instance.eatenAt),
    };
