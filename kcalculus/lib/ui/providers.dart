import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorKeyProvider = Provider(
  (ref) => GlobalKey<NavigatorState>(),
);

final contextProvider = Provider<BuildContext>(
  (ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    return navigatorKey.currentContext!;
  },
);

final l10nProvider = Provider<AppLocalizations>(
  (ref) {
    final context = ref.watch(contextProvider);
    final loc = AppLocalizations.of(context);
    return loc!;
  },
);
