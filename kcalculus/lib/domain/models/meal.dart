import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/identifiable.dart';
import 'package:kcalculus/domain/models/nutrition.dart';

class Meal extends Portion with Identifiable {
  final DateTime eatenAt;

  Meal({
    String? id,
    required super.edible,
    required super.amount,
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
