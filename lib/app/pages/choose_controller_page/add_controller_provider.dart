import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sterownik_akwarium/app/core/providers.dart';
import 'package:sterownik_akwarium/app/pages/choose_controller_page/choose_controller_view_model_provider.dart';
import 'package:sterownik_akwarium/data/repositories/firebase_repository/models/controller_model.dart';

part 'add_controller_provider.g.dart';

@riverpod
class AddControllerNotifier extends _$AddControllerNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> addController(String name, String serialNumber) async {
    state = const AsyncValue.loading();

    final addUseCase = ref.read(addControllerUseCaseProvider);
    final controller = Controller(id: serialNumber, name: name);
    final result = await addUseCase.execute(controller);

    result.fold(
      (_) {
        state = const AsyncValue.data(null);
        ref.invalidate(controllersProvider);
      },
      (error) => state = AsyncValue.error(error, StackTrace.current),
    );
  }
}
