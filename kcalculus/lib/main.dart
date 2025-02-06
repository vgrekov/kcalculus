import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/firebase_options.dart';
import 'package:kcalculus/ui/app/widgets/app.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  runApp(const ProviderScope(
    child: App(),
  ));
}
