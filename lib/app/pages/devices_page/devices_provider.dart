
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/domain/models/devices_model/devices_model.dart';




class DevicesNotifier extends StateNotifier<DevicesModel>{
  DevicesNotifier() : super(const DevicesModel());

  void updateDevices(DevicesModel newState) {
    state = newState;
  }
}

final devicesProvider = StateNotifierProvider<DevicesNotifier, DevicesModel>((ref) {
  return DevicesNotifier();
});