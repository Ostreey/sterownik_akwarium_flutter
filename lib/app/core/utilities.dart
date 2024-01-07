import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';

String getTimeDifference(Time timerOn, Time timerOff) {
  DateTime time1 = DateTime(2020, 1, 1, timerOn.h, timerOn.m, timerOn.s);
  DateTime time2 = DateTime(2020, 1, 1, timerOff.h, timerOff.m, timerOff.s);

  Duration difference = time2.difference(time1);

  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);
  int seconds = difference.inSeconds.remainder(60);

  return "${hours}h ${minutes}min ${seconds}s";
}

int convertSelectedDaysToInt(List<bool> selectedDays) {
  int result = 0;
  for (int i = 0; i < selectedDays.length; i++) {
    if (selectedDays[i]) {
      result |= (1 << i);
    }
  }
  return result;
}
