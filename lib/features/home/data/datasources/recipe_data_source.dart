import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/domain/repositories/recipes_repository.dart';

//https://dummyjson.com/recipes?limit=10&skip=0&sortBy=name&order=asc

// String getALLRecipes({required int skip, String? sortedBy, String? order}) =>
//     'https://dummyjson.com/recipes?limit=10&skip=$skip&sortBy=${sortedBy ?? 'name'}&order=${order ?? 'asc'}';

String allRecipesUrl = '/recipes/';

abstract class RecipesDataSource {
  Future<RecipeResponse> getAllRecipes(AlllRecipesParams params);
}

class RecipeDataSourceImpl extends RecipesDataSource {
  ApiBaseHelper apiBaseHelper;
  RecipeDataSourceImpl({required this.apiBaseHelper});
  @override
  Future<RecipeResponse> getAllRecipes(AlllRecipesParams params) async {
    try {
      final response = await apiBaseHelper.get(
        url: allRecipesUrl,
        queryParameters: params.toMap(),
      );
      return RecipeResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
