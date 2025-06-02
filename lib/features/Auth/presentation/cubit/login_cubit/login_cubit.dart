import 'package:cookly/core/usecases/usecases.dart';
import 'package:cookly/core/widgets/toast.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:cookly/features/Auth/domain/usecases/get_cached_user_usecase.dart';
import 'package:cookly/features/Auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUsecase loginUsecase;
  GetCachedUserUsecase getCachedUserUsecase;
  LoginCubit({required this.loginUsecase, required this.getCachedUserUsecase})
    : super(LoginInitial());

  late User _user;
  User get user => _user;
  set setUser(User user) => _user = user;

  void init() async {
    final user = await getCachedUserUsecase.call(NoParams());
    user.fold(
      (failure) => emit(LogedOut()),
      (user) {
        _user = user!;
        emit(LoggedIn(user: user));
      },
    );
  }

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
        emit(LoggedIn(user: user));
      },
    );
  }
}
