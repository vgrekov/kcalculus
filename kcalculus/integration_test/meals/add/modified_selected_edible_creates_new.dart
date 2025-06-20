import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/domain/providers.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../fakes.dart';
import '../mocks.dart';

Future<void> testModifiedSelectedEdibleCreatesNew(
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
        nutrientData: NutrientData.legacy(
          calories: 100,
          fatInGrams: 4,
          carbsInGrams: 10,
          fiberInGrams: 1,
          proteinInGrams: 9,
        ),
      ),
    ],
  );

  final edibleSearchUseCase = MockEdibleSearchUseCase();

  when(
    () => edibleSearchUseCase.search(
      any(),
      type: any(named: 'type'),
      limit: any(named: 'limit'),
      offset: any(named: 'offset'),
    ),
  ).thenAnswer(
    (_) async {
      return [
        existingFood1,
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

  final edibleRepository = MockEdibleRepository();

  when(
    () => edibleRepository.exists(
      any(),
      any(),
      exceptWithId: any(named: 'exceptWithId'),
    ),
  ).thenAnswer(
    (_) async {
      return false;
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
      }

      return null;
    },
  );

  final mealRepository = MockMealRepository();

  when(() => mealRepository.getByDate(any())).thenAnswer(
    (_) async {
      return [];
    },
  );

  registerFallbackValue(FakeMeal());

  when(() => mealRepository.save(any())).thenAnswer(
    (invocation) async {
      final meal = invocation.positionalArguments.first as Meal;

      return meal.copyWith(id: 'new_meal_id');
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
      mealRepositoryProvider.overrideWith(
        (ref) => mealRepository,
      ),
      edibleSearchUseCaseProvider.overrideWith(
        (ref) => edibleSearchUseCase,
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

  final newFoodName = 'Food 2';

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelEdibleName),
    newFoodName,
  );

  await tester.pumpAndSettle();

  await tester.tap(
    find.widgetWithText(TextButton, l10n.actionSave),
  );

  await tester.pumpAndSettle();

  expect(
    find.text(
      l10n.messageSelectedEdibleModifiedCreatesNew,
    ),
    findsOneWidget,
  );

  await tester.tap(
    find.widgetWithText(TextButton, l10n.actionCreateNewEdible),
  );

  verify(
    () => mealRepository.save(
      any(that: predicate<Meal>(
        (m) {
          return m.edible.id == null && m.edible.name == newFoodName;
        },
      )),
    ),
  ).called(1);
}
