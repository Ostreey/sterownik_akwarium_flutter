import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/firebase_repository/models/controller_model.dart';
import '../../../domain/usecases/add_controller_usecase.dart';
import '../../../domain/usecases/fetch_controllers_usecase.dart';
import '../../core/providers.dart';

final chooseControllerViewModelProvider = StateNotifierProvider<
    ChooseControllerViewModel, AsyncValue<List<Controller>>>((ref) {
  final fetchControllersUseCase = ref.read(fetchControllersUseCaseProvider);
  final addControllerUseCase = ref.read(addControllerUseCaseProvider);
  return ChooseControllerViewModel(
      fetchControllersUseCase, addControllerUseCase);
});

class ChooseControllerViewModel
    extends StateNotifier<AsyncValue<List<Controller>>> {
  final FetchControllersUseCase _fetchControllersUseCase;
  final AddControllerUseCase _addControllerUseCase;
  String? selectedControllerId;

  ChooseControllerViewModel(
      this._fetchControllersUseCase, this._addControllerUseCase)
      : super(const AsyncLoading()) {
    _fetchControllers();
  }

  Future<void> _fetchControllers() async {
    final result = await _fetchControllersUseCase.execute();
    result.fold(
      (controllers) => state = AsyncData(controllers),
      (error) => state = AsyncError(error, StackTrace.current),
    );
  }

  void selectController(String controllerId) {
    selectedControllerId = controllerId;
    // Additional logic for selecting a controller can be added here
  }

  Future<void> addNewController(String name, String id) async {
    final controller = Controller(id: id, name: name);
    final result = await _addControllerUseCase.execute(controller);

    result.fold(
      (_) => _fetchControllers(), // Refresh the list after adding
      (error) => state = AsyncError(error, StackTrace.current),
    );
  }
}
