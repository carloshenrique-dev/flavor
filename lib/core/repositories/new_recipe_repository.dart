import '../models/recipes.dart';

abstract interface class NewRecipeRepository {
  Future<bool> add(Recipes recipe);
}
