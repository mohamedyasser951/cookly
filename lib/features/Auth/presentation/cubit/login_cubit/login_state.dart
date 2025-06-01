part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoggedIn extends LoginState {
  final User user;
  const LoggedIn({required this.user});
}

final class LogedOut extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
}
