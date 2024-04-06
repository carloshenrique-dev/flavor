import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor/core/consts.dart';
import 'package:flavor/core/models/recipes.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final FirebaseFirestore _firestore;
  final GenerativeModel _generativeModel;

  SearchRepositoryImpl({
    required FirebaseFirestore firestore,
    required GenerativeModel generativeModel,
  })  : _firestore = firestore,
        _generativeModel = generativeModel;

  @override
  Future<List<Recipes>> search(String value) async {
    try {
      final CollectionReference collection =
          _firestore.collection(FirestoreCollections.recipes.name);

      Query query = collection.where('name', isEqualTo: value);

      QuerySnapshot querySnapshot = await query.get();

      // Access documents and convert to Recipe objects
      final recipes = querySnapshot.docs
          .map((documentSnapshot) =>
              Recipes.fromMap(documentSnapshot.data() as Map<String, dynamic>))
          .toList();

      return recipes;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<Recipes?> searchOnGemini(String value) async {
    try {
      final result = await _generativeModel.generateContent(
        [
          Content.multi({
            TextPart(
                'Generate a recipe according to the word provided: $value. Provide your response as a JSON object with the following schema: {"name": "", "modeOfPreparation": "", "ingredients": {"key": "value", "key": "value", "key": "value"}, "preparationTime": "", "levelOfDifficulty": ""}. Do not include any profanity in your response. Make sure there are no empty values in the ingredients, always provide quantities. Do not include any null value in your response, neither in keys nor in values in the JSON object returned. Provide the recipes in Brazilian Portuguese. Do not return your result as Markdown.')
          })
        ],
      );

      if (result.text != null) {
        String jsonString = result.text ?? "";
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return Recipes.fromJson(jsonMap);
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
    }
    return null;
  }
}
