import 'package:cookly/app.dart';
import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/core/services/bloc_observer.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //Solve Text in release mode
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = BlocObserverService();
  // init service locator
  await ServiceLocator.init();

  runApp(App());
}
