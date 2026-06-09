import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

part 'ph_edit_provider.g.dart';

@riverpod
class PhEdit extends _$PhEdit {
  // 5. override the [build] method to return a [FutureOr]
  @override
  FutureOr<void> build() {
    // 6. return a value (or do nothing if the return type is void)
  }

  Future<void> publish(
      String endpoint, String phSet, String phHisteresis) async {
    final transport = ref.read(activeTransportProvider);
    state = const AsyncLoading();
    final payload = "{\"setValue\":$phSet,\"histeresis\":$phHisteresis}";
    debugPrint("data sent now: $phSet + $phHisteresis");
    state =
        await AsyncValue.guard(() => transport.sendCommand(endpoint, payload));
    debugPrint("PUBLISH TEST: $state");
  }
}
