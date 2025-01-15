import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DuplicationException implements Exception {
  final dynamic message;

  DuplicationException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "DuplicationException: $message";
    }

    return "DuplicationException";
  }
}

class IngredientsCycleException implements Exception {
  final dynamic message;

  IngredientsCycleException([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "IngredientsCycleException: $message";
    }

    return "IngredientsCycleException";
  }
}

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
