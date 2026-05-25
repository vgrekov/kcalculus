import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../mocks.dart';

Future<void> testModifiedSelectedEdibleAlreadyExists(
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
      return true;
    },
  );

  final l10n = await pumpApp(
    tester,
    overrides: [
      ...overrides,
      edibleRepositoryProvider.overrideWith(
        () => edibleRepository,
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
    find.byIcon(Icons.check),
  );

  await tester.pumpAndSettle();

  expect(
    find.text(
      l10n.messageSelectedEdibleModifiedAlreadyExists,
    ),
    findsOneWidget,
  );
}
