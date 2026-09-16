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
    required this.isCancelled,
    this.expirationDate,
    this.billingIssueDetectedAt,
  });

  final bool isTrial;

  final bool isCancelled;

  final DateTime? expirationDate;

  final DateTime? billingIssueDetectedAt;
}
