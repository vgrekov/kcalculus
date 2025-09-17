import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final _log = Logger('PagedListView');

class PagedListView<Model> extends StatefulWidget {
  const PagedListView({
    super.key,
    required this.items,
    this.itemsLoader,
    required this.itemBuilder,
    this.noItemsMessage,
    this.confirmDeleteMessage,
    this.onDeleteItem,
    this.deletableTest,
    this.onRefresh,
    this.onLoadNextPage,
    this.itemBorderRadius,
    this.horizontalGap = 0,
    this.verticalGap = 0,
  });

  final List<Model> items;

  final Future<dynamic>? itemsLoader;

  final Widget Function(BuildContext, Model) itemBuilder;

  final String? noItemsMessage;

  final String? Function(Model)? confirmDeleteMessage;

  final void Function(Model)? onDeleteItem;

  final bool Function(Model)? deletableTest;

  final Future<dynamic> Function()? onRefresh;

  final Future<bool> Function()? onLoadNextPage;

  final BorderRadiusGeometry? itemBorderRadius;

  final double horizontalGap;

  final double verticalGap;

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
    if (widget.items.isEmpty) {
      return;
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      return;
    }

    if (widget.onLoadNextPage != null) {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isNextPageLoading &&
          !_isEndReached) {
        _loadNextPage();
      }
    }
  }

  void _loadNextPage() {
    _isNextPageLoading = true;
    setState(() {
      _nextPageLoader = widget.onLoadNextPage?.call().then((hasData) {
        _isEndReached = !hasData;
      }).whenComplete(() {
        _isNextPageLoading = false;
      });
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

  Widget _buildListItem(BuildContext context, Model item) {
    final itemWidget = widget.itemBuilder(context, item);
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.itemBorderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      margin: widget.horizontalGap > 0
          ? EdgeInsets.symmetric(
              horizontal: widget.horizontalGap,
            )
          : null,
      child: widget.onDeleteItem == null ||
              !(widget.deletableTest?.call(item) ?? true)
          ? itemWidget
          : Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) async {
                return await showConfirmation(
                      widget.confirmDeleteMessage?.call(item) ??
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
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              child: itemWidget,
            ),
    );
  }

  Widget _buildPageLoaderItem(Future<dynamic>? pageLoader) {
    return SliverToBoxAdapter(
      child: Awaited(
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
        error: (context, _, __) => SizedBox(
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
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) =>
          _buildListItem(context, widget.items[index]),
      separatorBuilder: (_, __) => widget.verticalGap > 0
          ? SizedBox(height: widget.verticalGap)
          : const SizedBox.shrink(),
      itemCount: widget.items.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollView = CustomScrollView(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        Awaited(
          future: widget.itemsLoader,
          loading: (_) => SliverFillRemaining(
            hasScrollBody: false,
            child: const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          error: (context, error, stackTrace) {
            _log.severe('Failed to load data', error, stackTrace);

            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  l10n(context).messageUnknownError,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
            );
          },
          data: (context, _) {
            if (widget.items.isEmpty) {
              _isEndReached = true;

              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    widget.noItemsMessage ?? l10n(context).messageNoData,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              );
            } else {
              _isEndReached = false;

              return _buildListView(context);
            }
          },
        ),
        _buildPageLoaderItem(_nextPageLoader),
      ],
    );

    return widget.onRefresh == null
        ? scrollView
        : RefreshIndicator(
            onRefresh: _refresh,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            color: Theme.of(context).colorScheme.primary,
            child: scrollView,
          );
  }
}
