// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_preview_firestore_model.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';

part 'edible_search_result_firestore_model.freezed.dart';
part 'edible_search_result_firestore_model.g.dart';

@freezed
sealed class EdibleSearchResultFirestoreModel
    with _$EdibleSearchResultFirestoreModel {
  const EdibleSearchResultFirestoreModel._();

  const factory EdibleSearchResultFirestoreModel({
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
  }) = _EdibleSearchResultFirestoreModel;

  factory EdibleSearchResultFirestoreModel.fromJson(
          Map<String, dynamic> json) =>
      _$EdibleSearchResultFirestoreModelFromJson(json);

  factory EdibleSearchResultFirestoreModel.fromDomain(
    EdibleSearchResult model,
    String ownerId,
  ) =>
      EdibleSearchResultFirestoreModel(
        id: model.id,
        type: switch (model.type) {
          EdibleSearchResultType.dish => EdibleType.dish,
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
      );

  EdibleSearchResult toDomain() => EdibleSearchResult(
        id: id,
        name: name,
        description: description,
        type: switch (type) {
          EdibleType.food => EdibleSearchResultType.food,
          EdibleType.dish => EdibleSearchResultType.dish,
        },
        nutritionFactsPreview: nutritionFactsPreview?.toDomain(),
        lastEatenAt: eatenAt,
        touchedAt: touchedAt,
      );
}
