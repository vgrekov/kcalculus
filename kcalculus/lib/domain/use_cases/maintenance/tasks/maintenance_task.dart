import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

abstract interface class MaintenanceTask {
  String get name;

  String localName(AppLocalizations l10n);

  FutureOr<bool> shouldRun(Ref ref);

  FutureOr<void> run(Ref ref);
}
