// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportRecord _$ImportRecordFromJson(Map<String, dynamic> json) =>
    _ImportRecord(
      state: $enumDecode(_$ImportStateEnumMap, json['state']),
      report: json['report'] == null
          ? null
          : ImportReport.fromJson(json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImportRecordToJson(_ImportRecord instance) =>
    <String, dynamic>{
      'state': _$ImportStateEnumMap[instance.state]!,
      'report': instance.report?.toJson(),
    };

const _$ImportStateEnumMap = {
  ImportState.booked: 'booked',
  ImportState.declined: 'declined',
  ImportState.inProgress: 'inProgress',
  ImportState.succeeded: 'succeeded',
  ImportState.failed: 'failed',
  ImportState.acknowledged: 'acknowledged',
  ImportState.reverted: 'reverted',
  ImportState.ignored: 'ignored',
};
