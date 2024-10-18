import 'package:intl/intl.dart';

final _timeFormatter = DateFormat('HH:mm');
final _dateFormatter = DateFormat('dd-MM-yyyy');

String formatTime(DateTime dateTime) {
  return _timeFormatter.format(dateTime);
}

String formatDate(DateTime dateTime) {
  return _dateFormatter.format(dateTime);
}
