import '../models/recipes.dart';

abstract interface class NewRecipeRepository {
  Future<void> add(Recipes recipe);
}
