import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/core/constants/size_config.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:cookly/features/home/presentation/pages/all_recipes_page.dart';
import 'package:cookly/features/home/presentation/widgets/banner_builder_view.dart';
import 'package:cookly/features/home/presentation/widgets/meals_type_builder.dart';
import 'package:cookly/features/home/presentation/widgets/popular_recipes_builder.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SizeConfig.paddingSymmetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "What are you\ncooking Today?",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.notifications_none_sharp),
                    ),
                  ],
                ),
                AppSpacer(heightRatio: 0.4),
                Text(
                  "Featured Recipes",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                AppSpacer(heightRatio: 0.4),
                BannerBuilderView(),
                AppSpacer(heightRatio: 0.4),
                Text(
                  "Category",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                AppSpacer(heightRatio: 0.4),
                MealsTypeBuilder(),
                AppSpacer(heightRatio: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Recipes",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        appNavigator.push(screen: const AllRecipesScreen());
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                PopularRecipesBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
