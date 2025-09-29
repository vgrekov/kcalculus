import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/meal_repository.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../fakes.dart';
import '../mocks.dart';

Future<void> testModifiedSelectedEdibleUsesSelectedNoCommonMeasure(
  WidgetTester tester,
  Meal meal, {
  List<Override> overrides = const [],
}) async {
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

  final mealRepository = MockMealRepository();

  when(() => mealRepository.getByDate(any())).thenAnswer(
    (_) async {
      return [
        meal,
      ];
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
        () => edibleRepository,
      ),
      mealRepositoryProvider.overrideWith(
        () => mealRepository,
      ),
    ],
  );

  await selectMeal(tester, meal.edible.name);

  expect(
    find.descendant(
      of: find.byType(AppBar),
      matching: find.text(l10n.screenEditMeal),
    ),
    findsOneWidget,
  );

  final amount = Amount(unit: Unit.millilitre, value: 100);

  await enterAmount(context, tester, l10n.labelPortionAmount, amount);

  await tester.pumpAndSettle();

  await enterAmount(context, tester, '${l10n.labelPer} *', amount);

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
        amount.unit.localName(context),
        amount.unit.measure.localName(context),
      ),
    ),
    findsOneWidget,
  );
}
