import 'package:freezed_annotation/freezed_annotation.dart';

part 'revenue_cat_config.freezed.dart';
part 'revenue_cat_config.g.dart';

@freezed
sealed class RevenueCatConfig with _$RevenueCatConfig {
  const factory RevenueCatConfig({
    required String sdkApiKey,
  }) = _RevenueCatConfig;

  factory RevenueCatConfig.fromJson(Map<String, dynamic> json) =>
      _$RevenueCatConfigFromJson(json);
}
