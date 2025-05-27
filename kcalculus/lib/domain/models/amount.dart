import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/double_ext.dart';

part 'amount.freezed.dart';
part 'amount.g.dart';

@freezed
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

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Amount? tryConvert(Unit toUnit) {
    if (unit == toUnit) {
      return this;
    }

    if (unit.measure != toUnit.measure) {
      return null;
    }

    return Amount(
      unit: toUnit,
      value: value * unit.factor / toUnit.factor,
    );
  }

  Amount withPrecision(int fractionDigits, [bool round = true]) {
    return Amount(
      unit: unit,
      value: value.withPrecision(fractionDigits, round),
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

  Amount operator -(Amount other) {
    if (unit.measure != other.unit.measure) {
      throw 'Operands must be of the same measure.';
    }

    final targetUnit = Unit.defaultFor(unit.measure);

    return Amount(
      unit: targetUnit,
      value: value * unit.factor / targetUnit.factor -
          other.value * other.unit.factor / targetUnit.factor,
    );
  }

  Amount operator *(double factor) {
    return Amount(
      unit: unit,
      value: value * factor,
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
