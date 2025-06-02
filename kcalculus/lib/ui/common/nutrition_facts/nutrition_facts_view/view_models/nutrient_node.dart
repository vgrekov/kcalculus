import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

part 'nutrient_node.freezed.dart';

@freezed
class NutrientNode with _$NutrientNode {
  const factory NutrientNode({
    required Nutrient nutrient,
    required Amount amount,
    @Default(0) int level,
  }) = _NutrientNode;
}
