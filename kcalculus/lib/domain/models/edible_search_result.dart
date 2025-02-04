import 'package:freezed_annotation/freezed_annotation.dart';

part 'edible_search_result.freezed.dart';
part 'edible_search_result.g.dart';

enum EdibleSearchResultType {
  food,
  dish,
}

@Freezed(
  fromJson: false,
  toJson: true,
)
class EdibleSearchResult with _$EdibleSearchResult {
  const factory EdibleSearchResult({
    required String id,
    required String name,
    required String description,
    required EdibleSearchResultType type,
    DateTime? lastEatenAt,
  }) = _EdibleSearchResult;
}
