// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserFirestoreModel _$UserFirestoreModelFromJson(Map<String, dynamic> json) =>
    _UserFirestoreModel(
      id: json['id'] as String,
      settings: json['settings'] == null
          ? null
          : AppSettingsFirestoreModel.fromJson(
              json['settings'] as Map<String, dynamic>),
      createdAt: timestampToDate(json['createdAt'] as Timestamp?),
      updatedAt: timestampToDate(json['updatedAt'] as Timestamp?),
      deletedAt: timestampToDate(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$UserFirestoreModelToJson(_UserFirestoreModel instance) =>
    <String, dynamic>{
      'settings': instance.settings?.toJson(),
    };
