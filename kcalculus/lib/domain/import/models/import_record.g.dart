// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportRecord _$ImportRecordFromJson(Map<String, dynamic> json) =>
    _ImportRecord(
      deviceId: json['deviceId'] as String,
      states: (json['states'] as List<dynamic>)
          .map((e) => ImportStateRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      report: json['report'] == null
          ? null
          : ImportReport.fromJson(json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImportRecordToJson(_ImportRecord instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'states': instance.states.map((e) => e.toJson()).toList(),
      'report': instance.report?.toJson(),
    };
