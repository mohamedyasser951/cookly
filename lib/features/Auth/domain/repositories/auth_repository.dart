import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String userName,
    required String password,
  });
}
