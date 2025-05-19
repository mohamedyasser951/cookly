import 'package:cookly/features/search/data/datasources/search_remote_data_source.dart';
import 'package:cookly/features/search/data/repositories/search_repository_impl.dart';
import 'package:cookly/features/search/domain/repositories/search_repository.dart';
import 'package:cookly/features/search/domain/usecases/search_usecase.dart';
import 'package:cookly/features/search/presentation/search_cubit/search_cubit.dart';
import 'package:cookly/injection_container.dart';

void initSearch() {
  //Cubits
  sl.registerFactory<SearchCubit>(() => SearchCubit(searchUsecase: sl()));

  //Use Cases
  sl.registerLazySingleton<SearchUsecase>(
    () => SearchUsecase(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(searchRemoteDataSource: sl()),
  );
  // Data Sources
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(apiBaseHelper: sl()),
  );
}
