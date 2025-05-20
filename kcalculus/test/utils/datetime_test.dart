import 'package:kcalculus/utils/datetime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'datetime.isNextDay',
    () {
      test(
        'Exactly 1 day difference',
        () {
          final curr = DateTime(2025, 05, 14, 12);
          final next = curr.add(Duration(days: 1));
          expect(isNextDay(curr, next), true);
        },
      );

      test(
        'Midday and midnight',
        () {
          final curr = DateTime(2025, 05, 14, 12);
          final next = DateTime(curr.year, curr.month, curr.day, 24);
          expect(isNextDay(curr, next), true);
        },
      );

      test(
        '6 hours within a day',
        () {
          final curr = DateTime(2025, 05, 14, 12);
          final next = curr.add(Duration(hours: 6));
          expect(isNextDay(curr, next), false);
        },
      );

      test(
        '6 hours with day switch',
        () {
          final curr = DateTime(2025, 05, 14, 20);
          final next = curr.add(Duration(hours: 6));
          expect(isNextDay(curr, next), true);
        },
      );

      test(
        '1 minute with day switch',
        () {
          final curr = DateTime(2025, 05, 14, 23, 59, 30);
          final next = curr.add(Duration(minutes: 1));
          expect(isNextDay(curr, next), true);
        },
      );

      test(
        '2 days difference',
        () {
          final curr = DateTime(2025, 05, 14);
          final next = curr.add(Duration(days: 2));
          expect(isNextDay(curr, next), false);
        },
      );

      test(
        '6 hours with day switch, but reversed',
        () {
          final curr = DateTime(2025, 05, 14, 20);
          final next = curr.add(Duration(hours: 6));
          expect(isNextDay(next, curr), false);
        },
      );

      test(
        '2 days difference, but reversed',
        () {
          final curr = DateTime(2025, 05, 14);
          final next = curr.add(Duration(days: 2));
          expect(isNextDay(curr, next), false);
        },
      );
    },
  );
}
