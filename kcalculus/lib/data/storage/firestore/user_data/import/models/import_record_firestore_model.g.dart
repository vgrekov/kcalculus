// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_record_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportRecordFirestoreModel _$ImportRecordFirestoreModelFromJson(
  Map<String, dynamic> json,
) => _ImportRecordFirestoreModel(
  state: $enumDecode(_$ImportStateEnumMap, json['state']),
  report: json['report'] == null
      ? null
      : ImportReport.fromJson(json['report'] as Map<String, dynamic>),
  createdAt: timestampToDate(json['createdAt']),
  updatedAt: timestampToDate(json['updatedAt']),
);

Map<String, dynamic> _$ImportRecordFirestoreModelToJson(
  _ImportRecordFirestoreModel instance,
) => <String, dynamic>{
  'state': _$ImportStateEnumMap[instance.state]!,
  'report': instance.report?.toJson(),
  'createdAt': dateToTimestamp(instance.createdAt),
  'updatedAt': dateToTimestamp(instance.updatedAt),
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
