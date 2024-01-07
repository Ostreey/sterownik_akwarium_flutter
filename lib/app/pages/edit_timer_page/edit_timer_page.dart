import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/core/utilities.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_page_model/timer_page_model.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_provider.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_time_picker.dart';

import '../widgets/custom_day_picker.dart';

class EditTimerPage extends ConsumerStatefulWidget {
  const EditTimerPage({super.key, this.data});

  static const pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'edit_timer',
    child: EditTimerPage(),
  );
  final TimerPageModel? data;

  @override
  _EditTimerPageState createState() => _EditTimerPageState();
}

class _EditTimerPageState extends ConsumerState<EditTimerPage> {
  List<bool> selectedDays = List.generate(7, (_) => false);
  Timer timer = Timer();

  void _updateSelectedDays(List<bool> selections) {
    setState(() {
      selectedDays = selections;
      timer = timer.copyWith(
        week: convertSelectedDaysToInt(selectedDays),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    timer = widget.data!.timerDeviceModel.timer;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Ustaw timer ${widget.data!.appBarTitle}")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: colorTheme.background,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1, color: colorTheme.outlineVariant),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDayPicker(
                            weekdays: timer.week,
                            isEditable: true,
                            onDaysChanged: _updateSelectedDays),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Włącz",
                          style: textTheme.titleLarge!
                              .copyWith(color: colorTheme.onSecondaryContainer),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomTimerPicker(
                          timerData: timer.on,
                          timeChanged: (time) {
                          setState(() {
                            timer = timer.copyWith(
                              on: time,
                            );
                          });
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Wyłącz",
                          style: textTheme.titleLarge!
                              .copyWith(color: colorTheme.onSecondaryContainer),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomTimerPicker(
                          timerData: timer.off,
                          timeChanged: (time) {
                            setState(() {
                              timer = timer.copyWith(
                                off: time,
                              );
                            });
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Text(
                              "Czas pracy",
                              style: textTheme.titleLarge,
                            ),
                            SizedBox(width: 20),
                            Text(
                              getTimeDifference(
                                  timer.on,
                                  timer.off),
                              style: textTheme.titleLarge!
                                  .copyWith(color: colorTheme.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        text: "Ustaw",
                        onPressed: () {
                          debugPrint("Hour: ${timer.on.h}, Minute: ${timer.on.m}, Second: ${timer.on.s}, Week: ${timer.week}, hourOff: ${timer.off.h}, minuteOff: ${timer.off.m}, secondOff: ${timer.off.s}");
                          if (widget.data!.timerDeviceModel.timer != timer) {
                            ref
                                .read(editTimerProvider.notifier)
                                .publishViaMqtt(timer, widget.data!.endpoint);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Nie wprowadzono żadnych zmian'),
                              duration: Duration(seconds: 3),
                            ));
                          }
                        })
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
