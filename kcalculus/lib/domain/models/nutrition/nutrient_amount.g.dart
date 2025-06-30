// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutrientAmount _$NutrientAmountFromJson(Map<String, dynamic> json) =>
    _NutrientAmount(
      nutrient: $enumDecode(_$NutrientEnumMap, json['nutrient']),
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutrientAmountToJson(_NutrientAmount instance) =>
    <String, dynamic>{
      'nutrient': _$NutrientEnumMap[instance.nutrient]!,
      'amount': instance.amount,
    };

const _$NutrientEnumMap = {
  Nutrient.energy: 'energy',
  Nutrient.fat: 'fat',
  Nutrient.saturatedFat: 'saturatedFat',
  Nutrient.transFat: 'transFat',
  Nutrient.unsaturatedFat: 'unsaturatedFat',
  Nutrient.omega3Fat: 'omega3Fat',
  Nutrient.omega6Fat: 'omega6Fat',
  Nutrient.omega9Fat: 'omega9Fat',
  Nutrient.monounsaturatedFat: 'monounsaturatedFat',
  Nutrient.polyunsaturatedFat: 'polyunsaturatedFat',
  Nutrient.totalCarbs: 'totalCarbs',
  Nutrient.fiber: 'fiber',
  Nutrient.sugar: 'sugar',
  Nutrient.polyols: 'polyols',
  Nutrient.erythritol: 'erythritol',
  Nutrient.protein: 'protein',
  Nutrient.cholesterol: 'cholesterol',
  Nutrient.sodium: 'sodium',
  Nutrient.potassium: 'potassium',
  Nutrient.calcium: 'calcium',
  Nutrient.iron: 'iron',
  Nutrient.betaCarotene: 'betaCarotene',
  Nutrient.biotin: 'biotin',
  Nutrient.vitaminA: 'vitaminA',
  Nutrient.vitaminB1: 'vitaminB1',
  Nutrient.vitaminB2: 'vitaminB2',
  Nutrient.vitaminB3: 'vitaminB3',
  Nutrient.vitaminB5: 'vitaminB5',
  Nutrient.vitaminB6: 'vitaminB6',
  Nutrient.vitaminB9: 'vitaminB9',
  Nutrient.vitaminB12: 'vitaminB12',
  Nutrient.vitaminC: 'vitaminC',
  Nutrient.vitaminD: 'vitaminD',
  Nutrient.vitaminE: 'vitaminE',
  Nutrient.vitaminK: 'vitaminK',
  Nutrient.silica: 'silica',
  Nutrient.bicarbonate: 'bicarbonate',
  Nutrient.chloride: 'chloride',
  Nutrient.phosphorus: 'phosphorus',
  Nutrient.magnesium: 'magnesium',
  Nutrient.zinc: 'zinc',
  Nutrient.copper: 'copper',
  Nutrient.manganese: 'manganese',
  Nutrient.fluoride: 'fluoride',
  Nutrient.selenium: 'selenium',
  Nutrient.chromium: 'chromium',
  Nutrient.molybdenum: 'molybdenum',
  Nutrient.iodine: 'iodine',
  Nutrient.caffeine: 'caffeine',
  Nutrient.taurine: 'taurine',
  Nutrient.chlorophyl: 'chlorophyl',
  Nutrient.sulfate: 'sulfate',
  Nutrient.nitrate: 'nitrate',
};
