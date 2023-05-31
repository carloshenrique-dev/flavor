import '../models/recipes.dart';
import '../repositories/new_recipe_repository.dart';
import 'new_recipe_service.dart';

class NewRecipeServiceImpl implements NewRecipeService {
  final NewRecipeRepository _newRecipeRepository;

  NewRecipeServiceImpl({
    required NewRecipeRepository newRecipeRepository,
  }) : _newRecipeRepository = newRecipeRepository;

  @override
  Future<bool> add(Recipes recipe) async => _newRecipeRepository.add(recipe);
}
