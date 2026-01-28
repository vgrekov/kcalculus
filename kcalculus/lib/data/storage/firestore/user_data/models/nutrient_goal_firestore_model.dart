// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/annotations/create_only.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_created_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

part 'nutrient_goal_firestore_model.freezed.dart';
part 'nutrient_goal_firestore_model.g.dart';
part 'nutrient_goal_firestore_model.jfields.dart';
part 'nutrient_goal_firestore_model.jflav.dart';

@freezed
@JsonFlavourful<StorageAction>()
@JsonFields()
sealed class NutrientGoalFirestoreModel with _$NutrientGoalFirestoreModel {
  static const kCollection = 'nutrientGoals';

  static final kMaxDate = Timestamp.fromDate(DateTime(9999, 12, 31));

  static Object? _maxDateProvider() => kMaxDate;

  const NutrientGoalFirestoreModel._();

  const factory NutrientGoalFirestoreModel({
    @JsonKey(
      includeToJson: false,
    )
    String? id,

    required String nutrient,

    required String unit,

    required double value,

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
    @CreateOnly.override(NutrientGoalFirestoreModel._maxDateProvider)
    DateTime? deletedAt,
  }) = _NutrientGoalFirestoreModel;

  factory NutrientGoalFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalFirestoreModelFromJson(json);

  factory NutrientGoalFirestoreModel.fromDomain(
    NutrientGoal model,
  ) => NutrientGoalFirestoreModel(
    id: model.id,
    nutrient: model.nutrient.name,
    unit: model.amount.unit.name,
    value: model.amount.value,
    createdAt: model.createdAt,
    deletedAt: model.deletedAt,
  );

  NutrientGoal toDomain() => NutrientGoal(
    id: id,
    nutrient: Nutrient.of(nutrient),
    amount: Amount(
      unit: Unit.of(unit),
      value: value,
    ),
    createdAt: createdAt,
    deletedAt: deletedAt,
  );
}
