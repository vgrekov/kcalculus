import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';

part 'import_state_record.freezed.dart';
part 'import_state_record.g.dart';

@freezed
sealed class ImportStateRecord with _$ImportStateRecord {
  const factory ImportStateRecord({
    required ImportState state,
    required DateTime at,
  }) = _ImportStateRecord;

  factory ImportStateRecord.fromJson(Map<String, dynamic> json) =>
      _$ImportStateRecordFromJson(json);
}
