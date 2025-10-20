import 'package:flutter/material.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/ui/edibles/common/edible_previews/widgets/edible_preview_item_calorie_content.dart';
import 'package:kcalculus/ui/edibles/common/edible_previews/widgets/edible_preview_item_header.dart';
import 'package:kcalculus/ui/edibles/common/edible_stats.dart';

class EdiblePreviewItem extends StatelessWidget {
  const EdiblePreviewItem({
    super.key,
    required this.preview,
    required this.onSelectPreview,
  });

  final EdiblePreview preview;

  final void Function(EdiblePreview) onSelectPreview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectPreview(preview);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EdiblePreviewItemHeader(
                        preview: preview,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        preview.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (preview.nutritionFactsPreview != null)
                  EdiblePreviewItemCalorieContent(
                    nutritionFactsPreview: preview.nutritionFactsPreview!,
                  ),
              ],
            ),
            if (preview.description.isNotEmpty)
              Text(
                preview.description,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            if (preview.nutritionFactsPreview != null)
              EdibleStats(
                nutritionFactsPreview: preview.nutritionFactsPreview!,
              ),
          ],
        ),
      ),
    );
  }
}
