import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

part 'edit_timer_provider.g.dart';

@riverpod
class EditTimer extends _$EditTimer {
  @override
  FutureOr<void> build() {}

  Future<void> publishViaMqtt(Timer timerData, String endpoint) async {
    final transport = ref.read(activeTransportProvider);
    state = const AsyncLoading();

    final payload = jsonEncode(timerData.toJson());
    state =
        await AsyncValue.guard(() => transport.sendCommand(endpoint, payload));
    debugPrint("PUBLISH TEST: $state");
  }
}
