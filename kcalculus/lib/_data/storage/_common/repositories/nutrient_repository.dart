import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

abstract interface class NutrientRepository {
  Future<List<Nutrient>> getDefaults();

  Future<void> saveDefaults(List<Nutrient> nutrients);
}
