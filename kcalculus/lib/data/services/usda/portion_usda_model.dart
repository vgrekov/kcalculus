import 'package:kcalculus/data/services/usda/food_usda_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class PortionUsdaModel {
  PortionUsdaModel({
    this.id,
    required this.measureUnitId,
    required this.amount,
    required this.gramWeight,
  });

  factory PortionUsdaModel.fromJson(Map<String, dynamic> json) {
    return PortionUsdaModel(
      measureUnitId: json['measureUnitId'] as int,
      amount: (json['amount'] as num?)?.toDouble(),
      gramWeight: (json['gramWeight'] as num).toDouble(),
    );
  }

  int? id;

  final int measureUnitId;

  final double? amount;

  final double gramWeight;

  final food = ToOne<FoodUsdaModel>();
}
