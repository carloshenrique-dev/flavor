import '../../models/recipes.dart';

abstract interface class SearchService {
  Future<List<Recipes>> search();
}
