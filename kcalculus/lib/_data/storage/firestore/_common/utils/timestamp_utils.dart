import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? timestampToDate(Timestamp? ts) => ts?.toDate();

Timestamp? dateToTimestamp(DateTime? date) =>
    date == null ? null : Timestamp.fromDate(date);
