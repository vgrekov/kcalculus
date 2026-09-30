import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/settings/widgets/action_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/settings_group.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class SubscriptionScreen extends StatelessWidget with WidgetMessenger {
  const SubscriptionScreen({
    super.key,
    required this.appUserId,
  });

  final String appUserId;

  void _copyAppUserId(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: appUserId));

    if (context.mounted) {
      showNotification(context, l10n(context).messageCopiedToClipboard);
    }
  }

  void _openCustomerCenter() async {
    await RevenueCatUI.presentCustomerCenter();
  }

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).settingPremiumTitle,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: listStyle?.horizontalGap ?? 0,
            vertical: listStyle?.verticalGap ?? 0,
          ),
          child: SettingsGroup(
            children: [
              ActionSettingTile(
                onTap: () {
                  _copyAppUserId(context);
                },
                title: l10n(context).settingAppUserIdTitle,
                subtitle: appUserId,
                leadingIcon: Icons.fingerprint,
                trailingIcon: Icons.copy,
              ),
              ActionSettingTile(
                onTap: _openCustomerCenter,
                title: l10n(context).settingCustomerCenterTitle,
                subtitle: l10n(context).settingCustomerCenterSubitle,
                leadingIcon: Icons.credit_score,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
