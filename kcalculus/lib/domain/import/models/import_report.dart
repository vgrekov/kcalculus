import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/import/models/import_progress.dart';

part 'import_report.freezed.dart';
part 'import_report.g.dart';

@freezed
sealed class ImportReport with _$ImportReport {
  const factory ImportReport({
    required ImportProgress foods,
    required ImportProgress dishes,
    required ImportProgress meals,
    required ImportProgress containers,
    required ImportProgress defaultNutrients,
    required ImportProgress nutrientGoals,
    required ImportProgress settings,
  }) = _ImportReport;

  factory ImportReport.fromJson(Map<String, dynamic> json) =>
      _$ImportReportFromJson(json);
}
