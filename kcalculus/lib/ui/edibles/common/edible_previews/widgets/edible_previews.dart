import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_vew.dart';
import 'package:kcalculus/ui/edibles/common/edible_previews/widgets/edible_preview_item.dart';

class EdiblePreviews extends StatelessWidget {
  const EdiblePreviews({
    super.key,
    required this.items,
    this.onLoadNextPage,
    this.onRefresh,
    required this.onSelectItem,
    this.noItemsMessage,
    this.confirmDeleteMessage,
    this.onDeleteItem,
  });

  final FutureOr<List<EdiblePreview>> items;

  final Future<List<EdiblePreview>> Function()? onLoadNextPage;

  final Future<List<EdiblePreview>> Function()? onRefresh;

  final void Function(EdiblePreview) onSelectItem;

  final String? noItemsMessage;

  final String? Function(EdiblePreview)? confirmDeleteMessage;

  final void Function(EdiblePreview)? onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return PagedListView<EdiblePreview>(
      items: items,
      onLoadNextPage: onLoadNextPage,
      onRefresh: onRefresh,
      noItemsMessage: noItemsMessage,
      onDeleteItem: onDeleteItem,
      deletableTest: (item) =>
          item.type != EdiblePreviewType.usda && item.deletedAt == null,
      confirmDeleteMessage: confirmDeleteMessage,
      itemBuilder: (context, item) => EdiblePreviewItem(
        preview: item,
        onSelectPreview: item.deletedAt == null ? onSelectItem : (_) {},
      ),
    );
  }
}
