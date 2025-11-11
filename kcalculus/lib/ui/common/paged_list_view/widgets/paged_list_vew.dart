import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_data.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_empty.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_error.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_loading.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:logging/logging.dart';

final _log = Logger('PagedListView');

class PagedListView<Model> extends StatefulWidget {
  const PagedListView({
    super.key,
    required this.items,
    this.onLoadNextPage,
    this.onRefresh,
    required this.itemBuilder,
    this.noItemsMessage,
    this.onDeleteItem,
    this.deletableTest,
    this.confirmDeleteMessage,
    this.listStyle,
  });

  final FutureOr<List<Model>> items;

  final Future<List<Model>> Function()? onLoadNextPage;

  final Future<List<Model>> Function()? onRefresh;

  final Widget Function(BuildContext, Model) itemBuilder;

  final String? noItemsMessage;

  final void Function(Model)? onDeleteItem;

  final bool Function(Model)? deletableTest;

  final String? Function(Model)? confirmDeleteMessage;

  final ListStyle? listStyle;

  @override
  State<StatefulWidget> createState() {
    return _PagedListViewState<Model>();
  }
}

class _PagedListViewState<Model> extends State<PagedListView<Model>> {
  PageStorageBucket _pageStorageBucket = PageStorageBucket();

  Future<void> _refresh() async {
    await widget.onRefresh?.call().then((_) {
      _pageStorageBucket = PageStorageBucket();
    });
  }

  @override
  void didUpdateWidget(covariant PagedListView<Model> oldWidget) {
    if (widget.items is Future) {
      _pageStorageBucket = PageStorageBucket();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final content = Awaited(
      future: widget.items,
      loading: (_) => const PagedListLoading(),
      error: (context, error, stackTrace) {
        _log.severe('Failed to load data', error, stackTrace);

        return const PagedListError();
      },
      data: (context, data) => data?.isNotEmpty == true
          ? PagedListData(
              items: data!,
              itemBuilder: widget.itemBuilder,
              onLoadNextPage: widget.onLoadNextPage,
              onDeleteItem: widget.onDeleteItem,
              deletableTest: widget.deletableTest,
              confirmDeleteMessage: widget.confirmDeleteMessage,
              listStyle: widget.listStyle,
            )
          : PagedListEmpty(
              noItemsMessage: widget.noItemsMessage,
            ),
    );

    return PageStorage(
      bucket: _pageStorageBucket,
      child: widget.onRefresh == null
          ? content
          : RefreshIndicator(
              onRefresh: _refresh,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              color: Theme.of(context).colorScheme.primary,
              child: content,
            ),
    );
  }
}
