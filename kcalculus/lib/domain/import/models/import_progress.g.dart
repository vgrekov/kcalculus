// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportProgress _$ImportProgressFromJson(Map<String, dynamic> json) =>
    _ImportProgress(
      imported: (json['imported'] as num).toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImportProgressToJson(_ImportProgress instance) =>
    <String, dynamic>{'imported': instance.imported, 'total': instance.total};
