import '../../models/recipes.dart';

abstract interface class SearchService {
  Future<List<Recipes>> search(String value);
  Future<Recipes?> searchOnGemini(String value);
  Future<List<Recipes>> getRecentRecipes();
}
