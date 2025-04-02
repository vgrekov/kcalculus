import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/units.dart';

import '../../utils.dart';

Future<void> testNoCommonMeasure(
  WidgetTester tester, {
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
    context,
    tester,
    l10n.labelPortionAmount,
    amount,
  );

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelPer),
    '100',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelCalories),
    '100',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelFat),
    '4',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelCarbs),
    '10',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelFiber),
    '1',
  );

  await tester.pumpAndSettle();

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelProtein),
    '9',
  );

  await tester.pumpAndSettle();

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
