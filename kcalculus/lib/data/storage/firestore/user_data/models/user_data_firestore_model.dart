// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/app_settings_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/search_config_firestore_model.dart';

part 'user_data_firestore_model.freezed.dart';
part 'user_data_firestore_model.g.dart';

@freezed
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
    SearchConfigFirestoreModel? searchConfig,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? createdAt,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? updatedAt,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? deletedAt,
  }) = _UserDataFirestoreModel;

  factory UserDataFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataFirestoreModelFromJson(json);
}
