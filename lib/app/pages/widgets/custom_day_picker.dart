import 'package:flutter/material.dart';

class CustomDayPicker extends StatefulWidget {
  @override
  _CustomDayPickerState createState() => _CustomDayPickerState();
}

class _CustomDayPickerState extends State<CustomDayPicker> {
  List<bool> _selections = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
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
              labelStyle: _selections[index]
                  ? textTheme.labelLarge!.copyWith(color: Colors.white) // Text style when selected
                  : textTheme.labelLarge!.copyWith(color: colorTheme.onSecondaryContainer), // Text style when not selected

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              label: Text(day),
              selected: _selections[index],
              onSelected: (bool selected) {
                setState(() {
                  _selections[index] = selected;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
