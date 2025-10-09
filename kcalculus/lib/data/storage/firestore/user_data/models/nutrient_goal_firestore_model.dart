// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';

part 'nutrient_goal_firestore_model.freezed.dart';
part 'nutrient_goal_firestore_model.g.dart';

@freezed
sealed class NutrientGoalFirestoreModel with _$NutrientGoalFirestoreModel {
  static const kCollection = 'nutrientGoals';

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
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? createdAt,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? deletedAt,
  }) = _NutrientGoalFirestoreModel;

  factory NutrientGoalFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalFirestoreModelFromJson(json);

  factory NutrientGoalFirestoreModel.fromDomain(
    NutrientGoal model,
  ) =>
      NutrientGoalFirestoreModel(
        id: model.id,
        nutrient: model.nutrient.name,
        unit: model.amount.unit.name,
        value: model.amount.value,
      );

  NutrientGoal toDomain() => NutrientGoal(
        id: id,
        nutrient: Nutrient.of(nutrient),
        amount: Amount(
          unit: Unit.of(unit),
          value: value,
        ),
      );
}
