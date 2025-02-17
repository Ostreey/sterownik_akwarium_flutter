import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/data/repositories/auth_repository.dart';
import 'package:sterownik_akwarium/app/core/result.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<Result<User?>> execute(String email, String password) async {
    if (!_isValidEmail(email)) {
      return Result.failure('Nieprawidłowy format adresu email');
    }
    return _authRepository.register(email, password);
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
} 