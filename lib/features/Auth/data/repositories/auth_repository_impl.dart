import 'package:cookly/core/error/exceptions.dart';
import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:cookly/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, User>> login({
    required String userName,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.login(
        userName: userName,
        password: password,
      );
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }
}
