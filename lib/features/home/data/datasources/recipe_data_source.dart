import 'package:cookly/core/utils/api_basehelper.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/domain/repositories/recipes_repository.dart';


String getALLRecipes({required int skip, String? sortedBy, String? order}) =>
    "?limit=10&skip=$skip"
    '${sortedBy != null ? '&sortBy=$sortedBy' : ''}'
    '${order != null ? '&order=$order' : ''}';

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
        url: getALLRecipes(
          skip: params.skip,
          sortedBy: params.sortedBy,
          order: params.order,
        ),
      );
      return RecipeResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
