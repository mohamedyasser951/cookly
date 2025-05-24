import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';

String loginEndPoint = "/auth/login";

abstract class AuthRemoteDataSource {
  Future<User> login({required String userName, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiBaseHelper apiBaseHelper;
  AuthRemoteDataSourceImpl({required this.apiBaseHelper});
  @override
  Future<User> login({
    required String userName,
    required String password,
  }) async {
    try{
 final response = await apiBaseHelper.post(
      url: loginEndPoint,
      body: {"username": userName, "password": password, "expiresInMins": 60},
    );
    return User.fromJson(response);
    }catch (e){
      rethrow;
    }
   
  }
}
