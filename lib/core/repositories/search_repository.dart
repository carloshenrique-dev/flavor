import '../models/recipes.dart';

abstract interface class SearchRepository {
  Future<List<Recipes>> search(String word);
}
