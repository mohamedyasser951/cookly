import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';

String loginEndPoint = "/auth/login";
String currentUserEndPoint = "/auth/me";
String refreshTokenEndPoint = "/auth/refresh";

abstract class AuthRemoteDataSource {
  Future<User> login({required String userName, required String password});
  Future<User> getCurrentUser();
  Future<User> refreshToken();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiBaseHelper apiBaseHelper;
  final AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSourceImpl({
    required this.apiBaseHelper,
    required this.authLocalDataSource,
  });
  @override
  Future<User> login({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await apiBaseHelper.post(
        url: loginEndPoint,
        body: {"username": userName, "password": password, "expiresInMins": 60},
      );
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getCurrentUser() async {
    final user = await authLocalDataSource.getCachedUser();
    try {
      final response = await apiBaseHelper.get(
        url: currentUserEndPoint,
        token: user!.accessToken,
      );
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> refreshToken() async {
    final user = await authLocalDataSource.getCachedUser();
    try {
      final response = await apiBaseHelper.get(
        url: refreshTokenEndPoint,
        token: user!.accessToken,
      );
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
