import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:logging/logging.dart';

extension Analytics on Logger {
  void eventNoAd() {
    FirebaseAnalytics.instance.logEvent(
      name: 'no_ad_to_show',
    );
  }

  void eventAdImpression(Ad ad) {
    FirebaseAnalytics.instance.logEvent(
      name: 'ad_impression',
      parameters: {
        'ad_unit_id': ad.adUnitId,
      },
    );
  }

  void eventAdClicked(Ad ad) {
    FirebaseAnalytics.instance.logEvent(
      name: 'ad_clicked',
      parameters: {
        'ad_unit_id': ad.adUnitId,
      },
    );
  }

  void eventPremiumRewardEarned() {
    FirebaseAnalytics.instance.logEvent(
      name: 'premium_reward_earned',
    );
  }

  void eventFoodSave() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_save',
    );
  }

  void eventFoodDelete() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_delete',
    );
  }

  void eventFoodRestore() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_restore',
    );
  }

  void eventFoodShare() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_share',
    );
  }

  void eventFoodScan() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_scan',
    );
  }

  void eventFoodScanUnsupportedVersion(
    int? version,
  ) {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_scan_unsupported_version',
      parameters: {
        if (version != null) 'version': version,
      },
    );
  }

  void eventFoodScanFromBarcode() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_scan_from_barcode',
    );
  }

  void eventFoodScanFromOFF() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_scan_from_off',
    );
  }

  void eventDishSave() {
    FirebaseAnalytics.instance.logEvent(
      name: 'dish_save',
    );
  }

  void eventDishDelete() {
    FirebaseAnalytics.instance.logEvent(
      name: 'dish_delete',
    );
  }

  void eventDishRestore() {
    FirebaseAnalytics.instance.logEvent(
      name: 'dish_restore',
    );
  }

  void eventDishShare() {
    FirebaseAnalytics.instance.logEvent(
      name: 'dish_share',
    );
  }

  void eventMealSave() {
    FirebaseAnalytics.instance.logEvent(
      name: 'meal_save',
    );
  }

  void eventMealDelete() {
    FirebaseAnalytics.instance.logEvent(
      name: 'meal_delete',
    );
  }

  void eventMealRestore() {
    FirebaseAnalytics.instance.logEvent(
      name: 'meal_restore',
    );
  }

  void eventDbBackup() {
    FirebaseAnalytics.instance.logEvent(
      name: 'db_backup',
    );
  }

  void eventDbRestore() {
    FirebaseAnalytics.instance.logEvent(
      name: 'db_restore',
    );
  }

  void eventFoodContainerSave() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_container_save',
    );
  }

  void eventFoodContainerDelete() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_container_delete',
    );
  }

  void eventFoodContainerRestore() {
    FirebaseAnalytics.instance.logEvent(
      name: 'food_container_restore',
    );
  }

  void eventDefaultNutrientAdd(Nutrient nutrient) {
    FirebaseAnalytics.instance.logEvent(
      name: 'default_nutrient_add',
      parameters: {
        'nutrient': nutrient.name,
      },
    );
  }

  void eventDefaultNutrientDelete(Nutrient nutrient) {
    FirebaseAnalytics.instance.logEvent(
      name: 'default_nutrient_delete',
      parameters: {
        'nutrient': nutrient.name,
      },
    );
  }

  void eventDefaultNutrientRestore(Nutrient nutrient) {
    FirebaseAnalytics.instance.logEvent(
      name: 'default_nutrient_restore',
      parameters: {
        'nutrient': nutrient.name,
      },
    );
  }

  void eventNutrientGoalAdd(Nutrient nutrient) {
    FirebaseAnalytics.instance.logEvent(
      name: 'nutrient_goal_add',
      parameters: {
        'nutrient': nutrient.name,
      },
    );
  }

  void eventNutrientGoalDelete(Nutrient nutrient) {
    FirebaseAnalytics.instance.logEvent(
      name: 'nutrient_goal_delete',
      parameters: {
        'nutrient': nutrient.name,
      },
    );
  }

  void eventNutrientGoalRestore(Nutrient nutrient) {
    FirebaseAnalytics.instance.logEvent(
      name: 'nutrient_goal_restore',
      parameters: {
        'nutrient': nutrient.name,
      },
    );
  }

  void eventNewAccount() {
    FirebaseAnalytics.instance.logEvent(
      name: 'new_account',
    );
  }
}
