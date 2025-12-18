// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

import 'annotations/created_at.dart';
import 'annotations/deleted_at.dart';
import 'annotations/deleted_flag.dart';
import 'annotations/id.dart';
import 'annotations/non_null.dart';
import 'annotations/updated_at.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';
part 'test_model.jflav.dart';

const kGeneratedId = 'generated-model-id';

const kServerTimestamp = 'serverTimestamp';

@Freezed()
@JsonFlavourful<StorageAction>()
sealed class TestModel with _$TestModel {
  const factory TestModel({
    @Id(kGeneratedId) String? id,

    required String name,

    @NonNull() String? description,

    @JsonKey(
      name: 'created_at',
    )
    @CreatedAt(kServerTimestamp)
    DateTime? createdAt,

    @UpdatedAt(kServerTimestamp) DateTime? updatedAt,

    @DeletedAt() DateTime? deletedAt,

    @DeletedFlag() bool? deleted,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
