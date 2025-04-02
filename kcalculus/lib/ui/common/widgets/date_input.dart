import 'package:flutter/material.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class DateInput extends StatefulWidget {
  const DateInput({
    super.key,
    required this.controller,
  });

  final DateInputController controller;

  @override
  State<StatefulWidget> createState() {
    return _DateInputState();
  }
}

class _DateInputState extends State<DateInput> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void _pickDate() async {
    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: widget.controller.dateTime,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );

    if (date != null) {
      setState(() {
        widget.controller._dateTime = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
        child: Text(
          dt.formatDateLocal(context, widget.controller.dateTime),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    );
  }
}

class DateInputController extends ChangeNotifier {
  DateInputController({
    DateTime? dateTime,
  }) : _dateTime = dateTime ?? DateTime.now();

  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;

    notifyListeners();
  }
}
