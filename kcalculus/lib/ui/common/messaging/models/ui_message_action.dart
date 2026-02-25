import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

typedef UiMessageActionCallback<ActionResult> =
    FutureOr<ActionResult> Function(
      BuildContext context,
      WidgetRef ref,
    );

class UiMessageAction<ActionResult> {
  const UiMessageAction({
    required this.label,
    required this.callback,
  });

  final String Function(AppLocalizations) label;

  final UiMessageActionCallback<ActionResult> callback;
}
