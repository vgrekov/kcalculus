// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_preview_firestore_model.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';

part 'edible_preview_firestore_model.freezed.dart';
part 'edible_preview_firestore_model.g.dart';

@freezed
sealed class EdiblePreviewFirestoreModel with _$EdiblePreviewFirestoreModel {
  const EdiblePreviewFirestoreModel._();

  const factory EdiblePreviewFirestoreModel({
    @JsonKey(
      includeToJson: false,
    )
    required String id,
    required EdibleType type,
    required String name,
    required String description,
    required String ownerId,
    NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? eatenAt,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? touchedAt,
    @JsonKey(
      includeToJson: false,
      fromJson: timestampToDate,
    )
    DateTime? deletedAt,
  }) = _EdiblePreviewFirestoreModel;

  factory EdiblePreviewFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$EdiblePreviewFirestoreModelFromJson(json);

  factory EdiblePreviewFirestoreModel.fromDomain(
    EdiblePreview model,
    String ownerId,
  ) =>
      EdiblePreviewFirestoreModel(
        id: model.id,
        type: switch (model.type) {
          EdiblePreviewType.dish => EdibleType.dish,
          _ => EdibleType.food,
        },
        name: model.name,
        description: model.description,
        ownerId: ownerId,
        nutritionFactsPreview: model.nutritionFactsPreview == null
            ? null
            : NutritionFactsPreviewFirestoreModel.fromDomain(
                model.nutritionFactsPreview!,
              ),
        eatenAt: model.lastEatenAt,
        touchedAt: model.touchedAt,
        deletedAt: model.deletedAt,
      );

  EdiblePreview toDomain([bool isRecent = false]) => EdiblePreview(
        id: id,
        name: name,
        description: description,
        type: switch (type) {
          EdibleType.food => EdiblePreviewType.food,
          EdibleType.dish => EdiblePreviewType.dish,
        },
        nutritionFactsPreview: nutritionFactsPreview?.toDomain(),
        lastEatenAt: eatenAt,
        touchedAt: touchedAt,
        deletedAt: deletedAt,
        isRecent: isRecent,
      );
}
