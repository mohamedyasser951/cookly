import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';


String getALLRecipes(int skip) => "?limit=10&skip=$skip";

abstract class RecipesDataSource {
  Future<RecipeResponse> getAllRecipes(int skip);
}

class RecipeDataSourceImpl extends RecipesDataSource {
  ApiBaseHelper apiBaseHelper;
  RecipeDataSourceImpl({required this.apiBaseHelper});
  @override
  Future<RecipeResponse> getAllRecipes(int skip) async {
    try {
      final response = await apiBaseHelper.get(url: getALLRecipes(skip));
      return RecipeResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
