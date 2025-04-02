import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/units.dart';

import '../../utils.dart';

Future<void> testNoCommonMeasure(
  WidgetTester tester,
  Meal meal, {
  List<Override> overrides = const [],
}) async {
  final (l10n, context) = await pumpApp(
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

  await selectMeal(tester, meal.edible.name);

  expect(
    find.descendant(
      of: find.byType(AppBar),
      matching: find.text(l10n.screenEditMeal),
    ),
    findsOneWidget,
  );

  final amount = Amount(
    unit: Unit.millilitre,
    value: 100,
  );

  await enterAmount(
    context,
    tester,
    l10n.labelPortionAmount,
    amount,
  );

  await tester.tap(
    find.widgetWithText(TextButton, l10n.actionSave),
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
