import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';

part 'ingredient_firestore_model.freezed.dart';
part 'ingredient_firestore_model.g.dart';

@freezed
sealed class IngredientFirestoreModel with _$IngredientFirestoreModel {
  const factory IngredientFirestoreModel({
    required String edibleId,
    required AmountFirestoreModel amount,
  }) = _IngredientFirestoreModel;

  factory IngredientFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientFirestoreModelFromJson(json);

  factory IngredientFirestoreModel.fromDomain(Ingredient model) =>
      IngredientFirestoreModel(
        edibleId: model.edible.id!,
        amount: AmountFirestoreModel.fromDomain(model.amount),
      );
}
