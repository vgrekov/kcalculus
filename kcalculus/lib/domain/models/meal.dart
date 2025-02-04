import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition/portion.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
class Meal with _$Meal, Portion {
  @With<Portion>()
  const factory Meal({
    String? id,
    required Edible edible,
    required Amount amount,
    required DateTime eatenAt,
  }) = _Meal;
}
