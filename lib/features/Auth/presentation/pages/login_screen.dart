import 'package:cookly/core/widgets/loading.dart';
import 'package:cookly/features/Auth/domain/usecases/login_usecase.dart';
import 'package:cookly/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 64.h),
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 90.h),
                  Text("Email"),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: userNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    onTapOutside: (PointerDownEvent event) {
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty || value == '') {
                          return "*Field Required";
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text("Password"),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: Icon(Icons.password_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onTapOutside: (PointerDownEvent event) {
                      FocusScope.of(context).unfocus();
                    },
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty || value == '') {
                          return "*Field Required";
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.h),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Center(
                        child: Visibility(
                          visible: state is! LoginLoading,
                          replacement: Loading(),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().loginEvent(
                                    LoginParams(
                                      userName: userNameController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                              child: Text("Sign In"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
