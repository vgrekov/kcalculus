import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';

class PagedListView<Model> extends StatefulWidget {
  const PagedListView({
    super.key,
    required this.items,
    this.itemsLoader,
    required this.itemBuilder,
    this.noItemsMessage,
    this.confirmDeleteMessage,
    this.onDeleteItem,
    this.onRefresh,
    this.onLoadNextPage,
  });

  final List<Model> items;

  final Future<dynamic>? itemsLoader;

  final Widget Function(BuildContext, int) itemBuilder;

  final String? noItemsMessage;

  final String? confirmDeleteMessage;

  final void Function(Model)? onDeleteItem;

  final Future<dynamic> Function()? onRefresh;

  final Future<dynamic> Function()? onLoadNextPage;

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

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  void _onScroll() {
    if (widget.onLoadNextPage != null) {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isNextPageLoading) {
        _loadNextPage();
      }
    }
  }

  void _loadNextPage() {
    _isNextPageLoading = true;
    setState(() {
      _nextPageLoader = widget.onLoadNextPage?.call().whenComplete(() {
        _isNextPageLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    super.dispose();
  }

  Widget _buildPageLoaderItem(Future<dynamic>? pageLoader) {
    return Awaited(
      future: pageLoader,
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
      error: (context, _) => SizedBox(
        height: 40,
        child: Center(
          child: Text(
            l10n(context).messageUnknownError,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    final listView = ListView.builder(
      controller: _scrollController,
      itemCount: widget.items.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.items.length) {
          return _buildPageLoaderItem(_nextPageLoader);
        }

        final item = widget.items[index];
        final itemWidget = widget.itemBuilder(context, index);
        return widget.onDeleteItem == null
            ? itemWidget
            : Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return await showConfirmation(
                        widget.confirmDeleteMessage ??
                            l10n(context).messageDeletionConfirmation,
                      ) ??
                      false;
                },
                onDismissed: (direction) {
                  widget.onDeleteItem!(item);
                },
                background: Container(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.delete,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
                child: itemWidget,
              );
      },
    );

    return widget.onRefresh == null
        ? listView
        : RefreshIndicator(
            onRefresh: widget.onRefresh!,
            child: listView,
          );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemsLoader == null) {
      return _buildListView(context);
    }

    return Awaited(
      future: widget.itemsLoader,
      loading: (_) => const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
      error: (context, _) => Center(
        child: Text(
          l10n(context).messageUnknownError,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      ),
      data: (context, _) {
        if (widget.items.isEmpty) {
          return Center(
            child: Text(
              widget.noItemsMessage ?? l10n(context).messageNoData,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          );
        } else {
          return _buildListView(context);
        }
      },
    );
  }
}
