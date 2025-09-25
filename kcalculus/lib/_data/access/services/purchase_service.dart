import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/access/models/purchase_status.dart';

class PurchaseService extends AsyncNotifier<PurchaseStatus> {
  @override
  FutureOr<PurchaseStatus> build() {
    return PurchaseStatus.notPurchased;
  }
}

final purchaseServiceProvider =
    AsyncNotifierProvider<PurchaseService, PurchaseStatus>(
  PurchaseService.new,
);
