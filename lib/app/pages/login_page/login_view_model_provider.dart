import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../../core/providers.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, AsyncValue<void>>((ref) {
  final loginUseCase = ref.read(loginUseCaseProvider);
  return LoginViewModel(loginUseCase);
});

class LoginViewModel extends StateNotifier<AsyncValue<void>> {
  final LoginUseCase _loginUseCase;
  final formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel(this._loginUseCase) : super(const AsyncData(null));

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    if (formKey.currentState!.validate()) {
      state = const AsyncLoading();

      final result = await _loginUseCase.execute(
        loginController.text,
        passwordController.text,
      );

      result.fold(
        (user) => state = const AsyncData(null),
        (error) => state = AsyncError(error, StackTrace.current),
      );
    }
  }
}
