import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

part 'nutrient_node.freezed.dart';

@freezed
sealed class NutrientNode with _$NutrientNode {
  const factory NutrientNode({
    required Nutrient nutrient,
    required Amount amount,
    @Default(0) int level,
  }) = _NutrientNode;
}
