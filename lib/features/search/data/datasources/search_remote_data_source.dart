import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';

String searchRecipesApi(String query) => '/search?q=$query';

abstract class SearchRemoteDataSource {
  Future<RecipeResponse> searchRecipes(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  ApiBaseHelper apiBaseHelper;

  SearchRemoteDataSourceImpl({required this.apiBaseHelper});
  @override
  Future<RecipeResponse> searchRecipes(String query) async {
    try {
      final response = await apiBaseHelper.get(url: searchRecipesApi(query));
      return RecipeResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
