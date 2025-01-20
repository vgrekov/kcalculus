import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaintenanceTask {
  const MaintenanceTask({
    required this.title,
    required this.shouldRun,
    required this.run,
  });

  final String Function(AppLocalizations) title;

  final FutureOr<bool> Function(Ref) shouldRun;

  final FutureOr<void> Function(Ref) run;
}
