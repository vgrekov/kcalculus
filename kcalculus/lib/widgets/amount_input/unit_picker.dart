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
    if (widget.initialValue != null) {
      _measure = widget.initialValue!.measure;
      _system = widget.initialValue!.system ?? _defaultSystem;
    } else {
      _measure = _defaultMeasure;
      _system = _defaultSystem;
    }

    super.initState();
  }

  void _selectMeasure(int index) {
    setState(() {
      _measure = Measure.values[index];
    });
  }

  void _selectSystem(int index) {
    setState(() {
      _system = MeasureSystem.values[index];
    });
  }

  void _selectUnit(Unit unit) {
    Navigator.of(context).pop(unit);
  }

  @override
  Widget build(BuildContext context) {
    final units = Unit.values.where((u) {
      return u.measure == _measure && (u.system == null || u.system == _system);
    }).toList();

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
                  initialPage: Measure.values.indexOf(_measure),
                ),
                itemCount: Measure.values.length,
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
                        Measure.values[index].displayName,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                    ),
                  );
                },
                onPageChanged: _selectMeasure,
              ),
            ),
            SizedBox(
              height: 40,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: MeasureSystem.values.indexOf(_system),
                ),
                itemCount: MeasureSystem.values.length,
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
                        MeasureSystem.values[index].displayName,
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
                onPageChanged: _selectSystem,
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
                          unit.displayName,
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
