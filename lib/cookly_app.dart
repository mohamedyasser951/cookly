import 'package:cookly/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:cookly/features/Auth/presentation/pages/welcome_screen.dart';
import 'package:cookly/features/home/presentation/pages/home_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CooklyApp extends StatelessWidget {
  const CooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoggedIn) {
          return HomeLayoutScreen();
        } else {
          return WelcomeScreen();
        }
      },
    );
  }
}
