import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sterownik_akwarium/app/core/result.dart';

import 'models/controller_model.dart';

class FirebaseRepository {
  final FirebaseFirestore _firestore;

  FirebaseRepository(this._firestore);

  Future<Result<List<Controller>>> fetchControllers(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('controllers')
          .get();

      final controllers =
          snapshot.docs.map((doc) => Controller.fromDocument(doc)).toList();
      return Result.success(controllers);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<void>> addNewController(
      String userId, Controller controller) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('controllers')
          .add(controller.toMap());

      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
