import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:cookly/features/home/presentation/widgets/banner_builder_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("What are you cooking Today?"),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.notifications),
              ),
              AppSpacer(heightRatio: 0.5),
              Text("Featured Recipes"),
              AppSpacer(heightRatio: 0.5),
              BannerBuilderView(),
              AppSpacer(heightRatio: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Recipes"),
                  Text(
                    "See all",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
