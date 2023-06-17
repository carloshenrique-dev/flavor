import 'package:flavor/core/services/recipe/search_service.dart';

import '../../models/recipes.dart';
import '../../repositories/search_repository.dart';

class SearchServiceImpl implements SearchService {
  final SearchRepository _searchRepository;

  SearchServiceImpl({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  @override
  Future<List<Recipes>> search() async => _searchRepository.search();
}
