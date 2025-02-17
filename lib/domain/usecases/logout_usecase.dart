import 'package:sterownik_akwarium/app/core/result.dart';
import 'package:sterownik_akwarium/data/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Result<void>> execute() async {
    return _authRepository.logout();
  }
} 