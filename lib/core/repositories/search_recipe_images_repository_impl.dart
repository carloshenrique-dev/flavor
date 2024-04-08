import 'dart:convert';

import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/core/services/remote_config_service.dart';
import 'package:http/http.dart' as http;

import '../models/photo_response.dart';
import 'search_recipe_images_repository.dart';

class SearchRecipeImagesRepositoryImpl implements SearchRecipeImagesRepository {
  static const String _baseUrl = "https://api.pexels.com/v1";

  @override
  Future<PhotoResponse> search(String query) async {
    try {
      final url = '$_baseUrl/search?query=$query&per_page=3&page=1';
      final remoteConfig = di.get<FirebaseRemoteConfigService>();

      final response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Authorization": remoteConfig.pexelsKey
      });

      if (response.statusCode == 200) {
        return PhotoResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}

//unsplash