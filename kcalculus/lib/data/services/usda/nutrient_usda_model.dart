import 'package:kcalculus/data/services/usda/food_usda_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class NutrientUsdaModel {
  NutrientUsdaModel({
    this.id,
    required this.number,
    required this.amount,
    required this.unitName,
  });

  factory NutrientUsdaModel.fromJson(Map<String, dynamic> json) {
    return NutrientUsdaModel(
      number: json['number'] as String,
      amount: (json['amount'] as num).toDouble(),
      unitName: json['unitName'] as String,
    );
  }

  int? id;

  final String number;

  final double amount;

  final String unitName;

  final food = ToOne<FoodUsdaModel>();
}
