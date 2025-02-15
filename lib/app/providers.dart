import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../domain/usecases/login_usecase.dart';

// Define the provider for FirebaseAuth
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Define the provider for LoginUseCase
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final auth = ref.read(firebaseAuthProvider);
  return LoginUseCase(auth);
}); 