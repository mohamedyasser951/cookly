import 'package:cookly/core/error/exceptions.dart';
import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:cookly/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:cookly/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

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
      await authLocalDataSource.cacheUser(user);
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUser();
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, User>> refreshToken() async {
    try {
      final user = await authRemoteDataSource.refreshToken();
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await authLocalDataSource.removeCachedUser();
      return Right(unit);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, User?>> getCachedUser() async {
    try {
     final user = await authLocalDataSource.getCachedUser();
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }
}
