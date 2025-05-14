import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/features/home/presentation/pages/home_layout.dart';
import 'package:flutter/material.dart';

class CooklyApp extends StatelessWidget {
  const CooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookly',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      home: HomeLayout()
    );
  }
}
