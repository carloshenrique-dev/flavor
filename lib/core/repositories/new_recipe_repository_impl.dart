import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/consts.dart';

import '../models/recipes.dart';
import '../repositories/new_recipe_repository.dart';

class NewRecipeRepositoryImpl implements NewRecipeRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  NewRecipeRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
  })  : _firestore = firestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<bool> add(Recipes recipe) async {
    try {
      final docReference = await _firestore
          .collection(FirestoreCollections.user.name)
          .where('email', isEqualTo: _firebaseAuth.currentUser!.email!)
          .get();
      print(docReference.docs.first.id);
      return false;
    } catch (e) {
      return false;
    }
  }
}
