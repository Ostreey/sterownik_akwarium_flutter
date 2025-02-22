import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/app/core/result.dart';
import 'package:sterownik_akwarium/data/repositories/firebase_repository/firebase_repository.dart';
import 'package:sterownik_akwarium/data/repositories/firebase_repository/models/controller_model.dart';

class FetchControllersUseCase {
  final FirebaseRepository _firebaseRepository;
  final FirebaseAuth _auth;

  FetchControllersUseCase(this._firebaseRepository, this._auth);

  Future<Result<List<Controller>>> execute() async {
    final user = _auth.currentUser;
    if (user == null) {
      return Result.failure('User not logged in');
    }
    return await _firebaseRepository.fetchControllers(user.uid);
  }
}
