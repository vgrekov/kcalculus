import 'package:kcalculus/domain/import/models/import_report.dart';

class UnresolvedImportException implements Exception {
  UnresolvedImportException(this.importReport);

  final ImportReport importReport;

  @override
  String toString() {
    return "UnresolvedImportException: $importReport";
  }
}
