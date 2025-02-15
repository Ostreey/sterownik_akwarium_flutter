import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/app/core/result.dart';

abstract class AuthRepository {
  Future<Result<User?>> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;

  AuthRepositoryImpl(this._auth);

  @override
  Future<Result<User?>> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return Result.failure(_mapFirebaseError(e));
    } catch (e) {
      return Result.failure('Wystąpił nieoczekiwany błąd');
    }
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    return switch (e.code) {
      'user-not-found' => 'Nie znaleziono użytkownika o podanym adresie email',
      'invalid-credential' => 'Nieprawidłowe hasło',
      'invalid-email' => 'Nieprawidłowy adres email',
      _ => 'Wystąpił błąd podczas logowania'
    };
  }
} 