import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/identifiable.dart';
import 'package:kcalculus/models/nutrition.dart';

class Meal with Identifiable, Nutritious {
  @override
  final Edible edible;
  @override
  final Amount amount;
  final DateTime eatenAt;

  Meal({
    String? id,
    required this.edible,
    required this.amount,
    required this.eatenAt,
  }) {
    this.id = id;
  }

  Meal copyWith({
    String? id,
    Edible? edible,
    Amount? amount,
    DateTime? eatenAt,
  }) {
    return Meal(
      id: id ?? this.id,
      edible: edible ?? this.edible,
      amount: amount ?? this.amount,
      eatenAt: eatenAt ?? this.eatenAt,
    );
  }
}
