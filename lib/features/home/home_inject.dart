import 'package:cookly/features/home/data/datasources/recipe_data_source.dart';
import 'package:cookly/features/home/data/repositories/recipes_repositrory_impl.dart';
import 'package:cookly/features/home/domain/repositories/recipes_repository.dart';
import 'package:cookly/features/home/domain/usecases/get_all_recipes.dart';
import 'package:cookly/features/home/presentation/cubit/recipes_cubit.dart';
import 'package:cookly/injection_container.dart';

void initRecipes() {
  //Cubits
  sl.registerFactory<RecipesCubit>(() => RecipesCubit(getAllRecipes: sl()));

  //Use Cases
  sl.registerLazySingleton<GetAllRecipes>(
    () => GetAllRecipes(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<RecipesRepository>(
    () => RecipesRepositroryImpl(recipesDataSource: sl()),
  );
  //Data Sources
  sl.registerLazySingleton<RecipesDataSource>(
    () => RecipeDataSourceImpl(apiBaseHelper: sl()),
  );
}
