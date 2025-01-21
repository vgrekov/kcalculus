import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition.dart';

class Meal extends Portion {
  String? id;
  final DateTime eatenAt;

  Meal({
    this.id,
    required super.edible,
    required super.amount,
    required this.eatenAt,
  });

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
