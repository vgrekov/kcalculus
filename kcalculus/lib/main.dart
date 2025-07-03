import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/firebase_options.dart';
import 'package:kcalculus/ui/app/widgets/app.dart';
import 'package:kcalculus/ui/common/widgets/release_error_widget.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await MobileAds.instance.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Logger.root.level = kReleaseMode ? Level.INFO : Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (record.level >= Level.SEVERE) {
      FirebaseCrashlytics.instance.recordError(
        record.error,
        record.stackTrace,
        reason: record.toString(),
        fatal: false,
      );
    } else if (record.level >= Level.INFO) {
      FirebaseCrashlytics.instance.log(record.toString());
    }

    if (kDebugMode) {
      debugPrint(record.toString());
    }
  });

  ErrorWidget.builder = (details) {
    if (kReleaseMode) {
      return ReleaseErrorWidget(details);
    }

    return ErrorWidget(details.exception);
  };

  await FirebaseAppCheck.instance.activate(
    androidProvider:
        kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttest,
  );

  runApp(const ProviderScope(
    child: App(),
  ));
}
