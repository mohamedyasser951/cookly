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
        controller: PageController(viewportFraction: 0.90),
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: true,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                Assets.imagesRecipeBanner,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
