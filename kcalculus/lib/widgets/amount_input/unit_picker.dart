import 'package:flutter/material.dart';
import 'package:kcalculus/models/units.dart';

const _defaultMeasure = Measure.mass;
const _defaultSystem = MeasureSystem.metric;

class UnitPicker extends StatefulWidget {
  final Unit? initialValue;

  const UnitPicker({
    super.key,
    this.initialValue,
  });

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
    final measures = Measure.pickableValues;

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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Container(
        height: 350,
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
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        measures[index].localName(context),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
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
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        systems[index].localName(context),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
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
              height: 250,
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
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _selectUnit(unit);
                        },
                        child: Text(
                          unit.localName(context),
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
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
