import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../mocks.dart';

Future<void> testModifiedSelectedEdibleAlreadyExists(
  WidgetTester tester, {
  List<Override> overrides = const [],
}) async {
  final existingFood1 = Food(
    id: 'food_1',
    name: 'Food 1',
    description: '',
    nutritionFacts: [
      NutritionFacts(
        amount: Amount(
          unit: Unit.gram,
          value: 100,
        ),
        nutrientData: NutrientData(
          calories: 100,
          fatInGrams: 4,
          carbsInGrams: 10,
          fiberInGrams: 1,
          proteinInGrams: 9,
        ),
      ),
    ],
  );

  final existingFood2 = existingFood1.copyWith(
    id: 'food_2',
    name: 'Food 2',
  );

  final edibleRepository = MockEdibleRepository();

  when(
    () => edibleRepository.search(
      any(),
      type: any(named: 'type'),
      limit: any(named: 'limit'),
      offset: any(named: 'offset'),
    ),
  ).thenAnswer(
    (_) async {
      return [
        existingFood1,
        existingFood2,
      ]
          .map(
            (f) => EdibleSearchResult(
              id: f.id!,
              name: f.name,
              description: f.description,
              type: EdibleSearchResultType.food,
            ),
          )
          .toList();
    },
  );

  when(
    () => edibleRepository.exists(
      any(),
      any(),
      exceptWithId: any(named: 'exceptWithId'),
    ),
  ).thenAnswer(
    (_) async {
      return true;
    },
  );

  final foodRepository = MockFoodRepository();

  when(
    () => foodRepository.getById(
      any(),
    ),
  ).thenAnswer(
    (invocation) async {
      final id = invocation.positionalArguments.first;

      if (id == existingFood1.id) {
        return existingFood1;
      } else if (id == existingFood2.id) {
        return existingFood2;
      }

      return null;
    },
  );

  final (l10n, context) = await pumpApp(
    tester,
    overrides: [
      ...overrides,
      edibleRepositoryProvider.overrideWith(
        (ref) => edibleRepository,
      ),
      foodRepositoryProvider.overrideWith(
        (ref) => foodRepository,
      ),
    ],
  );

  await tester.tap(find.byType(FloatingActionButton));

  await tester.pumpAndSettle();

  expect(
    find.descendant(
      of: find.byType(AppBar),
      matching: find.text(l10n.screenNewMeal),
    ),
    findsOneWidget,
  );

  await selectEdible(tester, existingFood1.name);

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelPortionAmount),
    '100',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelEdibleName),
    existingFood2.name,
  );

  await tester.pumpAndSettle();

  await tester.tap(
    find.widgetWithText(TextButton, l10n.actionSave),
  );

  await tester.pumpAndSettle();

  expect(
    find.text(
      l10n.messageSelectedEdibleModifiedAlreadyExists,
    ),
    findsOneWidget,
  );
}
