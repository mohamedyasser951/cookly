import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesLoading,
      color: AppColors.primaryColor,
      height: 60.h,
      width: 60.w,
    );
  }
}
