import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_history/v1/models/food_v1.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/food/exceptions/unsupported_version_exception.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/utils/string_ext.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
sealed class Food with _$Food implements Edible {
  static const kVersion = 2;

  static final kParsers = {
    kVersion: Food.fromJson,
    FoodV1.kVersion: (json) => FoodV1.fromJson(json).toFood(),
  };

  const Food._();

  const factory Food({
    String? id,
    required String name,
    required String description,
    required List<NutritionFacts> nutritionFacts,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastEatenAt,
    DateTime? deletedAt,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  /// Like [fromJson], but supports legacy model formats from older versions.
  factory Food.fromJsonCompat(Map<String, dynamic> json) {
    final jsonVersion = json['version'] as int?;
    if (!kParsers.containsKey(jsonVersion)) {
      throw UnsupportedVersionException(version: jsonVersion);
    }

    return kParsers[jsonVersion]!.call(json);
  }

  @JsonKey(
    includeToJson: true,
  )
  int get version => kVersion;

  @override
  List<NutritionFacts> getNutritionFacts() => nutritionFacts;

  Food copy() {
    return Food(
      name: name.nextVersion(),
      description: description,
      nutritionFacts: nutritionFacts,
    );
  }

  Map<String, dynamic> toJsonForSharing() {
    return copyWith(id: null).toJson();
  }
}
