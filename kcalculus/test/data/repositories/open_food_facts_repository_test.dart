import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:kcalculus/data/repositories/open_food_facts_repository.dart';
import 'package:kcalculus/data/services/open_food_facts/open_food_facts_service.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
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
          openFoodFactsBaseUrl: '',
          contactEmail: '',
          appName: '',
          version: '',
          httpClient: httpClient,
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

          final food = await repository.getFoodByBarcode('3017620422003');

          expect(food, isNotNull);

          expect(food?.name, 'Nutella');
          expect(food?.description, 'Nutella,Ferrero');

          expect(food?.getNutritionFacts().length, 1);

          expect(
            food?.getNutritionFacts()[0].amount,
            Amount(unit: Unit.gram, value: 100),
          );

          expect(
            mapEquals(
              food?.nutritionFacts[0].nutrientData.nutrientAmounts,
              {
                Nutrient.totalCarbs: Amount(unit: Unit.gram, value: 57.5),
                Nutrient.energy: Amount(unit: Unit.calorie, value: 539),
                Nutrient.fat: Amount(unit: Unit.gram, value: 30.9),
                Nutrient.protein: Amount(unit: Unit.gram, value: 6.3),
                Nutrient.saturatedFat: Amount(unit: Unit.gram, value: 10.6),
                Nutrient.sodium: Amount(unit: Unit.milligram, value: 42.8),
                Nutrient.sugar: Amount(unit: Unit.gram, value: 56.3),
              },
            ),
            true,
          );
        },
      );
    },
  );
}
