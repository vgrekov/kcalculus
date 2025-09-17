import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/string_ext.dart';

class EdibleSearchResultsItemHeader extends StatelessWidget {
  const EdibleSearchResultsItemHeader({
    super.key,
    required this.searchResult,
  });

  final EdibleSearchResult searchResult;

  String _buildLastEatenLabel(
    BuildContext context, {
    bool capitalize = false,
  }) {
    String? lastEatenOn;
    String? lastEatenAt;
    int? lastEatenDaysAgo;

    if (searchResult.lastEatenAt != null) {
      lastEatenOn = dt.formatDateLocal(context, searchResult.lastEatenAt!);
      lastEatenAt = dt.formatTimeLocal(context, searchResult.lastEatenAt!);

      final now = DateTime.now();
      lastEatenDaysAgo = searchResult.lastEatenAt!
          .copyWith(
            year: now.year,
            month: now.month,
            day: now.day,
          )
          .difference(searchResult.lastEatenAt!)
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
    final showEdibleType = searchResult.type != EdibleSearchResultType.food;

    final showLastEaten = searchResult.type != EdibleSearchResultType.usda;

    final locked = searchResult.type == EdibleSearchResultType.usda;

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
        if (showEdibleType)
          Text(
            searchResult.type.localName(l10n(context)),
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
