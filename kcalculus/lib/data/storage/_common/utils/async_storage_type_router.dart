import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';

mixin AsyncStorageTypeRouter<N extends AsyncNotifier<T>, T>
    on AsyncNotifier<T> {
  late FutureOr<AsyncNotifierProvider<N, T>> delegateProvider;

  void buildDependencies() {
    ProviderSubscription<AsyncValue<T>>? delegateProviderSubscription;

    delegateProvider =
        ref.watch(storageTypeProvider.future).then((storageType) {
      final provider = buildDelegateProvider(storageType);

      delegateProviderSubscription = ref.listen(provider, _listenToProvider);

      return provider;
    });

    ref.onDispose(() {
      delegateProviderSubscription?.close();
    });
  }

  AsyncNotifierProvider<N, T> buildDelegateProvider(StorageType storageType);

  void _listenToProvider(AsyncValue<T>? prev, AsyncValue<T> next) {
    state = next;
  }
}
