
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final String labelName;

  const CircularIcon({Key? key, required this.labelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 40, // Adjust width and height as needed for your icon size
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.primary, // Blue background color for the circle
      ),
      child: Center(
        child: Text(labelName, style: textTheme.labelLarge!.copyWith(color: Colors.white))
      ),
    );
  }
}