import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/paywall/view_models/paywall_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

final _log = Logger('PaywallScreen');

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(paywallViewModel);

    return stateAsync.when(
      data: (state) => Center(
        child: PaywallView(),
      ),
      error: (error, stackTrace) {
        _log.severe('Failed to load subscription state', error, stackTrace);
        return Center(
          child: Text(
            l10n(context).messageUnknownError,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        );
      },
      loading: () => const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
