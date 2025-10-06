import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/domain/edible/use_cases/edible_search_use_case.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../fakes.dart';
import '../mocks.dart';

Future<void> testModifiedSelectedEdibleUsesSelectedNoCommonMeasure(
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
      pageConfig: any(named: 'pageConfig'),
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

  final l10n = await pumpApp(
    tester,
    overrides: [
      ...overrides,
      edibleRepositoryProvider.overrideWith(
        () => edibleRepository,
      ),
      foodRepositoryProvider.overrideWith(
        () => foodRepository,
      ),
      mealRepositoryProvider.overrideWith(
        () => mealRepository,
      ),
      edibleSearchUseCaseProvider.overrideWith(
        () => edibleSearchUseCase,
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

  final amount = Amount(unit: Unit.millilitre, value: 100);

  await enterAmount(l10n, tester, l10n.labelPortionAmount, amount);

  await tester.pumpAndSettle();

  await enterAmount(l10n, tester, '${l10n.labelPer} *', amount);

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
    find.widgetWithText(TextButton, l10n.actionUseSelectedEdible),
  );

  await tester.pumpAndSettle();

  expect(
    find.text(
      l10n.messageNoCommonMeasureError(
        amount.unit.localName(l10n),
        amount.unit.measure.localName(l10n),
      ),
    ),
    findsOneWidget,
  );
}
