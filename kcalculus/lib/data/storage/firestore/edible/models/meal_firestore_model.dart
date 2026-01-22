// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/annotations/create_only.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_created_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_updated_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

part 'meal_firestore_model.freezed.dart';
part 'meal_firestore_model.g.dart';
part 'meal_firestore_model.jfields.dart';
part 'meal_firestore_model.jflav.dart';

@freezed
@JsonFlavourful<StorageAction>()
@JsonFields()
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
  }) = _MealFirestoreModel;

  factory MealFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$MealFirestoreModelFromJson(json);

  factory MealFirestoreModel.fromDomain(Meal model) => MealFirestoreModel(
    id: model.id,
    edibleId: model.edible.id!,
    amount: AmountFirestoreModel.fromDomain(model.amount),
    eatenAt: model.eatenAt,
    createdAt: model.createdAt,
    updatedAt: model.updatedAt ?? model.createdAt,
    deletedAt: model.deletedAt,
  );

  Meal toDomain(Edible edible) => Meal(
    id: id,
    edible: edible,
    amount: amount.toDomain(),
    eatenAt: eatenAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}
