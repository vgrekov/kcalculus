import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_task.freezed.dart';

@freezed
sealed class MaintenanceTask with _$MaintenanceTask {
  const factory MaintenanceTask({
    required String Function(BuildContext) title,
    required FutureOr<bool> Function(Ref) shouldRun,
    required FutureOr<void> Function(Ref) run,
  }) = _MaintenanceTask;
}
