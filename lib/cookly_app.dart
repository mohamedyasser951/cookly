import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/core/constants/size_config.dart';
import 'package:cookly/core/utils/navigator.dart';
import 'package:cookly/features/home/presentation/pages/home_layout_screen.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CooklyApp extends StatelessWidget {
  const CooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 971),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        SizeConfig().init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cookly',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
            ),
          ),
          navigatorKey: sl<AppNavigator>().navigatorKey,
          home:  HomeLayoutScreen(),
        );
      },
    );
  }
}
