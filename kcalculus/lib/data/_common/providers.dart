import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/app_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
