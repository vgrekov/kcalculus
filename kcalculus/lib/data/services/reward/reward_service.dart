import 'package:kcalculus/utils/datetime.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewardService {
  static const _kRewardDate = 'rewardDate';

  const RewardService();

  Future<DateTime> reward() async {
    final now = DateTime.now();

    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_kRewardDate, formatISO8601(now));

    return now;
  }

  Future<DateTime?> getRewardDate() async {
    final prefs = await SharedPreferences.getInstance();

    final rewardDateStr = prefs.getString(_kRewardDate);

    return rewardDateStr != null ? parseISO8601(rewardDateStr) : null;
  }
}
