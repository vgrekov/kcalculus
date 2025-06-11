import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition/portion.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
sealed class Ingredient with _$Ingredient, Portion {
  const Ingredient._();

  @With<Portion>()
  const factory Ingredient({
    required Edible edible,
    required Amount amount,
  }) = _Ingredient;
}
