import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/edible/models/portion.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
abstract class Meal with _$Meal, Portion {
  const Meal._();

  @With<Portion>()
  const factory Meal({
    String? id,
    required Edible edible,
    required Amount amount,
    required DateTime eatenAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) = _Meal;
}
