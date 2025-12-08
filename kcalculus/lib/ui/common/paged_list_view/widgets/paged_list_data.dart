import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_item.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_loader_item.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';

class PagedListData<Model> extends StatefulWidget {
  const PagedListData({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onLoadNextPage,
    this.onDeleteItem,
    this.deletableTest,
    this.confirmDeleteMessage,
    this.listStyle,
  });

  final List<Model> items;

  final Widget Function(BuildContext, Model) itemBuilder;

  final Future<List<Model>> Function()? onLoadNextPage;

  final void Function(Model)? onDeleteItem;

  final bool Function(Model)? deletableTest;

  final String? Function(Model)? confirmDeleteMessage;

  final ListStyle? listStyle;

  @override
  State<StatefulWidget> createState() {
    return _PagedListDataState<Model>();
  }
}

class _PagedListDataState<Model> extends State<PagedListData<Model>> {
  final _scrollController = ScrollController();

  Future<dynamic>? _nextPageLoader = Future.value(null);

  bool _isNextPageLoading = false;

  bool _isEndReached = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant PagedListData<Model> oldWidget) {
    if (_itemsChanged(oldWidget.items)) {
      _isEndReached = false;
    }

    super.didUpdateWidget(oldWidget);
  }

  bool _itemsChanged(List<Model> oldItems) {
    if (widget.items.length < oldItems.length) {
      return true;
    }

    return !listEquals(
      widget.items.sublist(0, oldItems.length),
      oldItems,
    );
  }

  void _onScroll() {
    if (widget.onLoadNextPage == null ||
        _isNextPageLoading ||
        _isEndReached ||
        !_scrollController.hasClients ||
        _scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
      return;
    }

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _loadNextPage();
    }
  }

  void _loadNextPage() {
    _isNextPageLoading = true;
    setState(() {
      _nextPageLoader = widget.onLoadNextPage?.call().then(
        (data) {
          _isEndReached = data.isEmpty;
        },
      ).whenComplete(
        () {
          Future.delayed(
            const Duration(milliseconds: 100),
            () {
              _isNextPageLoading = false;
            },
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listStyle =
        widget.listStyle ?? Theme.of(context).extension<ListStyle>();

    Widget? verticalGap;
    if ((listStyle?.verticalGap ?? 0) > 0) {
      verticalGap = SliverToBoxAdapter(
        child: SizedBox(
          height: listStyle?.verticalGap,
        ),
      );
    }

    return CustomScrollView(
      key: const PageStorageKey('paged-list-scroll'),
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        if (verticalGap != null) verticalGap,
        SliverList.separated(
          itemCount: widget.items.length,
          itemBuilder: (context, index) => PagedListItem(
            item: widget.items[index],
            itemBuilder: widget.itemBuilder,
            onDeleteItem: widget.onDeleteItem,
            deletableTest: widget.deletableTest,
            confirmDeleteMessage: widget.confirmDeleteMessage,
            listStyle: listStyle,
          ),
          separatorBuilder: (_, _) => (listStyle?.verticalGap ?? 0) > 0
              ? SizedBox(height: listStyle!.verticalGap)
              : const SizedBox.shrink(),
        ),
        if (verticalGap != null) verticalGap,
        PagedListLoaderItem(pageLoader: _nextPageLoader),
      ],
    );
  }
}
