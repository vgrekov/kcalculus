import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

import '../../utils.dart';

Future<void> testNoCommonMeasure(
  WidgetTester tester, {
  List<Override> overrides = const [],
}) async {
  final l10n = await pumpApp(
    tester,
    overrides: overrides,
  );

  expect(
    find.descendant(
      of: find.byType(AppBar),
      matching: find.text(l10n.screenMeals),
    ),
    findsOneWidget,
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

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelEdibleName),
    'Test food',
  );

  final amount = Amount(
    unit: Unit.millilitre,
    value: 100,
  );

  await enterAmount(
    l10n,
    tester,
    l10n.labelPortionAmount,
    amount,
  );

  await tester.enterText(
    find.widgetWithText(TextFormField, '${l10n.labelPer} *'),
    '100',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    findNutrientAmountInput(Nutrient.energy, l10n),
    '100',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    findNutrientAmountInput(Nutrient.fat, l10n),
    '4',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    findNutrientAmountInput(Nutrient.totalCarbs, l10n),
    '10',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    findNutrientAmountInput(Nutrient.fiber, l10n),
    '1',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    findNutrientAmountInput(Nutrient.protein, l10n),
    '9',
  );

  await tester.pumpAndSettle();

  await tester.tap(
    find.byIcon(Icons.check),
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
