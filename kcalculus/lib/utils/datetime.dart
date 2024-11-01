import 'package:intl/intl.dart';

final _timeFormatter = DateFormat('HH:mm');
final _dateFormatter = DateFormat('dd-MM-yyyy');
final _dateTimeFormatISO8601 = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');

String formatTime(DateTime dateTime) {
  return _timeFormatter.format(dateTime);
}

String formatDate(DateTime dateTime) {
  return _dateFormatter.format(dateTime);
}

String formatISO8601(DateTime dateTime) {
  return _dateTimeFormatISO8601.format(dateTime);
}

DateTime parseISO8601(String str) {
  return _dateTimeFormatISO8601.parse(str);
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
