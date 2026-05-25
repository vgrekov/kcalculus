// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_created_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_updated_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/import/models/import_record.dart';
import 'package:kcalculus/domain/import/models/import_report.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

part 'import_record_firestore_model.freezed.dart';
part 'import_record_firestore_model.g.dart';
part 'import_record_firestore_model.jfields.dart';
part 'import_record_firestore_model.jflav.dart';

@freezed
@JsonFields()
@JsonFlavourful<StorageAction>()
sealed class ImportRecordFirestoreModel with _$ImportRecordFirestoreModel {
  static const kCollection = 'imports';

  const ImportRecordFirestoreModel._();

  const factory ImportRecordFirestoreModel({
    required ImportState state,

    ImportReport? report,

    @JsonKey(
      fromJson: timestampToDate,
      toJson: dateToTimestamp,
    )
    @FirestoreCreatedAt()
    DateTime? createdAt,

    @JsonKey(
      fromJson: timestampToDate,
      toJson: dateToTimestamp,
    )
    @FirestoreUpdatedAt()
    DateTime? updatedAt,
  }) = _ImportRecordFirestoreModel;

  factory ImportRecordFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$ImportRecordFirestoreModelFromJson(json);

  factory ImportRecordFirestoreModel.fromDomain(ImportRecord model) =>
      ImportRecordFirestoreModel(
        state: model.state,
        report: model.report,
      );

  ImportRecord toDomain() => ImportRecord(
    state: state,
    report: report,
  );
}
