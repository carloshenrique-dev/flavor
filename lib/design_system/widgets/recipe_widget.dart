import 'package:flavor/core/models/recipes.dart';
import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final Recipes recipe;

  const RecipeWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
          /*leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            isFromSavedRepositories ? repositoryModel.htmlUrl : user.avatarUrl!,
            height: 56.0,
            width: 56.0,
            fit: BoxFit.cover,
          ),
        ),*/
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
          minVerticalPadding: 0,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.preparationTime != '')
                _mediumText(
                  context,
                  recipe.preparationTime,
                ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    size: 16.0,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(width: 4.0),
                  _mediumText(context,
                      'sdahdsdhsadsasda' //repositoryModel.stargazersCount,
                      ),
                ],
              ),
            ],
          ),
          trailing: /*recipe != null
            ? */
              IconButton(
            onPressed: () {},
            icon: const Icon(
                //repositoryModel.isSaved! == 0
                //  ? Icons.favorite_border
                //:
                Icons.favorite,
                color: Colors
                    .red //repositoryModel.isSaved! == 0 ? null : Colors.red,
                ),
          )
          //: null,
          ),
    );
  }

  Widget _mediumText(BuildContext context, String text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
    );
  }
}
