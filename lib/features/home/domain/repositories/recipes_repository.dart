import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:dartz/dartz.dart';

abstract class RecipesRepository {
  Future<Either<Failure, RecipeResponse>> getAllRecipes(
    AlllRecipesParams params,
  );
}

class AlllRecipesParams {
  final int skip;
  final int limit;
  final String? sortedBy;
  final String? order;

  AlllRecipesParams({
    required this.skip,
    this.sortedBy,
    this.order,
    this.limit = 10,
  });

  Map<String, dynamic> toMap() {
    return {'skip': skip, 'limit': limit, 'sortBy': sortedBy, 'order': order};
  }
}
