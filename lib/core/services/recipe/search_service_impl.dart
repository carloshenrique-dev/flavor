import 'package:flavor/core/services/recipe/search_service.dart';

import '../../models/recipes.dart';
import '../../repositories/search_repository.dart';

class SearchServiceImpl implements SearchService {
  final SearchRepository _searchRepository;

  SearchServiceImpl({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  @override
  Future<List<Recipes>> search(String value) async =>
      _searchRepository.search(value);

  @override
  Future<Recipes?> searchOnGemini(String value) async =>
      _searchRepository.searchOnGemini(value);

  @override
  Future<List<Recipes>> getRecentRecipes() async =>
      _searchRepository.getRecentRecipes();
}
