
import 'package:cookly/core/constants/assets.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllAndSearchScreen extends StatelessWidget {
  final String title;
  final String hintText;
  const SeeAllAndSearchScreen({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          children: [
            TextField(
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: SvgPicture.asset(
                  Assets.imagesSearch,
                  fit: BoxFit.scaleDown,
                ),
                filled: true,
                fillColor: Colors.white,
                // contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            AppSpacer(heightRatio: 1),
            // Expanded(
            //   child: GridView.builder(
            //     physics: BouncingScrollPhysics(),
            //     itemCount: 10,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 0.87,
            //       crossAxisSpacing: 12.sp,
            //       mainAxisSpacing: 12.sp,
            //     ),
            //     itemBuilder: (context, index) => ProductCardItem(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
