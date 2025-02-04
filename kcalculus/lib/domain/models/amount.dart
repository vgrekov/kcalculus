import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'amount.freezed.dart';
part 'amount.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
class Amount with _$Amount {
  const Amount._();

  const factory Amount._default({
    required Unit unit,
    required double value,
  }) = _Amount;

  factory Amount({
    required Unit unit,
    required double value,
  }) {
    if (value < 0) {
      throw 'Value can not be a negative number.';
    }

    return Amount._default(
      unit: unit,
      value: value,
    );
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
}
