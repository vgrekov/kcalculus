import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_data.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_empty.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_error.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_loading.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
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

class _PagedListViewState<Model> extends State<PagedListView<Model>>
    with StateMessenger {
  final _scrollController = ScrollController();

  Future<dynamic>? _nextPageLoader;

  bool _isNextPageLoading = false;

  bool _isEndReached = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
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

  Future<void> _refresh() async {
    await widget.onRefresh?.call().then((_) {
      _isEndReached = false;
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
              nextPageLoader: _nextPageLoader,
              onDeleteItem: widget.onDeleteItem,
              deletableTest: widget.deletableTest,
              confirmDeleteMessage: widget.confirmDeleteMessage,
              scrollController: _scrollController,
              listStyle: widget.listStyle,
            )
          : PagedListEmpty(
              noItemsMessage: widget.noItemsMessage,
            ),
    );

    return widget.onRefresh == null
        ? content
        : RefreshIndicator(
            onRefresh: _refresh,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            color: Theme.of(context).colorScheme.primary,
            child: content,
          );
  }
}
