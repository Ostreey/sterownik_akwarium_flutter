import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../../data/repositories/firebase_repository/models/controller_model.dart';
import '../../core/providers.dart';
import '../../core/services/preferences_service.dart';

part 'choose_controller_view_model_provider.g.dart';


@riverpod
Future<List<Controller>> controllers(Ref ref) async {
  final fetchUseCase = ref.read(fetchControllersUseCaseProvider);
  final result = await fetchUseCase.execute();
  final controllers = result.fold((controllers) => controllers, (error) => throw error);
  
  await ref.read(selectedControllerProvider.notifier).loadFromPreferences();
  return controllers;
}

@Riverpod(keepAlive: true)
class SelectedController extends _$SelectedController {
  @override
  Controller? build() => null;

  void select(Controller controller) => state = controller;
  void clear() => state = null;

  Future<void> saveToPreferences() async {
    if (state == null) return;
    
    final prefs = PreferencesService();
    await prefs.setString(PreferenceKey.controllerId, state!.id);
    await prefs.setString(PreferenceKey.controllerName, state!.name);
  }

  Future<void> loadFromPreferences() async {
    final prefs = PreferencesService();
    final id = await prefs.getString(PreferenceKey.controllerId);
    final name = await prefs.getString(PreferenceKey.controllerName);
    
    if (id != null && name != null) {
      state = Controller(id: id, name: name);
    }
  }
}
