sealed class AccessLevel {
  const AccessLevel();
}

class AccessLevelFree extends AccessLevel {
  const AccessLevelFree();
}

class AccessLevelFreeNoAds extends AccessLevel {
  const AccessLevelFreeNoAds();
}

class AccessLevelAdSupportedPremium extends AccessLevel {
  const AccessLevelAdSupportedPremium(this.expirationDate);

  final DateTime expirationDate;
}

class AccessLevelPremium extends AccessLevel {
  const AccessLevelPremium();
}
