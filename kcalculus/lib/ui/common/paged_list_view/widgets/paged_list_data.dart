import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_item.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_loader_item.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';

class PagedListData<Model> extends StatelessWidget {
  const PagedListData({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.nextPageLoader,
    this.onDeleteItem,
    this.deletableTest,
    this.confirmDeleteMessage,
    this.scrollController,
    this.listStyle,
  });

  final List<Model> items;

  final Widget Function(BuildContext, Model) itemBuilder;

  final Future<dynamic>? nextPageLoader;

  final void Function(Model)? onDeleteItem;

  final bool Function(Model)? deletableTest;

  final String? Function(Model)? confirmDeleteMessage;

  final ScrollController? scrollController;

  final ListStyle? listStyle;

  @override
  Widget build(BuildContext context) {
    final listStyle =
        this.listStyle ?? Theme.of(context).extension<ListStyle>();

    return CustomScrollView(
      controller: scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverList.separated(
          itemBuilder: (context, index) => PagedListItem(
            item: items[index],
            itemBuilder: itemBuilder,
            onDeleteItem: onDeleteItem,
            deletableTest: deletableTest,
            confirmDeleteMessage: confirmDeleteMessage,
            listStyle: listStyle,
          ),
          separatorBuilder: (_, __) => (listStyle?.verticalGap ?? 0) > 0
              ? SizedBox(height: listStyle!.verticalGap)
              : const SizedBox.shrink(),
          itemCount: items.length,
        ),
        PagedListLoaderItem(pageLoader: nextPageLoader),
      ],
    );
  }
}
