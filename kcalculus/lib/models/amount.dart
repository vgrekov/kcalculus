import 'package:kcalculus/models/units.dart';

class Amount {
  final Unit unit;
  final double value;

  Amount({
    required this.unit,
    required this.value,
  }) {
    if (value < 0) {
      throw 'Value can not be a negative number.';
    }
  }

  @override
  int get hashCode {
    return Object.hash(
      unit,
      value,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Amount && other.unit == unit && other.value == value;
  }
}
