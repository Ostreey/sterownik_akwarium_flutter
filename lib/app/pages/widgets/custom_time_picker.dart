import 'package:flutter/material.dart';

class CustomTimerPicker extends StatefulWidget {
  @override
  _CustomTimerPickerState createState() => _CustomTimerPickerState();
}

class _CustomTimerPickerState extends State<CustomTimerPicker> {
  int _hour = DateTime.now().hour;
  int _minute = DateTime.now().minute;
  int _second = DateTime.now().second;
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _secondController;

  @override
  void initState() {
    super.initState();
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
        _buildPicker(_hourController, 0, 23, (newValue) => setState(() => _hour = newValue)),
        Text(':', style: TextStyle(fontSize: 32)),
        _buildPicker(_minuteController, 0, 59, (newValue) => setState(() => _minute = newValue)),
        Text(':', style: TextStyle(fontSize: 32)),
        _buildPicker(_secondController, 0, 59, (newValue) => setState(() => _second = newValue)),
      ],
    );
  }

  Widget _buildPicker(FixedExtentScrollController controller, int minValue, int maxValue, ValueChanged<int> onChanged) {
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
                  color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline,
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
