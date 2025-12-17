// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

import 'created_at.dart';

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

JsonDecision idGenerator(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.create => JsonDecision.include(actual ?? kGeneratedId),
  _ => JsonDecision.include(actual),
};

JsonDecision serverTimestamp(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.create ||
  Action.update => const JsonDecision.include(kServerTimestamp),
  _ => JsonDecision.exclude(),
};

JsonDecision deletedAtTimestamp(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.create => const JsonDecision.include(null),
  Action.delete => const JsonDecision.include(kServerTimestamp),
  _ => JsonDecision.exclude(),
};

JsonDecision deletedFlag(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.create => const JsonDecision.include(false),
  Action.delete => const JsonDecision.include(true),
  _ => JsonDecision.exclude(),
};

JsonDecision nonNull(
  Action action,
  dynamic actual,
) => switch (action) {
  Action.create || Action.update =>
    actual != null ? JsonDecision.include(actual) : JsonDecision.exclude(),
  _ => JsonDecision.exclude(),
};

@Freezed()
@JsonFlavourful<Action>()
sealed class TestModel with _$TestModel {
  const factory TestModel({
    @JsonFlavoured(
      idGenerator,
    )
    String? id,
    required String name,
    @JsonFlavoured(
      nonNull,
    )
    String? description,
    @JsonKey(
      name: 'created_at',
    )
    @CreatedAt()
    DateTime? createdAt,
    @JsonFlavoured(
      serverTimestamp,
    )
    DateTime? updatedAt,
    @JsonFlavoured(
      deletedAtTimestamp,
    )
    DateTime? deletedAt,
    @JsonFlavoured(
      deletedFlag,
    )
    bool? deleted,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
