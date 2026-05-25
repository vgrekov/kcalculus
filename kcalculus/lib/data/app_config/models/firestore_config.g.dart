// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirestoreConfig _$FirestoreConfigFromJson(Map<String, dynamic> json) =>
    _FirestoreConfig(
      deleteBatchSize:
          (json['deleteBatchSize'] as num?)?.toInt() ?? kDefaultDeleteBatchSize,
      importBatchSize:
          (json['importBatchSize'] as num?)?.toInt() ?? kDefaultImportBatchSize,
    );

Map<String, dynamic> _$FirestoreConfigToJson(_FirestoreConfig instance) =>
    <String, dynamic>{
      'deleteBatchSize': instance.deleteBatchSize,
      'importBatchSize': instance.importBatchSize,
    };
