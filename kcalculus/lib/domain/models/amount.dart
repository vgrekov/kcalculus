import 'package:kcalculus/domain/models/units.dart';

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

  Amount operator +(Amount other) {
    if (unit.measure != other.unit.measure) {
      throw 'Addends must be of the same measure.';
    }

    final targetUnit = Unit.defaultFor(unit.measure);

    return Amount(
      unit: targetUnit,
      value: value * unit.factor / targetUnit.factor +
          other.value * other.unit.factor / targetUnit.factor,
    );
  }

  double _compareTo(Amount other) {
    if (unit.measure != other.unit.measure) {
      throw 'Both amounts must be of the same measure.';
    }

    return value * unit.factor - other.value * other.unit.factor;
  }

  bool operator <(Amount other) {
    return _compareTo(other) < 0;
  }

  bool operator <=(Amount other) {
    return _compareTo(other) <= 0;
  }

  bool operator >(Amount other) {
    return _compareTo(other) > 0;
  }

  bool operator >=(Amount other) {
    return _compareTo(other) >= 0;
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
