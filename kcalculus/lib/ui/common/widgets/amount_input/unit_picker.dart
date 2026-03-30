import 'package:flutter/material.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/utils/l10n.dart';

const _defaultMeasure = Measure.mass;
const _defaultSystem = MeasureSystem.metric;

class UnitPicker extends StatefulWidget {
  const UnitPicker({
    super.key,
    this.initialValue,
    this.fixedMeasure,
  });

  final Unit? initialValue;

  final Measure? fixedMeasure;

  @override
  State<StatefulWidget> createState() {
    return _UnitPickerState();
  }
}

class _UnitPickerState extends State<UnitPicker> {
  late Measure _measure;

  late MeasureSystem _system;

  @override
  void initState() {
    _measure = widget.initialValue?.measure ?? _defaultMeasure;
    _system = widget.initialValue?.system ?? _defaultSystem;

    super.initState();
  }

  void _selectUnit(Unit unit) {
    Navigator.of(context).pop(unit);
  }

  @override
  Widget build(BuildContext context) {
    final measures = widget.fixedMeasure != null
        ? [widget.fixedMeasure!]
        : Measure.pickableValues;

    final systems = Unit.values
        .where((u) => u.measure == _measure)
        .map((u) => u.system)
        .toSet()
        .toList();
    if (!systems.contains(_system)) {
      _system = systems.first;
    }

    final units = Unit.values
        .where((u) => u.measure == _measure && u.system == _system)
        .toList();

    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Container(
        height: 356,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: measures.indexOf(_measure),
                ),
                itemCount: measures.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainer,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: Center(
                      child: Text(
                        measures[index].localName(l10n(context)),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _measure = Measure.values[index];
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: systems.indexOf(_system),
                ),
                itemCount: systems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainer,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: Center(
                      child: Text(
                        systems[index].localName(l10n(context)),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _system = MeasureSystem.values[index];
                  });
                },
              ),
            ),
            SizedBox(
              height: 248,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    for (final unit in units)
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          _selectUnit(unit);
                        },
                        child: Text(
                          unit.localName(l10n(context)),
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                              ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
