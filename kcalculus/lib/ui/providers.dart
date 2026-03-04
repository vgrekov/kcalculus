import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

final l10nProvider = Provider<AppLocalizations>(
  (ref) {
    var locale = WidgetsBinding.instance.platformDispatcher.locale;
    if (!AppLocalizations.supportedLocales.contains(locale)) {
      locale = AppLocalizations.supportedLocales.first;
    }

    return lookupAppLocalizations(locale);
  },
);
