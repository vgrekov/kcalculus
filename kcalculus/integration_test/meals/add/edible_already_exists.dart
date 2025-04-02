import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../mocks.dart';

Future<void> testEdibleAlreadyExists(
  WidgetTester tester, {
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
      return true;
    },
  );

  final (l10n, context) = await pumpApp(
    tester,
    overrides: [
      ...overrides,
      edibleRepositoryProvider.overrideWith(
        (ref) => edibleRepository,
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

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelEdibleName),
    'Test food',
  );

  await tester.enterText(
    find.widgetWithText(TextFormField, l10n.labelPortionAmount),
    '100',
  );

  await tester.pumpAndSettle();

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
      l10n.messageEdibleAlreadyExists,
    ),
    findsOneWidget,
  );
}
