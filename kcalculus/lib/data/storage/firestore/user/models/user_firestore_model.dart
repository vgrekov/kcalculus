// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/user/models/app_settings_firestore_model.dart';

part 'user_firestore_model.freezed.dart';
part 'user_firestore_model.g.dart';

@freezed
sealed class UserFirestoreModel with _$UserFirestoreModel {
  static const kCollection = 'users';

  const UserFirestoreModel._();

  const factory UserFirestoreModel({
    @JsonKey(
      includeToJson: false,
    )
    required String id,
    AppSettingsFirestoreModel? settings,
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
  }) = _UserFirestoreModel;

  factory UserFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserFirestoreModelFromJson(json);
}
