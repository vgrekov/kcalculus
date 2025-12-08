import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_colors.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_view_model.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _log = Logger('AgreementScreen');

class AgreementScreen extends ConsumerStatefulWidget {
  const AgreementScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AgreementScreenState();
  }
}

class _AgreementScreenState extends ConsumerState<AgreementScreen> {
  final _webViewController = WebViewController();

  late final AgreementColors _colors;

  late final Future<void> _agreementLoader;

  @override
  void initState() {
    _agreementLoader = Future.delayed(Duration.zero, _loadAgreement);

    super.initState();
  }

  void _loadAgreement() async {
    final backgroundColor = Theme.of(context).colorScheme.surface;

    final textColor = Theme.of(context).colorScheme.onSurface;

    _webViewController.setBackgroundColor(backgroundColor);

    _colors = AgreementColors(
      backgroundColor: backgroundColor,
      textColor: textColor,
    );

    final html = await ref.read(agreementViewModel(_colors));

    await _webViewController.loadHtmlString(html);
  }

  void _sign() {
    ref.read(agreementViewModel(_colors).notifier).sign();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).screenAgreement,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: Awaited(
        future: _agreementLoader,
        loading: (_) => const SizedBox(
          height: 40,
          child: Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        error: (_, error, stackTrace) {
          _log.severe('Failed to load the agreement', error, stackTrace);
          return Center(
            child: Text(
              l10n(context).messageUnknownError,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        },
        data: (_, _) => WebViewWidget(controller: _webViewController),
      ),
      bottomNavigationBar: Awaited(
        future: _agreementLoader,
        data: (context, _) => Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
          child: SizedBox(
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
              onPressed: _sign,
              child: Text(
                l10n(context).actionIAgree,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
