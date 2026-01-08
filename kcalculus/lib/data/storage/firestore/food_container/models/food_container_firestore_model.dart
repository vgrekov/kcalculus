// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/annotations/create_only.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_created_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_updated_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/utils/json_fields/json_fields.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

part 'food_container_firestore_model.freezed.dart';
part 'food_container_firestore_model.g.dart';
part 'food_container_firestore_model.jfields.dart';
part 'food_container_firestore_model.jflav.dart';

@freezed
@JsonFlavourful<StorageAction>()
@JsonFields()
sealed class FoodContainerFirestoreModel with _$FoodContainerFirestoreModel {
  static const kCollection = 'foodContainers';

  const FoodContainerFirestoreModel._();

  const factory FoodContainerFirestoreModel.$default({
    @JsonKey(
      includeToJson: false,
    )
    String? id,

    required String name,

    @JsonKey(
      name: 'name_lower',
    )
    required String nameLower,

    required String description,

    @JsonKey(
      name: 'description_lower',
    )
    required String descriptionLower,

    required AmountFirestoreModel weight,

    required String ownerId,

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
    @CreateOnly.override(null)
    DateTime? deletedAt,

    @CreateOnly.override(false) bool? deleted,
  }) = _FoodContainerFirestoreModel;

  factory FoodContainerFirestoreModel({
    String? id,
    required String name,
    required String description,
    required AmountFirestoreModel weight,
    required String ownerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) => FoodContainerFirestoreModel.$default(
    id: id,
    name: name,
    nameLower: name.toLowerCase(),
    description: description,
    descriptionLower: description.toLowerCase(),
    weight: weight,
    ownerId: ownerId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
    deleted: deletedAt != null,
  );

  factory FoodContainerFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$FoodContainerFirestoreModelFromJson(json);

  factory FoodContainerFirestoreModel.fromDomain(
    FoodContainer model,
    String ownerId,
  ) => FoodContainerFirestoreModel(
    id: model.id,
    name: model.name,
    description: model.description,
    weight: AmountFirestoreModel.fromDomain(model.weight),
    ownerId: ownerId,
    createdAt: model.createdAt,
    updatedAt: model.updatedAt,
    deletedAt: model.deletedAt,
  );

  FoodContainer toDomain([bool isRecent = false]) => FoodContainer(
    id: id,
    name: name,
    description: description,
    weight: weight.toDomain(),
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
    isRecent: isRecent,
  );
}
