import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';

class CustomTimerPicker extends StatefulWidget {
  const CustomTimerPicker(
      {super.key, required this.timerData, required this.timeChanged});

  @override
  _CustomTimerPickerState createState() => _CustomTimerPickerState();

  final Time timerData;
  final Function(Time) timeChanged;
}

class _CustomTimerPickerState extends State<CustomTimerPicker> {
  late int _hour;

  late int _minute;

  late int _second;

  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _secondController;

  @override
  void initState() {
    super.initState();
    _hour = widget.timerData.h;
    _minute = widget.timerData.m;
    _second = widget.timerData.s;
    _hourController = FixedExtentScrollController(initialItem: _hour);
    _minuteController = FixedExtentScrollController(initialItem: _minute);
    _secondController = FixedExtentScrollController(initialItem: _second);
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPicker(_hourController, 0, 23,
            (newValue) => setState(() {
              _hour = newValue;
              widget.timeChanged(Time(h: _hour, m: _minute, s: _second));
            })),
        Text(':', style: TextStyle(fontSize: 32)),
        _buildPicker(_minuteController, 0, 59,
            (newValue) => setState(() {
              _minute = newValue;
              widget.timeChanged(Time(h: _hour, m: _minute, s: _second));
            })),
        Text(':', style: TextStyle(fontSize: 32)),
        _buildPicker(_secondController, 0, 59,
            (newValue) => setState(() {
              _second = newValue;
              widget.timeChanged(Time(h: _hour, m: _minute, s: _second));
            })),
      ],
    );
  }

  Widget _buildPicker(FixedExtentScrollController controller, int minValue,
      int maxValue, ValueChanged<int> onChanged) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.2,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 43,
        useMagnifier: true,
        magnification: 1.6,
        perspective: 0.002,
        diameterRatio: 1.5,
        offAxisFraction: -0.1,
        onSelectedItemChanged: onChanged,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final theme = Theme.of(context);
            final isSelected = controller.selectedItem == index;
            return Center(
              child: Text(
                '${minValue + index}'.padLeft(2, '0'),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                    ),
              ),
            );
          },
          childCount: maxValue - minValue + 1,
        ),
      ),
    );
  }
}
