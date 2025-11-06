import 'package:flutter/material.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/ui/common/tags/deleted_tag.dart';
import 'package:kcalculus/ui/common/tags/recent_tag.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/string_ext.dart';

class EdiblePreviewItemHeader extends StatelessWidget {
  const EdiblePreviewItemHeader({
    super.key,
    required this.preview,
  });

  final EdiblePreview preview;

  String _buildLastEatenLabel(
    BuildContext context, {
    bool capitalize = false,
  }) {
    String? lastEatenOn;
    String? lastEatenAt;
    int? lastEatenDaysAgo;

    if (preview.lastEatenAt != null) {
      lastEatenOn = dt.formatDateLocal(context, preview.lastEatenAt!);
      lastEatenAt = dt.formatTimeLocal(context, preview.lastEatenAt!);

      final now = DateTime.now();
      lastEatenDaysAgo = preview.lastEatenAt!
          .copyWith(
            year: now.year,
            month: now.month,
            day: now.day,
          )
          .difference(preview.lastEatenAt!)
          .inDays;
    }

    final result = l10n(context).edibleLastEaten(
      '$lastEatenOn',
      '$lastEatenAt',
      '$lastEatenDaysAgo',
    );

    return capitalize ? result.capitalize() : result;
  }

  @override
  Widget build(BuildContext context) {
    final showEdibleType = preview.type != EdiblePreviewType.food;

    final showLastEaten = preview.type != EdiblePreviewType.usda;

    final locked = preview.type == EdiblePreviewType.usda;

    final deleted = preview.deletedAt != null;

    final recent = preview.isRecent;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (locked)
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Icon(
              Icons.lock_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              size: 12,
            ),
          ),
        if (deleted)
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: DeletedTag(),
          ),
        if (recent)
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: RecentTag(),
          ),
        if (showEdibleType)
          Text(
            preview.type.localName(l10n(context)),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
        if (showEdibleType && showLastEaten)
          Text(
            ' — ',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        if (showLastEaten)
          Text(
            _buildLastEatenLabel(
              context,
              capitalize: !showEdibleType,
            ),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
      ],
    );
  }
}
