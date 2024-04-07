import 'package:flavor/core/consts.dart';
import 'package:flavor/core/models/recipes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeWidget extends StatelessWidget {
  final Recipes recipe;

  const RecipeWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(
          AppRoutes.recipeDetails.name,
          extra: recipe,
        );
      },
      title: recipe.name != ''
          ? Text(
              recipe.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          : null,
      contentPadding: EdgeInsets.zero,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (recipe.preparationTime != '')
            _mediumText(
              context: context,
              title: "Tempo de preparo: ",
              content: recipe.preparationTime,
            ),
          if (recipe.levelOfDifficulty != '')
            _mediumText(
              context: context,
              title: "Nível de dificuldade: ",
              content: recipe.levelOfDifficulty,
            ),
        ],
      ),
    );
  }

  Widget _mediumText({
    required BuildContext context,
    required String content,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
          Text(
            content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
