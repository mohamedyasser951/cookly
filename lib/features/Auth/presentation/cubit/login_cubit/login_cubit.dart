import 'package:cookly/core/widgets/toast.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:cookly/features/Auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUsecase loginUsecase;

  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  late User _user;
  User get user => _user;
  set setUser(User user) => _user = user;

  void loginEvent(LoginParams params) async {
    emit(LoginLoading());
    final failureOrUser = await loginUsecase.call(params);

    failureOrUser.fold(
      (failure) {
        showErorrToast(failure.message);
        emit(LoginError(message: failure.message));
      },
      (user) {
        showSucessToast("login Success");
        _user = user;
        emit(LoginSuceess());
      },
    );
  }
}
