import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

part 'water_temp_edit_provider.g.dart';

@riverpod
class Publish extends _$Publish {
  // 5. override the [build] method to return a [FutureOr]
  @override
  FutureOr<void> build() {
    // 6. return a value (or do nothing if the return type is void)
  }

  Future<void> publish(String endpoint, String minValue, String maxValue,
      [String frequency = "0"]) async {
    // 7. read the transport using ref
    final transport = ref.read(activeTransportProvider);
    // 8. set the loading state
    state = const AsyncLoading();
    // 9. sign in and update the state (data or error)

    final payload =
        "{\"minValue\":$minValue,\"maxValue\":$maxValue, \"freq\":$frequency}";
    state =
        await AsyncValue.guard(() => transport.sendCommand(endpoint, payload));
    debugPrint("PUBLISH TEST: $state");
  }
}
