// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/annotations/create_only.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_created_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_updated_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/app_settings_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/search_config_firestore_model.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

part 'user_data_firestore_model.freezed.dart';
part 'user_data_firestore_model.g.dart';
part 'user_data_firestore_model.jfields.dart';
part 'user_data_firestore_model.jflav.dart';

@freezed
@JsonFlavourful<StorageAction>()
@JsonFields()
sealed class UserDataFirestoreModel with _$UserDataFirestoreModel {
  static const kCollection = 'users';

  const UserDataFirestoreModel._();

  const factory UserDataFirestoreModel({
    @JsonKey(
      includeToJson: false,
    )
    required String id,

    AppSettingsFirestoreModel? settings,

    List<String>? defaultNutrients,

    @JsonKey(
      includeToJson: false,
    )
    SearchConfigFirestoreModel? searchConfig,

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

    @JsonKey(
      fromJson: timestampToDate,
      toJson: dateToTimestamp,
    )
    @CreateOnly.overrideValue(null)
    DateTime? deletedAt,
  }) = _UserDataFirestoreModel;

  factory UserDataFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataFirestoreModelFromJson(json);
}
