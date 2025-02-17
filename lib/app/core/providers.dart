import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/app/pages/home_page/home_page_viewmodel_provider.dart';
import '../../data/repositories/auth_repository.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';


final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = ref.read(firebaseAuthProvider);
  return AuthRepositoryImpl(auth);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LoginUseCase(authRepository);
});

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return RegisterUseCase(authRepository);
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(authRepository);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}); 

final homePageViewmodelProvider = StateNotifierProvider<HomePageViewmodel, AsyncValue<void>>((ref) {
  return HomePageViewmodel(ref.read(logoutUseCaseProvider));
});

