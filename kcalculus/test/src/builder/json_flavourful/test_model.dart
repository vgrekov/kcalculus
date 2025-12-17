// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/utils/json_flavourful/annotations/json_flavoured.dart';
import 'package:kcalculus/utils/json_flavourful/annotations/json_flavourful.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';
part 'test_model.jflav.dart';

enum Action {
  create,
  update,
  delete,
}

const kGeneratedId = 'generated-model-id';
const kServerTimestamp = 'serverTimestamp';

dynamic idGenerator(
  Action action,
  dynamic actual,
) => actual ?? kGeneratedId;

dynamic serverTimestamp(
  Action action,
  dynamic actual,
) => kServerTimestamp;

dynamic deletedAtTimestamp(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.delete => kServerTimestamp,
  _ => null,
};

dynamic deletedFlag(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.create => false,
  _ => true,
};

bool nonNull(
  Action action,
  dynamic actual,
) => actual != null;

@Freezed()
@JsonFlavourful<Action>()
sealed class TestModel with _$TestModel {
  const factory TestModel({
    @JsonFlavoured(
      {
        Action.create,
      },
      value: idGenerator,
      exclusive: false,
    )
    String? id,
    required String name,
    @JsonFlavoured(
      {
        Action.create,
        Action.update,
      },
      filter: nonNull,
    )
    String? description,
    @JsonKey(name: 'created_at')
    @JsonFlavoured(
      {
        Action.create,
      },
      value: serverTimestamp,
    )
    DateTime? createdAt,
    @JsonFlavoured(
      {
        Action.create,
        Action.update,
      },
      value: serverTimestamp,
    )
    DateTime? updatedAt,
    @JsonFlavoured(
      {
        Action.create,
        Action.delete,
      },
      value: deletedAtTimestamp,
    )
    DateTime? deletedAt,
    @JsonFlavoured(
      {
        Action.create,
        Action.delete,
      },
      value: deletedFlag,
    )
    bool? deleted,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
