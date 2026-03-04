import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_lock_firestore_model.freezed.dart';
part 'import_lock_firestore_model.g.dart';

@freezed
sealed class ImportLockFirestoreModel with _$ImportLockFirestoreModel {
  static const kDocumentId = '_lock_';

  const factory ImportLockFirestoreModel({
    required String deviceId,
  }) = _ImportLockFirestoreModel;

  factory ImportLockFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$ImportLockFirestoreModelFromJson(json);
}
