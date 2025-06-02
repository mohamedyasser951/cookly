import 'package:cookly/core/constants/assets.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:cookly/features/Auth/presentation/pages/login_screen.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.imagesWelcome,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpacer(heightRatio: 8),
              Image.asset(Assets.imagesCheif, width: 80.w, height: 80.h),
              Spacer(),
              Text(
                'Get\nCooking',
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacer(heightRatio: 1.5),
              Text(
                'Simple way to find Tasty Recipe',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacer(heightRatio: 1.5),
              SizedBox(
                width: 240.w,
                child: ElevatedButton(
                  onPressed: () {
                    appNavigator.pushReplacement(screen: LoginScreen());
                  },
                  child: Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Start Cooking'),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
              AppSpacer(heightRatio: 3),
            ],
          ),
        ],
      ),
    );
  }
}
