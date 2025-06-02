import 'package:cookly/core/constants/size_config.dart';
import 'package:cookly/core/constants/styles/app_theme.dart';
import 'package:cookly/core/utils/navigator.dart';
import 'package:cookly/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:cookly/cookly_app.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 971),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        SizeConfig().init(context);
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => sl<LoginCubit>()..init())],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cookly',
            theme: AppTheme.mainThemeData,
            navigatorKey: sl<AppNavigator>().navigatorKey,
            home: CooklyApp(),
          ),
        );
      },
    );
  }
}
