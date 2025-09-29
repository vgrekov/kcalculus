import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../fakes.dart';
import '../mocks.dart';

Future<void> testModifiedSelectedEdibleUsesSelected(
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

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelEdibleName),
    'Test Food 2',
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
    find.widgetWithText(TextButton, l10n.actionUseSelectedEdible),
  );

  verify(
    () => mealRepository.save(
      any(that: predicate<Meal>((m) => m.edible == meal.edible)),
    ),
  ).called(1);
}
