import '../../models/recipes.dart';

abstract interface class NewRecipeService {
  Future<bool> add(Recipes recipe);
}
