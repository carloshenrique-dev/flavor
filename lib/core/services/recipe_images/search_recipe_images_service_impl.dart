import 'package:flavor/core/models/photo_response.dart';

import '../../repositories/search_recipe_images_repository.dart';
import 'search_recipe_images_service.dart';

class SearchRecipeImagesServiceImpl implements SearchRecipeImagesService {
  final SearchRecipeImagesRepository _searchRecipeImagesRepository;

  SearchRecipeImagesServiceImpl({
    required SearchRecipeImagesRepository searchRecipeImagesRepository,
  }) : _searchRecipeImagesRepository = searchRecipeImagesRepository;

  @override
  Future<PhotoResponse> search(String value) async =>
      _searchRecipeImagesRepository.search(value);
}
