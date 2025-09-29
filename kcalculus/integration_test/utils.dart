import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/firebase_options.dart';
import 'package:kcalculus/l10n/app_localizations.dart';
import 'package:kcalculus/ui/app/widgets/app.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/unit_picker.dart';
import 'package:kcalculus/ui/providers.dart';

Future<void> setUpApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
}

Future<(AppLocalizations, BuildContext)> pumpApp(
  WidgetTester tester, {
  List<Override> overrides = const [],
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: const App(),
    ),
  );

  await tester.pumpAndSettle();

  final element = tester.element(find.byType(App));

  final container = ProviderScope.containerOf(element);

  final context = container.read(contextProvider);

  final l10n = container.read(l10nProvider);

  return (l10n, context);
}

Future<void> enterAmount(
  BuildContext context,
  WidgetTester tester,
  String fieldLabel,
  Amount amount,
) async {
  await tester.enterText(
    find.widgetWithText(TextFormField, fieldLabel),
    amount.value.toString(),
  );

  await tester.pumpAndSettle();

  await tester.tap(
    find.descendant(
      of: find.widgetWithText(AmountInput, fieldLabel),
      matching: find.byType(TextButton),
    ),
  );

  await tester.pumpAndSettle();

  final measureCardFinder = find.widgetWithText(
    Card,
    amount.unit.measure.localName(context),
  );

  final measureScrollableFinder = find.ancestor(
    of: measureCardFinder,
    matching: find.byType(Scrollable),
  );

  await tester.scrollUntilVisible(
    measureCardFinder,
    200,
    scrollable: measureScrollableFinder,
  );

  final systemCardFinder = find.widgetWithText(
    Card,
    amount.unit.system.localName(context),
  );

  final systemScrollableFinder = find.ancestor(
    of: systemCardFinder,
    matching: find.byType(Scrollable),
  );

  await tester.scrollUntilVisible(
    systemCardFinder,
    200,
    scrollable: systemScrollableFinder,
  );

  await tester.pumpAndSettle();

  await tester.tap(
    find.descendant(
      of: find.byType(UnitPicker),
      matching: find.widgetWithText(
        TextButton,
        amount.unit.localName(context),
      ),
    ),
  );

  await tester.pumpAndSettle();
}

Future<void> selectEdible(
  WidgetTester tester,
  String edibleName,
) async {
  await tester.tap(
    find.widgetWithIcon(TextButton, Icons.search),
  );

  await tester.pumpAndSettle();

  final itemFinder = find.widgetWithText(
    ListTile,
    edibleName,
  );

  await tester.tap(itemFinder);

  await tester.pumpAndSettle();
}

Future<void> selectMeal(
  WidgetTester tester,
  String edibleName,
) async {
  final itemFinder = find.widgetWithText(
    ListTile,
    edibleName,
  );

  await tester.tap(itemFinder);

  await tester.pumpAndSettle();
}

Finder findNutrientAmountInput(Nutrient nutrient, AppLocalizations l10n) {
  String label = nutrient.localName(l10n);
  if (nutrient.required) {
    label += ' *';
  }

  return find.widgetWithText(TextFormField, label);
}
