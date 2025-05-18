import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/presentation/pages/recipes_details_screen.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appNavigator.push(screen: RecipeDetailsScreen(recipe: recipe));
      },
      child: Card(
        elevation: 6,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4, top: 5),
                child: CachedNetworkImage(
                  height: 160,
                  width: double.infinity,
                  imageUrl: recipe.image,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    recipe.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textScaler: const TextScaler.linear(0.84),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined, color: Colors.black12),
                      const SizedBox(width: 2.0),
                      Text(
                        "${recipe.cookTimeMinutes!} min",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 2.0),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 4.0),
                  Text(
                    "${recipe.rating!} rate",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    recipe.cuisine!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
            ],
          ),
        ),
      ),
    );
  }
}
