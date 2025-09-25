import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/auth/services/auth_service.dart';
import 'package:kcalculus/_data/storage/_common/models/storage_type.dart';

final storageTypeProvider = FutureProvider<StorageType>(
  (ref) async {
    final firebaseUser = await ref.watch(authServiceProvider.future);
    final authService = ref.watch(authServiceProvider.notifier);

    if (firebaseUser == null && await authService.isAnonymousModeSelected()) {
      return StorageType.local;
    } else {
      return StorageType.firestore;
    }
  },
);
