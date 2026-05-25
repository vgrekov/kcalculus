import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? timestampToDate(dynamic ts) => switch (ts) {
      Timestamp ts => ts.toDate(),
      int ts => DateTime.fromMillisecondsSinceEpoch(ts),
      _ => null,
    };

DateTime timestampToDateNotNull(Timestamp ts) => ts.toDate();

Timestamp? dateToTimestamp(DateTime? date) =>
    date == null ? null : Timestamp.fromDate(date);
