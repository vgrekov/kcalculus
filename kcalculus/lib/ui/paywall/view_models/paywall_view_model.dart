import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/repositories/subscription_repository.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';

class PaywallViewModel extends AsyncNotifier<SubscriptionState> {
  @override
  FutureOr<SubscriptionState> build() {
    return ref.watch(
      subscriptionRepositoryProvider.selectAsync(
        (it) => it,
      ),
    );
  }
}

final paywallViewModel =
    AsyncNotifierProvider<PaywallViewModel, SubscriptionState>(
      PaywallViewModel.new,
    );
