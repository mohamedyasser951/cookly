import 'package:cookly/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerBuilderView extends StatefulWidget {
  const BannerBuilderView({super.key});

  @override
  State<BannerBuilderView> createState() => _BannerBuilderViewState();
}

class _BannerBuilderViewState extends State<BannerBuilderView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(Assets.imagesRecipeBanner, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
