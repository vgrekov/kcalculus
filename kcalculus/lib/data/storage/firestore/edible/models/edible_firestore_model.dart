// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/ingredient_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_preview_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_ratio_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/food/models/food.dart';

part 'edible_firestore_model.freezed.dart';
part 'edible_firestore_model.g.dart';

@freezed
sealed class EdibleFirestoreModel with _$EdibleFirestoreModel {
  static const kCollection = 'edibles';

  const EdibleFirestoreModel._();

  const factory EdibleFirestoreModel._default({
    @JsonKey(
      includeToJson: false,
    )
    String? id,
    required EdibleType type,
    required String name,
    required String name_lower,
    required String description,
    required String description_lower,
    required String ownerId,
    NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
    List<NutritionFactsFirestoreModel>? nutritionFacts,
    Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,
    List<IngredientFirestoreModel>? ingredients,
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
  }) = _EdibleFirestoreModel;

  factory EdibleFirestoreModel({
    String? id,
    required EdibleType type,
    required String name,
    required String description,
    required String ownerId,
    NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
    List<NutritionFactsFirestoreModel>? nutritionFacts,
    Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,
    List<IngredientFirestoreModel>? ingredients,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? eatenAt,
    DateTime? touchedAt,
    DateTime? deletedAt,
  }) =>
      EdibleFirestoreModel._default(
        id: id,
        type: type,
        name: name,
        name_lower: name.toLowerCase(),
        description: description,
        description_lower: description.toLowerCase(),
        ownerId: ownerId,
        nutritionFactsPreview: nutritionFactsPreview,
        nutritionFacts: nutritionFacts,
        nutritionRatios: nutritionRatios,
        ingredients: ingredients,
        createdAt: createdAt,
        updatedAt: updatedAt,
        eatenAt: eatenAt,
        touchedAt: touchedAt,
        deletedAt: deletedAt,
      );

  factory EdibleFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleFirestoreModelFromJson(json);

  factory EdibleFirestoreModel.fromDomain(
    Edible model,
    String ownerId,
  ) =>
      switch (model) {
        Food food => EdibleFirestoreModel.fromDomainFood(
            food,
            ownerId,
          ),
        Dish dish => EdibleFirestoreModel.fromDomainDish(
            dish,
            ownerId,
          ),
        _ => throw ArgumentError(
            'Unsupported edible type: ${model.runtimeType}',
          ),
      };

  factory EdibleFirestoreModel.fromDomainFood(
    Food model,
    String ownerId,
  ) {
    final nutritionFacts = model.getNutritionFacts();
    final nutritionFactsPreview = nutritionFacts.firstOrNull?.getPreview();

    return EdibleFirestoreModel(
      id: model.id,
      type: EdibleType.food,
      name: model.name,
      description: model.description,
      ownerId: ownerId,
      nutritionFactsPreview: nutritionFactsPreview == null
          ? null
          : NutritionFactsPreviewFirestoreModel.fromDomain(
              nutritionFactsPreview,
            ),
      nutritionFacts: nutritionFacts
          .map(
            NutritionFactsFirestoreModel.fromDomain,
          )
          .toList(),
    );
  }

  factory EdibleFirestoreModel.fromDomainDish(
    Dish model,
    String ownerId,
  ) {
    final nutritionFacts = model.getNutritionFacts();
    final nutritionFactsPreview = nutritionFacts.firstOrNull?.getPreview();

    return EdibleFirestoreModel(
      id: model.id,
      type: EdibleType.dish,
      name: model.name,
      description: model.description,
      ownerId: ownerId,
      nutritionFactsPreview: nutritionFactsPreview == null
          ? null
          : NutritionFactsPreviewFirestoreModel.fromDomain(
              nutritionFactsPreview,
            ),
      nutritionRatios: {
        for (final entry in model.nutritionRatios.entries)
          entry.key: NutritionRatioFirestoreModel.fromDomain(entry.value),
      },
      ingredients: model.ingredients
          .map(
            IngredientFirestoreModel.fromDomain,
          )
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = _$EdibleFirestoreModelToJson(this as _EdibleFirestoreModel);

    json['name_lower'] = name.toLowerCase();
    json['description_lower'] = description.toLowerCase();

    return json;
  }

  Food? toFood() {
    if (type != EdibleType.food) {
      return null;
    }

    return Food(
      id: id,
      name: name,
      description: description,
      nutritionFacts: nutritionFacts!
          .map(
            (nf) => nf.toDomain(),
          )
          .toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
