import 'package:cookly/core/error/failures.dart';
import 'package:cookly/core/usecases/usecases.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:cookly/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends UseCase<User, LoginParams> {
  AuthRepository authRepository;
  LoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(LoginParams params) async =>
      await authRepository.login(
        userName: params.userName,
        password: params.password,
      );
}

class LoginParams {
  final String userName;
  final String password;
  LoginParams({required this.userName, required this.password});
}
