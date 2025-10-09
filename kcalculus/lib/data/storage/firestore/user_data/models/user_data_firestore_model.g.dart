// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDataFirestoreModel _$UserDataFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _UserDataFirestoreModel(
      id: json['id'] as String,
      settings: json['settings'] == null
          ? null
          : AppSettingsFirestoreModel.fromJson(
              json['settings'] as Map<String, dynamic>),
      defaultNutrients: (json['defaultNutrients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: timestampToDate(json['createdAt']),
      updatedAt: timestampToDate(json['updatedAt']),
      deletedAt: timestampToDate(json['deletedAt']),
    );

Map<String, dynamic> _$UserDataFirestoreModelToJson(
        _UserDataFirestoreModel instance) =>
    <String, dynamic>{
      'settings': instance.settings?.toJson(),
      'defaultNutrients': instance.defaultNutrients,
    };
