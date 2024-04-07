import 'dart:developer';

import 'package:flavor/core/models/photo_response.dart';
import 'package:flavor/core/models/recipes.dart';
import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/core/services/recipe_images/search_recipe_images_service.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shimmer/shimmer.dart';

class RecipeDetails extends StatefulWidget {
  final Recipes recipe;

  const RecipeDetails({
    super.key,
    required this.recipe,
  });

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  final searchImagesService = di.get<SearchRecipeImagesService>();
  PhotoResponse? _photoResponse;

  @override
  void initState() {
    super.initState();
    _loadPhotoResponse();
  }

  Future<void> _loadPhotoResponse() async {
    try {
      final response = await searchImagesService.search(widget.recipe.name);
      setState(() {
        _photoResponse = response;
      });
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.recipe.name,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            if (_photoResponse == null)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            else if (_photoResponse!.photos.isEmpty)
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: RiveAnimation.asset(
                      'assets/animations/no_images_found.riv',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Text(
                    'Nenhuma imagem encontrada :(',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            else
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _photoResponse!.photos.length,
                  itemBuilder: (ctx, index) {
                    if (_photoResponse!.photos[index].src['original'] != null) {
                      return Image.network(
                        _photoResponse!.photos[index].src['original']!,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Shimmer.fromColors(
                              baseColor: Colors.black.withOpacity(0.6),
                              highlightColor: Colors.black.withOpacity(0.8),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      (MediaQuery.of(context).size.width / 2) -
                                          10,
                                  minHeight: 200,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ingredientes',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final ingredientKey =
                    widget.recipe.ingredients.keys.elementAt(index);
                final capitalizedKey =
                    '${ingredientKey.substring(0, 1).toUpperCase()}${ingredientKey.substring(1)}';
                return Text(
                  '$capitalizedKey: ${widget.recipe.ingredients.values.elementAt(index)}',
                  style: const TextStyle(fontSize: 16),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: widget.recipe.ingredients.length,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Modo de preparo',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.recipe.modeOfPreparation,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
