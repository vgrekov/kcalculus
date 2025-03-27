import 'package:flutter/material.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class TimeInput extends StatefulWidget {
  const TimeInput({
    super.key,
    required this.controller,
  });

  final TimeInputController controller;

  @override
  State<StatefulWidget> createState() {
    return _TimeInputState();
  }
}

class _TimeInputState extends State<TimeInput> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(widget.controller.dateTime),
    );

    if (time != null) {
      setState(() {
        widget.controller._dateTime = widget.controller.dateTime.copyWith(
          hour: time.hour,
          minute: time.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickTime,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
        child: Text(
          dt.formatTimeLocal(context, widget.controller.dateTime),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    );
  }
}

class TimeInputController extends ChangeNotifier {
  TimeInputController({
    DateTime? dateTime,
  }) : _dateTime = dateTime ?? DateTime.now();

  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;

    notifyListeners();
  }
}
