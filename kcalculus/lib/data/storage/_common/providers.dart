import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';

final storageTypeProvider = FutureProvider<StorageType>(
  (ref) async {
    ref.watch(authServiceProvider);

    final firebaseUser = await ref.read(authServiceProvider.future);

    if (firebaseUser == null) {
      return StorageType.local;
    } else {
      return StorageType.firestore;
    }
  },
);
