import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_progress.freezed.dart';
part 'import_progress.g.dart';

@freezed
sealed class ImportProgress with _$ImportProgress {
  const factory ImportProgress.$default({
    required int imported,
    int? total,
  }) = _ImportProgress;

  factory ImportProgress({
    required int imported,
    int? total,
  }) {
    if (total != null && imported > total) {
      throw ArgumentError(
        'Number of imported exceeds the total number.',
        'imported',
      );
    }

    return ImportProgress.$default(
      imported: imported,
      total: total,
    );
  }

  factory ImportProgress.fromJson(Map<String, dynamic> json) =>
      _$ImportProgressFromJson(json);
}
