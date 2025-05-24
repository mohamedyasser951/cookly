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
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: userNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.emailAddress,
                
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person_2_outlined),
                        label: Text("User Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.r),
                        ),
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty || value == '') {
                            return "*Field Required";
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock_outline),
                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.r),
                        ),
                      ),
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
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state is! LoginLoading,
                          replacement: Loading(),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                              ),
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
                              child: Text("Login"),
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
      ),
    );
  }
}
