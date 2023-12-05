import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/widgets/circular_icon.dart';

class Devices extends StatelessWidget {
  const Devices({super.key});

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'Urządzenia',
    child: Devices(),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
            child: Column(
              children: [
                Text("Pompy", style: textTheme!.titleLarge,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: colorTheme.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: colorTheme.outlineVariant),
                  ),
                  child: Row(
                    children: [
                      CircularIcon(value: "1",),
                      Text("70%", style: textTheme.titleLarge!.copyWith(color: colorTheme.primary),)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
