import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/app_config/models/auth_config.dart';
import 'package:kcalculus/data/app_config/models/firestore_config.dart';
import 'package:kcalculus/data/app_config/models/open_food_facts_config.dart';
import 'package:kcalculus/data/app_config/models/revenue_cat_config.dart';
import 'package:kcalculus/data/app_config/models/search_config.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
sealed class AppConfig with _$AppConfig {
  const factory AppConfig({
    required AuthConfig auth,
    required SearchConfig search,
    required OpenFoodFactsConfig openFoodFacts,
    required FirestoreConfig firestore,
    required RevenueCatConfig revenueCat,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
