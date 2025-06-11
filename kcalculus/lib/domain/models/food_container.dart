import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';

part 'food_container.freezed.dart';
part 'food_container.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
sealed class FoodContainer with _$FoodContainer {
  const factory FoodContainer({
    String? id,
    required String name,
    required String description,
    required Amount weight,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FoodContainer;
}
