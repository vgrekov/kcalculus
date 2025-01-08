import 'dart:math';

extension Precision on double {
  double withPrecision(int fractionDigits, [bool round = true]) {
    if (fractionDigits < 0 || fractionDigits > 20) {
      throw 'The parameter "fractionDigits" must be an integer satisfying: 0 <= fractionDigits <= 20.';
    }

    final factor = pow(10, fractionDigits);
    var result = this * factor;
    if (round) {
      result = result.roundToDouble();
    } else {
      result = result.truncateToDouble();
    }

    return result / factor;
  }
}
