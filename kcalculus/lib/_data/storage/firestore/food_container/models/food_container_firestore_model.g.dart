// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_container_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodContainerFirestoreModel _$FoodContainerFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _FoodContainerFirestoreModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      weight:
          AmountFirestoreModel.fromJson(json['weight'] as Map<String, dynamic>),
      ownerId: json['ownerId'] as String,
      createdAt: timestampToDate(json['createdAt'] as Timestamp?),
      updatedAt: timestampToDate(json['updatedAt'] as Timestamp?),
      deletedAt: timestampToDate(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$FoodContainerFirestoreModelToJson(
        _FoodContainerFirestoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'weight': instance.weight.toJson(),
      'ownerId': instance.ownerId,
    };
