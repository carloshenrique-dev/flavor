import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor/core/models/user_data.dart';
import 'package:flavor/core/repositories/login_repository.dart';

import '../consts.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseFirestore _firestore;

  LoginRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<bool> login(UserData user) async {
    try {
      // Create a CollectionReference called users that references the firestore collection
      CollectionReference users =
          _firestore.collection(FirestoreCollections.user.name);

      // Call the user's CollectionReference to add a new user
      return await users.add(user.toMap()).then((value) => true);
    } catch (e) {
      return false;
    }
  }
}
