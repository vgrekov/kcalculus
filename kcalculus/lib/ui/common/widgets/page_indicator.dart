import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final PageController pageController;
  final int pageCount;

  PageIndicator({
    super.key,
    required this.pageController,
    required this.pageCount,
  }) {
    if (pageCount < 1) {
      throw 'There must be at least one page.';
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _PageIndicatorState();
  }
}

class _PageIndicatorState extends State<PageIndicator>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.pageCount,
      vsync: this,
    );

    widget.pageController.addListener(_onPageChanged);

    super.initState();
  }

  void _onPageChanged() {
    final page = widget.pageController.page;
    if (page != null) {
      final pageIndex = page.round();
      if (_tabController.index != pageIndex) {
        _tabController.index = pageIndex;
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();

    widget.pageController.removeListener(_onPageChanged);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            color: Theme.of(context).colorScheme.onSurface,
            onPressed: () {
              if (_tabController.index > 0) {
                widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              }
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: _tabController,
            color: Theme.of(context).colorScheme.surface,
            selectedColor: Theme.of(context).colorScheme.onSurface,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            color: Theme.of(context).colorScheme.onSurface,
            onPressed: () {
              if (_tabController.index < widget.pageCount - 1) {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              }
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
