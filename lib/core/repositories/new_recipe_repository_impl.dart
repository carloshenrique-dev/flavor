import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor/core/consts.dart';

import '../models/recipes.dart';
import '../repositories/new_recipe_repository.dart';

class NewRecipeRepositoryImpl implements NewRecipeRepository {
  final FirebaseFirestore _firestore;

  NewRecipeRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<bool> add(Recipes recipe) async {
    try {
      // Create a CollectionReference called users that references the firestore collection
      CollectionReference recipes =
          _firestore.collection(FirestoreCollections.recipes.name);

      // Call the user's CollectionReference to add a new user
      return await recipes.add(recipe.toMap()).then((value) => true);
    } catch (e) {
      return false;
    }
  }
}
