import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../core/providers.dart';

final registerViewModelProvider = StateNotifierProvider.autoDispose<RegisterViewModel, AsyncValue<void>>((ref) {
  final registerUseCase = ref.read(registerUseCaseProvider);
  return RegisterViewModel(registerUseCase);
});

class RegisterViewModel extends StateNotifier<AsyncValue<void>> {
  final RegisterUseCase _registerUseCase;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterViewModel(this._registerUseCase) : super(const AsyncData(null));

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleRegister() async {
    if (formKey.currentState!.validate()) {
      state = const AsyncLoading();
      
      final result = await _registerUseCase.execute(
        emailController.text,
        passwordController.text,
      );

      result.fold(
        (user) => state = const AsyncData(null),
        (error) => state = AsyncError(error, StackTrace.current),
      );
    }
  }
} 