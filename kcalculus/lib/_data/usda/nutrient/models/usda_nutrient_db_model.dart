// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usda_nutrient_db_model.freezed.dart';
part 'usda_nutrient_db_model.g.dart';

@freezed
sealed class UsdaNutrientDbModel with _$UsdaNutrientDbModel {
  // Energy nutrient numbers in order of priority
  static const kEnergyNutrientNumbers = [
    "208",
    "958",
    "957",
  ];

  static const kFatNutrientNumber = '204';

  static const kCarbsNutrientNumber = '205';

  static const kProteinNutrientNumber = '203';

  static const kFiberNutrientNumber = '291';

  static const kCalorieUnitName = 'kcal';

  static const kGramUnitName = 'g';

  static const kMilligramUnitName = 'mg';

  static const kMicrogramUnitNames = [
    'ug',
    'µg',
  ];

  static const kUnitNames = [
    kCalorieUnitName,
    kGramUnitName,
    kMilligramUnitName,
    ...kMicrogramUnitNames,
  ];

  const factory UsdaNutrientDbModel({
    required int fdc_id,
    required String number,
    required double amount,
    required String unit_name,
  }) = _UsdaNutrientDbModel;

  factory UsdaNutrientDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaNutrientDbModelFromJson(json);
}
