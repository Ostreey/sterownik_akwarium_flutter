import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase {
  final FirebaseAuth _auth;

  LoginUseCase(this._auth);

  Future<User?> execute(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }
} 