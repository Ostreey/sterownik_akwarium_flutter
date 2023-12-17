import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_time_picker.dart';

import '../widgets/custom_day_picker.dart';

class EditTimer extends StatelessWidget {
  const EditTimer({Key? key}) : super(key: key);

  static const  pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'edit_timer',
    child: EditTimer(),
  );

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final  textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Ustaw timer LED")
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child:  Column(
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: colorTheme.background,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: colorTheme.outlineVariant),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDayPicker(),
                        SizedBox(height: 8,),
                        Text("Włącz", style: textTheme.titleLarge!.copyWith(color: colorTheme.onSecondaryContainer),),
                        SizedBox(height: 8,),
                        CustomTimerPicker(),
                        SizedBox(height: 12,),
                        Text("Wyłącz", style: textTheme.titleLarge!.copyWith(color: colorTheme.onSecondaryContainer),),
                        SizedBox(height: 8,),
                        CustomTimerPicker(),
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            Text("Czas pracy", style: textTheme.titleLarge,),
                            SizedBox(width: 20),
                            Text("1h 5min 0s", style: textTheme.titleLarge!.copyWith(color: colorTheme.primary),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(text: "Ustaw", onPressed: (){})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
