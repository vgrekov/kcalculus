import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class EdibleAddFab extends StatefulWidget {
  const EdibleAddFab({
    super.key,
    required this.onAddFood,
    required this.onAddDish,
    this.animationDuration = const Duration(
      milliseconds: 100,
    ),
  });

  final void Function() onAddFood;

  final void Function() onAddDish;

  final Duration animationDuration;

  @override
  State<StatefulWidget> createState() => _EdibleAddFabState();
}

class _EdibleAddFabState extends State<EdibleAddFab> {
  bool _expanded = false;

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  void _addFood() {
    _toggleExpanded();
    widget.onAddFood();
  }

  void _addDish() {
    _toggleExpanded();
    widget.onAddDish();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    heightFactor: 1,
                    child: AnimatedSwitcher(
                      duration: widget.animationDuration,
                      transitionBuilder: (child, animation) {
                        return SizeTransition(
                          axis: Axis.horizontal,
                          sizeFactor: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                          child: child,
                        );
                      },
                      child: !_expanded
                          ? const SizedBox.shrink()
                          : FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topLeft: Radius.circular(32),
                                    bottomLeft: Radius.circular(32),
                                  ),
                                ),
                              ),
                              onPressed: _addFood,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Text(
                                  l10n(context).actionAddFood,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: 1,
                    child: AnimatedSwitcher(
                      duration: widget.animationDuration,
                      transitionBuilder: (child, animation) {
                        return SizeTransition(
                          axis: Axis.horizontal,
                          sizeFactor: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                          child: child,
                        );
                      },
                      child: !_expanded
                          ? const SizedBox.shrink()
                          : FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topRight: Radius.circular(32),
                                    bottomRight: Radius.circular(32),
                                  ),
                                ),
                              ),
                              onPressed: _addDish,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text(
                                  l10n(context).actionAddDish,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: _toggleExpanded,
            shape: const CircleBorder(),
            child: AnimatedSwitcher(
              duration: widget.animationDuration,
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(
                    begin: 0,
                    end: 0.25,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                key: ValueKey(_expanded),
                _expanded ? Icons.close : Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
