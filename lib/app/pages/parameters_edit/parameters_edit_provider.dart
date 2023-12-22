import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

part 'parameters_edit_provider.g.dart';

@riverpod
class Publish extends _$Publish {
  // 5. override the [build] method to return a [FutureOr]
  @override
  FutureOr<void> build() {
    // 6. return a value (or do nothing if the return type is void)
  }

  Future<void> publish(String endpoint, String minValue, String maxValue) async {
    // 7. read the repository using ref
    final mqttClient = ref.read(mqttClientProvider);
    // 8. set the loading state
    state = const AsyncLoading();
    // 9. sign in and update the state (data or error)
    state = await AsyncValue.guard(() => mqttClient.publish(endpoint, minValue, maxValue));
    debugPrint("PUBLISH TEST: ${state}");
  }
}

