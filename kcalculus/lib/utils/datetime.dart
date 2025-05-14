import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kcalculus/utils/l10n.dart';

final _timeFormatter = DateFormat('HH:mm');
final _dateFormatter = DateFormat('dd-MM-yyyy');
final _dateTimeFormatISO8601 = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
final _timestampFormatter = DateFormat('yyyyMMddHHmmssSSS');

String formatTime(DateTime dateTime) {
  return _timeFormatter.format(dateTime);
}

String formatTimeLocal(BuildContext context, DateTime dateTime) {
  return DateFormat(l10n(context).formatTime).format(dateTime);
}

String formatDate(DateTime dateTime) {
  return _dateFormatter.format(dateTime);
}

String formatDateLocal(BuildContext context, DateTime dateTime) {
  return DateFormat(l10n(context).formatDate).format(dateTime);
}

String formatDateTimeLocal(BuildContext context, DateTime dateTime) {
  return DateFormat(l10n(context).formatDateTime).format(dateTime);
}

String formatISO8601(DateTime dateTime) {
  return _dateTimeFormatISO8601.format(dateTime);
}

DateTime parseISO8601(String str) {
  return _dateTimeFormatISO8601.parse(str);
}

String formatTimestamp(DateTime dateTime) {
  return _timestampFormatter.format(dateTime);
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

bool isNextDay(DateTime curr, DateTime next) {
  final currMidnight = DateTime(curr.year, curr.month, curr.day);
  final nextMidnight = DateTime(next.year, next.month, next.day);
  final diff = nextMidnight.difference(currMidnight);
  return diff.inDays == 1;
}
