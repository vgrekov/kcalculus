import 'package:intl/intl.dart';

final _doubleFormatter = NumberFormat('##0.##');

String formatDouble(double number) {
  return _doubleFormatter.format(number);
}
