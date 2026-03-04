// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_container_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodContainerFirestoreModel _$FoodContainerFirestoreModelFromJson(
  Map<String, dynamic> json,
) => _FoodContainerFirestoreModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  nameLower: json['name_lower'] as String,
  description: json['description'] as String,
  descriptionLower: json['description_lower'] as String,
  weight: AmountFirestoreModel.fromJson(json['weight'] as Map<String, dynamic>),
  ownerId: json['ownerId'] as String,
  createdAt: timestampToDate(json['createdAt']),
  updatedAt: timestampToDate(json['updatedAt']),
  deletedAt: timestampToDate(json['deletedAt']),
  deleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$FoodContainerFirestoreModelToJson(
  _FoodContainerFirestoreModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'name_lower': instance.nameLower,
  'description': instance.description,
  'description_lower': instance.descriptionLower,
  'weight': instance.weight.toJson(),
  'ownerId': instance.ownerId,
  'createdAt': dateToTimestamp(instance.createdAt),
  'updatedAt': dateToTimestamp(instance.updatedAt),
  'deletedAt': dateToTimestamp(instance.deletedAt),
  'deleted': instance.deleted,
};
