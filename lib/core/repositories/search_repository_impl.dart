import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor/core/consts.dart';
import 'package:flavor/core/models/recipes.dart';

import 'search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final FirebaseFirestore _firestore;

  SearchRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<Recipes>> search() async {
    try {
      final recipes = _firestore
          .collection(FirestoreCollections.recipes.name)
          .withConverter<Recipes>(
            fromFirestore: (snapshot, _) => Recipes.fromMap(snapshot.data()!),
            toFirestore: (recipes, _) => recipes.toMap(),
          );

      List<QueryDocumentSnapshot<Recipes>> recipesList =
          await recipes.get().then((snapshot) => snapshot.docs);

      if (recipesList.isNotEmpty) {
        return recipesList.map((value) => value.data()).toList();
      }

      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
