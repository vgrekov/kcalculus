import 'package:kcalculus/models/units.dart';

class Amount {
  final Unit unit;
  final double value;

  Amount({
    required this.unit,
    required this.value,
  }) {
    if (value <= 0) {
      throw 'Value must be a positive number.';
    }
  }
}
