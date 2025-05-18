import 'package:cookly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> mealsType = ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Dessert'];

class MealsTypeBuilder extends StatelessWidget {
  const MealsTypeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: mealsType.length,
        itemBuilder:
            (context, index) => Container(
              padding: EdgeInsets.all(8.sp),
              margin: const EdgeInsets.only(right: 10),
              width: 100.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: const [BoxShadow(color: Colors.black26)],
              ),
              child: Center(
                child: Text(
                  mealsType[index],
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
      ),
    );
  }
}
