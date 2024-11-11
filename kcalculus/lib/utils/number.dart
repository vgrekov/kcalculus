import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kcalculus/utils/l10n.dart';

String formatDouble(BuildContext context, double number) {
  return NumberFormat(l10n(context).formatDouble).format(number);
}
