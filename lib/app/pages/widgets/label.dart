import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key, required this.label,
  });

final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: theme.primary,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)),
      ),
      child: Text(label,
          style: textTheme.labelLarge!.copyWith(color: theme.onPrimary)),
    );
  }
}