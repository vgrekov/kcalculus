import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/identifiable.dart';
import 'package:kcalculus/models/nutrition.dart';

class Meal extends Identifiable with Nutritious {
  @override
  final Edible edible;
  @override
  final Amount amount;
  final DateTime eatenAt;

  Meal({
    super.id,
    required this.edible,
    required this.amount,
    required this.eatenAt,
  });
}
