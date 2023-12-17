import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.isLoading, required this.text, required this.onPressed});

  final Function onPressed;
  final bool? isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: themeColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: () => onPressed(),
        child: isLoading ?? false
            ?  SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(color: Colors.white))
            : Text(text, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),));
  }
}
