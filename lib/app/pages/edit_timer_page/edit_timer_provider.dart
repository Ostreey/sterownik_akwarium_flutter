import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_slot_model/timer_slot_model.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

part 'edit_timer_provider.g.dart';

@riverpod
class EditTimer extends _$EditTimer {
  @override
  FutureOr<void> build() {}

  /// Zapisuje slot timera przez komendę `set_timer` (Faza 4).
  ///
  /// [endpoint] = `"<id>/<device>"`; wyłuskujemy z niego `<id>` i wysyłamy
  /// komendę na `"<id>/cmd/set_timer"` z payloadem zawierającym `device` + pola
  /// slotu. Firmware po zapisie odsyła odświeżoną listę na `001/timers/<device>`.
  Future<void> saveSlot({
    required String endpoint,
    required String device,
    required TimerSlotModel slot,
  }) async {
    final transport = ref.read(activeTransportProvider);
    state = const AsyncLoading();

    final i = endpoint.indexOf('/');
    final id = i < 0 ? endpoint : endpoint.substring(0, i);

    final payload = jsonEncode({
      "device": device,
      "i": slot.i,
      "repeat": slot.repeat,
      "week": slot.week,
      "on": {"h": slot.on.h, "m": slot.on.m, "s": slot.on.s},
      "off": {"h": slot.off.h, "m": slot.off.m, "s": slot.off.s},
      "speed": slot.speed,
    });

    state = await AsyncValue.guard(
        () => transport.sendCommand("$id/set_timer", payload));
    debugPrint("SET_TIMER: $state");
  }
}
