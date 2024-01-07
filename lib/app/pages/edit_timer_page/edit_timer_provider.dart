import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

part 'edit_timer_provider.g.dart';

@riverpod
class EditTimer extends _$EditTimer {
  @override
  FutureOr<void> build() {
  }

  Future<void> publishViaMqtt(Timer timerData, String endpoint) async {
    final mqttClient = ref.read(mqttClientProvider);
    state = const AsyncLoading();

    final data = MqttClientPayloadBuilder();
    final jsonData = timerData.toJson();
    data.addString(jsonEncode(jsonData));
    state = await AsyncValue.guard(() => mqttClient.publish(endpoint,data));
    debugPrint("PUBLISH TEST: ${state}");
  }
}

