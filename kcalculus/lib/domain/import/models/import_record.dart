import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/import/models/import_report.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';

part 'import_record.freezed.dart';
part 'import_record.g.dart';

@freezed
sealed class ImportRecord with _$ImportRecord {
  const ImportRecord._();

  const factory ImportRecord({
    required ImportState state,
    ImportReport? report,
  }) = _ImportRecord;

  factory ImportRecord.fromJson(Map<String, dynamic> json) =>
      _$ImportRecordFromJson(json);

  bool get resolved => state.resolved;

  ImportRecord transitionTo(ImportState newState) {
    if (!state.canTransitionTo(newState)) {
      throw ArgumentError(
        'Unable to transition from "${state.name}" to "${newState.name}".',
        'newState',
      );
    }

    return copyWith(state: newState);
  }
}
