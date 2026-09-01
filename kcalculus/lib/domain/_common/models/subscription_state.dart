sealed class SubscriptionState {
  const SubscriptionState({
    required this.appUserId,
  });

  final String appUserId;
}

class SubscriptionInactive extends SubscriptionState {
  const SubscriptionInactive({
    required super.appUserId,
  });
}

class SubscriptionActive extends SubscriptionState {
  const SubscriptionActive({
    required super.appUserId,
    required this.isTrial,
    this.expirationDate,
  });

  final bool isTrial;

  final DateTime? expirationDate;
}
