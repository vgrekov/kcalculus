import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';

mixin StorageTypeRouter<N extends Notifier<T>, T> on Notifier<T> {
  late FutureOr<NotifierProvider<N, T>> delegateProvider;

  void buildDependencies() {
    ProviderSubscription<T>? delegateProviderSubscription;

    delegateProvider = ref.watch(storageTypeProvider.future).then(
      (storageType) {
        final provider = buildDelegateProvider(storageType);

        delegateProviderSubscription = ref.listen(provider, _listenToProvider);

        return provider;
      },
    );

    ref.onDispose(() {
      delegateProviderSubscription?.close();
    });
  }

  NotifierProvider<N, T> buildDelegateProvider(StorageType storageType);

  void _listenToProvider(T? prev, T next) {
    state = next;
  }
}
