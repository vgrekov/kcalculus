// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';

part 'food_container_firestore_model.freezed.dart';
part 'food_container_firestore_model.g.dart';

@freezed
sealed class FoodContainerFirestoreModel with _$FoodContainerFirestoreModel {
  static const kCollection = 'foodContainers';

  const FoodContainerFirestoreModel._();

  const factory FoodContainerFirestoreModel({
    @JsonKey(
      includeToJson: false,
    )
    String? id,
    required String name,
    required String description,
    required AmountFirestoreModel weight,
    required String ownerId,
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
  }) = _FoodContainerFirestoreModel;

  factory FoodContainerFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$FoodContainerFirestoreModelFromJson(json);

  factory FoodContainerFirestoreModel.fromDomain(
    FoodContainer model,
    String ownerId,
  ) =>
      FoodContainerFirestoreModel(
        id: model.id,
        name: model.name,
        description: model.description,
        weight: AmountFirestoreModel.fromDomain(model.weight),
        ownerId: ownerId,
      );

  FoodContainer toDomain() => FoodContainer(
        id: id,
        name: name,
        description: description,
        weight: weight.toDomain(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
