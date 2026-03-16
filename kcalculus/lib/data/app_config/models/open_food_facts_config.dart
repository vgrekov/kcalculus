import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_food_facts_config.freezed.dart';
part 'open_food_facts_config.g.dart';

@freezed
sealed class OpenFoodFactsConfig with _$OpenFoodFactsConfig {
  const factory OpenFoodFactsConfig({
    required String baseUrl,
    required int timeoutMillis,
    required String contactEmail,
  }) = _OpenFoodFactsConfig;

  factory OpenFoodFactsConfig.fromJson(Map<String, dynamic> json) =>
      _$OpenFoodFactsConfigFromJson(json);
}
