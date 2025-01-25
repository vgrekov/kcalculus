import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class MealCalendar extends StatelessWidget {
  final DateTime initialDate;
  final bool expanded;
  final void Function(DateTime) onSelectDate;

  const MealCalendar({
    super.key,
    required this.initialDate,
    required this.expanded,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          axis: Axis.vertical,
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
      child: expanded
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Theme.of(context).colorScheme.secondary,
                        onPrimary: Theme.of(context).colorScheme.onSecondary,
                        onSurface:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
                child: Stack(
                  children: [
                    CalendarDatePicker(
                      initialDate: initialDate,
                      firstDate: DateTime(now.year - 1, now.month, now.day),
                      lastDate: now,
                      onDateChanged: onSelectDate,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: OutlinedButton(
                          onPressed: () {
                            onSelectDate(DateTime.now());
                          },
                          child: Text(
                            l10n(context).actionToday,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
