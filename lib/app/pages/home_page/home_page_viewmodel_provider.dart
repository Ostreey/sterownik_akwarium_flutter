import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/domain/usecases/logout_usecase.dart';

class HomePageViewmodel extends StateNotifier<AsyncValue<void>> {
  final LogoutUseCase _logoutUseCase;

  HomePageViewmodel(this._logoutUseCase) : super(const AsyncData(null));

  Future<void> logout() async {
    state = const AsyncLoading();
    final result = await _logoutUseCase.execute();
    result.fold(
      (user) => state = const AsyncData(null),
      (error) => state = AsyncError(error, StackTrace.current),
    );
  }
}
