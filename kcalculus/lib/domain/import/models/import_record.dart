import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/import/models/import_report.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';
import 'package:kcalculus/domain/import/models/import_state_record.dart';

part 'import_record.freezed.dart';
part 'import_record.g.dart';

@freezed
sealed class ImportRecord with _$ImportRecord {
  const ImportRecord._();

  const factory ImportRecord.$default({
    required String deviceId,
    required List<ImportStateRecord> states,
    ImportReport? report,
  }) = _ImportRecord;

  factory ImportRecord({
    required String deviceId,
    required List<ImportStateRecord> states,
    ImportReport? report,
  }) => ImportRecord.$default(
    deviceId: deviceId,
    states: states.toList()..sort((a, b) => a.at.compareTo(b.at)),
    report: report,
  );

  factory ImportRecord.fromJson(Map<String, dynamic> json) =>
      _$ImportRecordFromJson(json);

  ImportState? get currentState => states.lastOrNull?.state;

  bool get resolved => currentState?.resolved == true;
}
