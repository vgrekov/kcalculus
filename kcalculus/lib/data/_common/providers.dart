import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/app_info.dart';
import 'package:kcalculus/domain/_common/models/device_info.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appInfoProvider = FutureProvider<AppInfo>(
  (ref) async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppInfo(
      appName: packageInfo.appName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    );
  },
);

final deviceInfoProvider = FutureProvider<DeviceInfo>(
  (ref) async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final info = await deviceInfoPlugin.iosInfo;

      return DeviceInfo(
        platform: DevicePlatform.iOS,
        systemVersion: info.systemVersion,
        model: info.modelName,
      );
    } else {
      final info = await deviceInfoPlugin.androidInfo;

      return DeviceInfo(
        platform: DevicePlatform.iOS,
        systemVersion: info.version.release,
        model: info.model,
      );
    }
  },
);

const _kDeviceIdPref = "deviceId";

final deviceIdProvider = FutureProvider<String>(
  (ref) async {
    final prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString(_kDeviceIdPref);

    if (id == null) {
      id = generateId();
      await prefs.setString(_kDeviceIdPref, id);
    }

    return id;
  },
);
