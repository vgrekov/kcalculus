import 'package:flutter/material.dart';
import 'package:kcalculus/domain/import/models/import_report.dart';
import 'package:kcalculus/ui/import/widgets/import_report_view.dart';
import 'package:kcalculus/utils/l10n.dart';

class ImportSucceededView extends StatelessWidget {
  const ImportSucceededView({
    super.key,
    this.report,
    required this.onDone,
  });

  final ImportReport? report;

  final void Function() onDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              l10n(context).importSucceededTitle,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Text(
            report != null
                ? l10n(context).importSucceededMessageWithReport
                : l10n(context).importSucceededMessageNoReport,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          if (report != null) ...[
            const SizedBox(height: 32),
            ImportReportView(report: report!),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onDone,
              child: Text(
                l10n(context).actionDone,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
