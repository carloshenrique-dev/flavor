import 'package:flavor/core/models/photo_response.dart';

abstract interface class SearchRecipeImagesRepository {
  Future<PhotoResponse> search(String value);
}
