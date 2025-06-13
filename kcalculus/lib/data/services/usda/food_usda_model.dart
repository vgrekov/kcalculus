import 'package:kcalculus/data/services/usda/nutrient_usda_model.dart';
import 'package:kcalculus/data/services/usda/portion_usda_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FoodUsdaModel {
  FoodUsdaModel({
    this.id,
    required this.fdcId,
    required this.description,
    required this.dataType,
  });

  factory FoodUsdaModel.fromJson(Map<String, dynamic> json) {
    final model = FoodUsdaModel(
      fdcId: json['fdcId'] as int,
      description: json['description'] as String,
      dataType: json['dataType'] as String,
    );

    final portions = json['portions'];
    if (portions is List) {
      model.portions.addAll(
        portions.cast<Map<String, dynamic>>().map(PortionUsdaModel.fromJson),
      );
    }

    final nutrients = json['nutrients'];
    if (nutrients is List) {
      model.nutrients.addAll(
        nutrients.cast<Map<String, dynamic>>().map(NutrientUsdaModel.fromJson),
      );
    }

    return model;
  }

  int? id;

  @Index()
  final int fdcId;

  final String description;

  final String dataType;

  @Backlink('food')
  final portions = ToMany<PortionUsdaModel>();

  @Backlink('food')
  final nutrients = ToMany<NutrientUsdaModel>();
}
