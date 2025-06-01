import 'package:cookly/core/error/failures.dart';
import 'package:cookly/core/usecases/usecases.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:cookly/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetCachedUserUsecase extends UseCase<User?, NoParams> {
  AuthRepository authRepository;
  GetCachedUserUsecase({required this.authRepository});
  @override
  Future<Either<Failure, User?>> call(NoParams params) async =>
      await authRepository.getCachedUser();
}
