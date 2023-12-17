import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_page.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_day_picker.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_time_picker.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  static final  pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'timer',
    child: TimerPage(),
  );

  @override
  Widget build(BuildContext context) {
    final state = true;
    final colorTheme = Theme.of(context).colorScheme;
    final  textTheme = Theme.of(context).textTheme;
    return Scaffold(
          appBar: AppBar(
            title:  Row(
              children: [
                Text("LED"),
                SizedBox(width: 9,),
                Icon(state? Icons.check : Icons.cancel_outlined,
                  color: state ? Colors.green : Colors.red,
                  size: 35,)
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(

                  children: [
                    Row(
                      children: [
                        Text("Timer", style: textTheme.titleLarge,),
                        SizedBox(width: 6,),
                        Icon(Icons.access_time_rounded,size: 30, color: colorTheme.primary,),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              context.pushNamed(EditTimer.pageConfig.name);
                            },
                            child: Icon(Icons.edit, size: 30, color: colorTheme.primary,)),
                      ],
                    ),
                    SizedBox(height: 15,),
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
                            SizedBox(height: 12,),
                            Text("Włącz", style: textTheme.titleLarge!.copyWith(color: colorTheme.onSecondaryContainer),),
                            SizedBox(height: 8,),
                            Text("15 : 45 : 32", style: textTheme.displayMedium!.copyWith(color: colorTheme.primary),),
                            SizedBox(height: 12,),
                            Text("Wyłącz", style: textTheme.titleLarge!.copyWith(color: colorTheme.onSecondaryContainer),),
                            SizedBox(height: 8,),
                            Text("15 : 48 : 32", style: textTheme.displayMedium!.copyWith(color: colorTheme.primary),),
                            SizedBox(height: 20,),
                            Row(
                           children: [
                             Text("Czas pracy", style: textTheme.titleLarge,),
                             SizedBox(width: 20),
                             Text("1h 5min 0s", style: textTheme.titleLarge!.copyWith(color: colorTheme.primary),),
                           ],
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
    );
  }
}
