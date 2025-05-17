import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/presentation/cubit/recipes_cubit.dart';
import 'package:cookly/features/home/presentation/widgets/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesListViewBuilder extends StatelessWidget {
  final List<Recipe> recipes;
  const RecipesListViewBuilder({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: context.read<RecipesCubit>().scrollController,
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeItem(recipe: recipes[index]);
      },
    );
  }
}
