// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/_common/annotations/create_only.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_created_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_touched_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/annotations/firestore_updated_at.dart';
import 'package:kcalculus/data/storage/firestore/_common/utils/timestamp_utils.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/ingredient_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_preview_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_ratio_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/json_fields/json_fields.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

part 'edible_firestore_model.freezed.dart';
part 'edible_firestore_model.g.dart';
part 'edible_firestore_model.jfields.dart';
part 'edible_firestore_model.jflav.dart';

class EdibleActionEat extends StorageAction {
  const EdibleActionEat();
}

@freezed
@JsonFlavourful<StorageAction>()
@JsonFields()
sealed class EdibleFirestoreModel with _$EdibleFirestoreModel {
  static const kCollection = 'edibles';

  const EdibleFirestoreModel._();

  const factory EdibleFirestoreModel.$default({
    @JsonKey(
      includeToJson: false,
    )
    String? id,

    @CreateOnly() required EdibleType type,

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

    @CreateOnly() required String ownerId,

    NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,

    List<NutritionFactsFirestoreModel>? nutritionFacts,

    Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,

    List<IngredientFirestoreModel>? ingredients,

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
    DateTime? eatenAt,

    @JsonKey(
      fromJson: timestampToDate,
      toJson: dateToTimestamp,
    )
    @FirestoreTouchedAt()
    DateTime? touchedAt,

    @JsonKey(
      fromJson: timestampToDate,
      toJson: dateToTimestamp,
    )
    @CreateOnly.overrideValue(null)
    DateTime? deletedAt,

    @CreateOnly.overrideValue(false) bool? deleted,
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
    DateTime? deletedAt,
  }) => EdibleFirestoreModel.$default(
    id: id,
    type: type,
    name: name,
    nameLower: name.toLowerCase(),
    description: description,
    descriptionLower: description.toLowerCase(),
    ownerId: ownerId,
    nutritionFactsPreview: nutritionFactsPreview,
    nutritionFacts: nutritionFacts,
    nutritionRatios: nutritionRatios,
    ingredients: ingredients,
    createdAt: createdAt,
    updatedAt: updatedAt ?? createdAt,
    eatenAt: eatenAt,
    touchedAt: dt.max([createdAt, updatedAt, eatenAt]),
    deletedAt: deletedAt,
    deleted: deletedAt != null,
  );

  factory EdibleFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleFirestoreModelFromJson(json);

  factory EdibleFirestoreModel.fromDomain(
    Edible model,
    String ownerId,
  ) => switch (model) {
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
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      eatenAt: model.lastEatenAt,
      deletedAt: model.deletedAt,
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
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      eatenAt: model.lastEatenAt,
      deletedAt: model.deletedAt,
    );
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
      lastEatenAt: eatenAt,
      deletedAt: deletedAt,
    );
  }

  Dish? toDish(Map<String, Edible> edibles) {
    if (type != EdibleType.dish) {
      return null;
    }

    return Dish(
      id: id,
      name: name,
      description: description,
      ingredients: ingredients!
          .map(
            (i) => Ingredient(
              edible: edibles[i.edibleId]!,
              amount: i.amount.toDomain(),
            ),
          )
          .toList(),
      nutritionRatios: {
        for (final e in nutritionRatios!.entries) e.key: e.value.toDomain(),
      },
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastEatenAt: eatenAt,
      deletedAt: deletedAt,
    );
  }
}
