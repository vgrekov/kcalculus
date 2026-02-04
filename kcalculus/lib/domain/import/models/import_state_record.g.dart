// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_state_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportStateRecord _$ImportStateRecordFromJson(Map<String, dynamic> json) =>
    _ImportStateRecord(
      state: $enumDecode(_$ImportStateEnumMap, json['state']),
      at: DateTime.parse(json['at'] as String),
    );

Map<String, dynamic> _$ImportStateRecordToJson(_ImportStateRecord instance) =>
    <String, dynamic>{
      'state': _$ImportStateEnumMap[instance.state]!,
      'at': instance.at.toIso8601String(),
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
