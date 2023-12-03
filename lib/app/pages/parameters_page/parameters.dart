import 'package:flutter/material.dart';

import '../../core/page_config.dart';

class Parameters extends StatelessWidget {
  const Parameters({super.key});

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.bar_chart,
    name: 'Parametry',
    child: Parameters(),
  );
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final textTheme =  Theme.of(context).textTheme;
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width/15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    width: 1,
                    color: theme.outlineVariant
                ),
              ),
              child: Row(
                children: [
                  CircularIcon(iconData: Icons.chair),
                  SizedBox(width: 12,),
                  Text("24.5 'C", style:
                 textTheme.titleLarge!.copyWith(color: theme.primary),),
                ],
              ),
            )
          ],
        ),
      )
    ));
  }
}


class CircularIcon extends StatelessWidget {
  final IconData iconData;

  const CircularIcon({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 40, // Adjust width and height as needed for your icon size
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.primary, // Blue background color for the circle
      ),
      child: Center(
        child: Icon(
          iconData,
          color: Colors.white, // Color of the icon
          size: 24, // Size of the icon
        ),
      ),
    );
  }
}