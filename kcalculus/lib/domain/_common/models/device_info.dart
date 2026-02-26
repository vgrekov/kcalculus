enum DevicePlatform {
  iOS,
  android,
}

class DeviceInfo {
  const DeviceInfo({
    required this.platform,
    required this.systemVersion,
    required this.model,
  });

  final DevicePlatform platform;

  final String systemVersion;

  final String model;
}
