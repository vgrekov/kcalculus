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

  void _proceed() {
    ref.read(consentViewModel.notifier).saveSettings(
          crashlyticsEnabled: _crashlyticsEnabled,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  l10n(context).screenConsent,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                l10n(context).dataUsageMotivationMessage,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SwitchListTile(
                title: Text(
                  l10n(context).settingCrashReportingTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                value: _crashlyticsEnabled,
                onChanged: (value) {
                  setState(() {
                    _crashlyticsEnabled = value;
                  });
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: _proceed,
                  child: Text(
                    l10n(context).actionProceed,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
