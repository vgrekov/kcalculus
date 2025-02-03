import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizedException implements Exception {
  final String Function(AppLocalizations) localizedMessage;
  final dynamic cause;

  LocalizedException(
    this.localizedMessage, {
    this.cause,
  });

  @override
  String toString() {
    if (cause != null) {
      return "IngredientsCycleException caused by:\n$cause";
    }

    return "IngredientsCycleException";
  }
}
