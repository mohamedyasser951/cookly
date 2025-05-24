import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/core/utils/navigator.dart';
import 'package:cookly/features/Auth/auth_inject.dart';
import 'package:cookly/features/home/home_inject.dart';
import 'package:cookly/features/search/search_inject.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

abstract class ServiceLocator {
  static Future<void> init() async {
    //Features
    initRecipes();
    initSearch();
    initAuth();
    //Core
    _injectAppNavigator();
    _injectApiBaseHelper();
  }
}

void _injectAppNavigator() {
  sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
}

void _injectApiBaseHelper() {
  sl.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper(dio: sl()));

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: const Duration(milliseconds: 60000),
        connectTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 60000),
      ),
    ),
  );
}

AppNavigator appNavigator = sl<AppNavigator>();
