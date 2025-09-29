import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('NutrientDefaultsViewModel');

enum NutrientDefaultsCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class NutrientDefaultsViewModel
    extends AutoDisposeAsyncNotifier<List<Nutrient>> {
  UiCommander<NutrientDefaultsCommand>? _commander;

  @override
  FutureOr<List<Nutrient>> build() {
    ref.listen(
      defaultNutrientRepositoryProvider,
      _repoListener,
    );

    _commander = UiCommander<NutrientDefaultsCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return ref.read(defaultNutrientRepositoryProvider.future);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> addNutrient(Nutrient nutrient) async {
    if (state is AsyncData) {
      final data = state.value!;

      _log.finer('addNutrient() START');

      try {
        _log.finest('addNutrient() Adding default nutrient: $nutrient');

        final defaults = [
          ...data,
          nutrient,
        ];

        await ref
            .read(defaultNutrientRepositoryProvider.notifier)
            .saveAll(defaults);

        _log.info('Default nutrient added: $nutrient');
        _log.eventDefaultNutrientAdd(nutrient);
      } catch (error, stackTrace) {
        _log.severe('Failed to add default nutrient', error, stackTrace);

        _commander!.send(NutrientDefaultsCommand.showUnknownErrorNotification);
      }

      _log.finer('addNutrient() END');
    }
  }

  Future<void> deleteNutrient(Nutrient nutrient) async {
    if (state is AsyncData) {
      final data = state.value!;

      _log.finer('deleteNutrient() START');

      try {
        _log.finest('deleteNutrient() Deleting default nutrient: $nutrient');

        final defaults = [...data];

        final index = defaults.indexOf(nutrient);

        final result = defaults.remove(nutrient);

        await ref
            .read(defaultNutrientRepositoryProvider.notifier)
            .saveAll(defaults);

        _log.info('Default nutrient deleted: $nutrient');
        _log.eventDefaultNutrientDelete(nutrient);

        if (result) {
          _commander!.send<(Nutrient, int), void>(
            NutrientDefaultsCommand.showDeletionSuccessNotification,
            payload: (nutrient, index),
          );
        } else {
          _commander!
              .send(NutrientDefaultsCommand.showDeletionFailureNotification);
        }
      } catch (error, stackTrace) {
        _log.severe('Failed to delete default nutrient', error, stackTrace);

        _commander!.send(NutrientDefaultsCommand.showUnknownErrorNotification);
      }

      _log.finer('deleteNutrient() END');
    }
  }

  Future<void> restoreNutrient(Nutrient nutrient, int index) async {
    if (state is AsyncData) {
      final data = state.value!;

      _log.finer('restoreNutrient() START');

      try {
        _log.finest(
            'restoreNutrient() Restoring default nutrient: $nutrient at position: $index');

        final defaults = [...data];

        defaults.insert(index, nutrient);

        await ref
            .read(defaultNutrientRepositoryProvider.notifier)
            .saveAll(defaults);

        _log.info('Default nutrient restored: $nutrient at position: $index');
        _log.eventDefaultNutrientRestore(nutrient);
      } catch (error, stackTrace) {
        _log.severe('Failed to restore default nutrient', error, stackTrace);

        _commander!.send(NutrientDefaultsCommand.showUnknownErrorNotification);
      }

      _log.finer('restoreNutrient() END');
    }
  }

  Future<void> reorderNutrients(int oldIndex, int newIndex) async {
    if (state is AsyncData) {
      final data = state.value!;

      _log.finer('reorderNutrients() START');

      try {
        _log.finest('reorderNutrients() Reordering default nutrients');

        final defaults = [...data];

        final nutrient = defaults[oldIndex];

        defaults.removeAt(oldIndex);

        if (newIndex > oldIndex) {
          newIndex--;
        }

        defaults.insert(newIndex, nutrient);

        state = AsyncValue.data(defaults);

        await ref
            .read(defaultNutrientRepositoryProvider.notifier)
            .saveAll(defaults);

        _log.info('Default nutrients reordered');
      } catch (error, stackTrace) {
        _log.severe('Failed to reorder default nutrients', error, stackTrace);

        _commander!.send(NutrientDefaultsCommand.showUnknownErrorNotification);

        state = ref.read(defaultNutrientRepositoryProvider);
      }

      _log.finer('reorderNutrients() END');
    }
  }

  void _repoListener(
    AsyncValue<List<Nutrient>>? prev,
    AsyncValue<List<Nutrient>> next,
  ) {
    if (next is AsyncData) {
      if (!listEquals(state.value, next.value)) {
        state = next;
      }
    }
  }
}

final nutrientDefaultsViewModel = AsyncNotifierProvider.autoDispose<
    NutrientDefaultsViewModel, List<Nutrient>>(
  NutrientDefaultsViewModel.new,
);
