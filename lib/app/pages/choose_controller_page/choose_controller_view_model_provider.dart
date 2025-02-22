import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/firebase_repository/models/controller_model.dart';
import '../../core/providers.dart';

part 'choose_controller_view_model_provider.g.dart';

@riverpod
Future<List<Controller>> controllers(Ref ref) async {
  final fetchUseCase = ref.read(fetchControllersUseCaseProvider);
  final result = await fetchUseCase.execute();
  return result.fold((controllers) => controllers, (error) => throw error);
}

@riverpod
class SelectedController extends _$SelectedController {
  @override
  Controller? build() => null;

  void select(Controller controller) => state = controller;
  void clear() => state = null;
}

// class Controllers extends _$Controllers {
//   @override
//   FutureOr<List<Controller>> build() async {
//     final fetchUseCase = ref.read(fetchControllersUseCaseProvider);
//     final result = await fetchUseCase.execute();
//     return result.fold(
//       (controllers) => controllers,
//       (error) => throw error,
//     );
//   }

//   Future<void> addNewController(String name, String serialNumber) async {
//     final addUseCase = ref.read(addControllerUseCaseProvider);
//     final controller = Controller(id: serialNumber, name: name);
//     final result = await addUseCase.execute(controller);

//     result.fold(
//       (_) => ref.invalidateSelf(), // Refresh the list
//       (error) => throw error,
//     );
//   }
// }
