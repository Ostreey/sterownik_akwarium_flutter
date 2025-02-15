import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../providers.dart';

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<void>>((ref) {
  final loginUseCase = ref.read(loginUseCaseProvider);
  return LoginViewModel(loginUseCase);
});

class LoginViewModel extends StateNotifier<AsyncValue<void>> {
  final LoginUseCase _loginUseCase;
  final formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel(this._loginUseCase) : super(const AsyncData(null));

  Future<void> handleLogin() async {
    if (formKey.currentState!.validate()) {
      state = const AsyncLoading();
      try {
        await _loginUseCase.execute(
          loginController.text,
          passwordController.text,
        );
        state = const AsyncData(null);
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Wystąpił błąd podczas logowania';
        if (e.code == 'user-not-found') {
          errorMessage = 'Nie znaleziono użytkownika o podanym adresie email';
        } else if (e.code == 'invalid-credential') {
          errorMessage = 'Nieprawidłowe hasło';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Nieprawidłowy adres email';
        }
        state = AsyncError(errorMessage, StackTrace.current);
        debugPrint(errorMessage);
      } catch (e) {
        state = AsyncError(e, StackTrace.current);
        debugPrint(e.toString());
      }
    }
  }
} 