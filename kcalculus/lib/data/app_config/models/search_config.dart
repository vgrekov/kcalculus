import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_config.freezed.dart';
part 'search_config.g.dart';

const kDefaultRecentLookbackDurationSecs = 30;

@freezed
sealed class SearchConfig with _$SearchConfig {
  const factory SearchConfig({
    required String ediblesIndexName,
    required String foodContainersIndexName,
    @Default(kDefaultRecentLookbackDurationSecs) int recentLookbackDurationSecs,
  }) = _SearchConfig;

  factory SearchConfig.fromJson(Map<String, dynamic> json) =>
      _$SearchConfigFromJson(json);
}
