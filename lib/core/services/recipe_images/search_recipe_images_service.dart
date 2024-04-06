import 'package:flavor/core/models/photo_response.dart';

abstract interface class SearchRecipeImagesService {
  Future<PhotoResponse> search(String value);
}
