// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

part 'meal_firestore_model.freezed.dart';
part 'meal_firestore_model.g.dart';

@freezed
sealed class MealFirestoreModel with _$MealFirestoreModel {
  static String collection(String userId) => 'users/$userId/meals';

  const MealFirestoreModel._();

  const factory MealFirestoreModel({
    @JsonKey(
      includeToJson: false,
    )
    String? id,
    required String edibleId,
    required AmountFirestoreModel amount,
    @JsonKey(
      fromJson: timestampToDateNotNull,
      toJson: dateToTimestamp,
    )
    required DateTime eatenAt,
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
  }) = _MealFirestoreModel;

  factory MealFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$MealFirestoreModelFromJson(json);

  factory MealFirestoreModel.fromDomain(Meal model) => MealFirestoreModel(
        id: model.id,
        edibleId: model.edible.id!,
        amount: AmountFirestoreModel.fromDomain(model.amount),
        eatenAt: model.eatenAt,
      );

  Meal toDomain(Edible edible) => Meal(
        id: id,
        edible: edible,
        amount: amount.toDomain(),
        eatenAt: eatenAt,
      );
}
