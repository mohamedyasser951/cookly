// ignore_for_file: constant_identifier_names

import 'package:cookly/core/services/cache_service.dart';
import 'package:cookly/features/Auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(User user);
  Future<User?> getCachedUser();
  Future<void> removeCachedUser();
}

const String USER_CACHE_KEY = 'USER_CACHE_KEY';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final CacheService cacheService;

  AuthLocalDataSourceImpl({required this.cacheService});
  @override
  Future<void> cacheUser(User user) {
    return cacheService.setString(USER_CACHE_KEY, user.toJson());
  }

  @override
  Future<User?> getCachedUser() async {
    final userJson = await cacheService.getString(USER_CACHE_KEY);
    if (userJson == null) {
      return null;
    }
    return User.fromJson(userJson);
  }

  @override
  Future<void> removeCachedUser() {
    return cacheService.remove(USER_CACHE_KEY);
  }
}
