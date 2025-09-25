import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:kcalculus/_data/app_config/models/app_config.dart';
import 'package:kcalculus/data/repositories/open_food_facts_repository.dart';
import 'package:kcalculus/data/services/open_food_facts/open_food_facts_service.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';

class MockHttpClient with Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  group(
    'OpenFoodFactsRepository - getFoodByBarcode',
    () {
      late MockHttpClient httpClient;
      late OpenFoodFactsService service;
      late OpenFoodFactsRepository repository;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();

        registerFallbackValue(FakeUri());
      });

      setUp(() {
        httpClient = MockHttpClient();
        service = OpenFoodFactsService(
          appName: '',
          version: '',
          httpClient: httpClient,
          appConfig: AppConfig(
            openFoodFactsBaseUrl: '',
            openFoodFactsTimeoutMillis: 5000,
            contactEmail: '',
            interstitialAdUnitId: '',
            interstitialAdTimeoutMillis: 5000,
            interstitialAdCooldownDurationMins: 1,
            unlockAdUnitId: '',
            unlockAdTimeoutMillis: 5000,
            unlockWithAdDurationMins: 1,
            adsEnabled: false,
          ),
        );
        repository = OpenFoodFactsRepository(service: service);
      });

      test(
        'Nutella',
        () async {
          final nutellaResponse = await loadFixture(
            'test/data/repositories/fixtures/off_response_nutella.json',
          );

          when(() => httpClient.get(any(), headers: any(named: 'headers')))
              .thenAnswer(
            (_) async {
              return http.Response(
                nutellaResponse,
                200,
              );
            },
          );

          final nutrientDefaults = [
            Nutrient.energy,
            Nutrient.fat,
            Nutrient.saturatedFat,
            Nutrient.transFat,
            Nutrient.totalCarbs,
            Nutrient.fiber,
            Nutrient.sugar,
            Nutrient.protein,
            Nutrient.cholesterol,
            Nutrient.sodium,
            Nutrient.potassium,
            Nutrient.calcium,
            Nutrient.iron,
          ];

          final food = await repository.getFoodByBarcode(
            '3017620422003',
            nutrientDefaults,
          );

          expect(food, isNotNull);

          expect(food?.name, 'Nutella');
          expect(food?.description, 'Nutella,Ferrero');

          expect(food?.getNutritionFacts().length, 1);

          expect(
            food?.getNutritionFacts()[0].amount,
            Amount(unit: Unit.gram, value: 100),
          );

          expect(
            food?.nutritionFacts[0].nutrientData.nutrientAmounts,
            [
              NutrientAmount(
                nutrient: Nutrient.energy,
                amount: Amount(unit: Unit.calorie, value: 539),
              ),
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 30.9),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 10.6),
              ),
              NutrientAmount(
                nutrient: Nutrient.totalCarbs,
                amount: Amount(unit: Unit.gram, value: 57.5),
              ),
              NutrientAmount(
                nutrient: Nutrient.sugar,
                amount: Amount(unit: Unit.gram, value: 56.3),
              ),
              NutrientAmount(
                nutrient: Nutrient.protein,
                amount: Amount(unit: Unit.gram, value: 6.3),
              ),
              NutrientAmount(
                nutrient: Nutrient.sodium,
                amount: Amount(unit: Unit.milligram, value: 42.8),
              ),
            ],
          );
        },
      );
    },
  );
}
