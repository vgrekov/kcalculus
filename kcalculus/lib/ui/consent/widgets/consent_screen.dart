import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/consent/view_models/consent_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';

class ConsentScreen extends ConsumerStatefulWidget {
  const ConsentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ConsentScreenState();
  }
}

class _ConsentScreenState extends ConsumerState<ConsentScreen> {
  bool _crashlyticsEnabled = true;

  bool _analyticsEnabled = true;

  void _proceed() {
    ref
        .read(consentViewModel.notifier)
        .saveSettings(
          crashlyticsEnabled: _crashlyticsEnabled,
          analyticsEnabled: _analyticsEnabled,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).screenConsent,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              l10n(context).dataUsageMotivationMessage,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SwitchListTile(
                  title: Text(
                    l10n(context).settingCrashReportingTitle,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  value: _crashlyticsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _crashlyticsEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    l10n(context).settingAnalyticsTitle,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  value: _analyticsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _analyticsEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _proceed,
            child: Text(
              l10n(context).actionProceed,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
