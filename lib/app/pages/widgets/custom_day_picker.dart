import 'package:flutter/material.dart';

class CustomDayPicker extends StatefulWidget {
  const CustomDayPicker({super.key, required this.weekdays, required this.isEditable, this.onDaysChanged});

  @override
  _CustomDayPickerState createState() => _CustomDayPickerState();
  final int weekdays;
  final bool isEditable;
  final Function(List<bool>)? onDaysChanged; // Callback to pass selections

}

class _CustomDayPickerState extends State<CustomDayPicker> {
  List<bool> _selections = List.generate(7, (_) => false);

  @override
  void initState() {
    getBoolDays();
    super.initState();
  }
  void getBoolDays() {
    for (int i = 0; i < 7; i++) {
      _selections[i] = (widget.weekdays & (1 << i)) != 0;
    }
  }


  @override
  Widget build(BuildContext context) {

    void _onChipSelected(bool selected, int index) {
      setState(() {
        _selections[index] = selected;
        widget.onDaysChanged?.call(_selections);
      });
    }

    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      alignment: Alignment.center, // Centers the Wrap widget horizontally
      child: Wrap(
        alignment: WrapAlignment.center, // Centers the FilterChip widgets within the Wrap widget
        spacing: 8.0, // Spacing between the chips
        runSpacing: 4.0, // Spacing between the lines of chips
        children: List<Widget>.generate(
          7,
              (int index) {
            String day = '';
            switch (index) {
              case 0:
                day = 'Poniedziałek';
                break;
              case 1:
                day = 'Wtorek';
                break;
              case 2:
                day = 'Środa';
                break;
              case 3:
                day = 'Czwartek';
                break;
              case 4:
                day = 'Piątek';
                break;
              case 5:
                day = 'Sobota';
                break;
              case 6:
                day = 'Niedziela';
                break;
            }
            return FilterChip(

              selectedColor: colorTheme.primary,
              checkmarkColor: Colors.white,
              backgroundColor: colorTheme.primaryContainer,
              labelStyle: textTheme.labelLarge!.copyWith(
                color: _selections[index] ? Colors.white : colorTheme.onSecondaryContainer,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              label: Text(day),
              selected: _selections[index],
              onSelected: widget.isEditable ? (bool selected) => _onChipSelected(selected, index) : null,
            );
          },
        ),
      ),
    );
  }
}
