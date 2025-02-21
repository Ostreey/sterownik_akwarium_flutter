import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/app/core/result.dart';

abstract class AuthRepository {
  Future<Result<void>> logout();
  Future<Result<User?>> login(String email, String password);
  Future<Result<User?>> register(String email, String password);
  Stream<User?> get authStateChanges;
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;

  AuthRepositoryImpl(this._auth);

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<Result<void>> logout() async {
    try {
      await _auth.signOut();
      return  Result.success(null);
    } on FirebaseAuthException catch (e) {
      return Result.failure(_mapFirebaseError(e));
    } catch (e) {
      return  Result.failure('Wystąpił błąd podczas wylogowywania');
    }
  }

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

  @override
  Future<Result<User?>> register(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
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
      'email-already-in-use' => 'Sterownik o tym numerze jest już zarejestrowany',
      'weak-password' => 'Hasło jest za słabe',
      'network-request-failed' => 'Brak połączenia z internetem',
      'too-many-requests' => 'Zbyt wiele prób. Spróbuj ponownie później',
      'operation-not-allowed' => 'Operacja niedozwolona',
      _ => 'Wystąpił nieoczekiwany błąd'
    };
  }
} 