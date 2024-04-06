import '../../models/recipes.dart';

abstract interface class NewRecipeService {
  Future<void> add(Recipes recipe);
}
