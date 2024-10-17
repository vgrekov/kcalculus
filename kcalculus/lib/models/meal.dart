import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/nutrition.dart';

class Meal with Nutritious {
  @override
  final Edible edible;
  @override
  final Amount amount;
  final DateTime eatenAt;

  const Meal({
    required this.edible,
    required this.amount,
    required this.eatenAt,
  });
}
