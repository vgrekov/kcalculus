import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

part 'nutrient_amount.freezed.dart';
part 'nutrient_amount.g.dart';

@freezed
sealed class NutrientAmount with _$NutrientAmount {
  const NutrientAmount._();

  const factory NutrientAmount({
    required Nutrient nutrient,
    required Amount amount,
  }) = _NutrientAmount;

  factory NutrientAmount.fromJson(Map<String, dynamic> json) =>
      _$NutrientAmountFromJson(json);

  NutrientAmount operator +(NutrientAmount other) {
    if (nutrient != other.nutrient) {
      throw 'Operands must be of the same nutrient.';
    }

    return NutrientAmount(
      nutrient: nutrient,
      amount: (amount + other.amount).convert(nutrient.defaultUnit),
    );
  }

  NutrientAmount operator *(double factor) {
    if (factor == 1) return this;

    return NutrientAmount(
      nutrient: nutrient,
      amount: amount * factor,
    );
  }
}
