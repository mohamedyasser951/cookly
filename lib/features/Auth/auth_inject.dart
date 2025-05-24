import 'package:cookly/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:cookly/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:cookly/features/Auth/domain/repositories/auth_repository.dart';
import 'package:cookly/features/Auth/domain/usecases/login_usecase.dart';
import 'package:cookly/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:cookly/injection_container.dart';

void initAuth() {
  //Cubits
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(loginUsecase: sl()));

  //Use Case
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(authRepository: sl()),
  );

  // repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  //Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiBaseHelper: sl()),
  );
}
