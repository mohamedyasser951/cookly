import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookly/core/constants/assets.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/presentation/pages/recipes_details_screen.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularRecipesItem extends StatelessWidget {
  final Recipe recipe;
  const PopularRecipesItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.w,
      height: 230.h,
      child: GestureDetector(
        onTap: () {
          appNavigator.push(screen: RecipeDetailsScreen(recipe: recipe));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    height: 150.h,
                    width: double.maxFinite,
                    imageUrl: recipe.image,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                AppSpacer(heightRatio: 0.4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    recipe.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSpacer(heightRatio: 0.4),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesCalroies),
                    SizedBox(width: 2),
                    Text(
                      '${recipe.caloriesPerServing} Kcal',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.imagesTimer),
                    SizedBox(width: 2),
                    Text(
                      '${recipe.cookTimeMinutes} min',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
