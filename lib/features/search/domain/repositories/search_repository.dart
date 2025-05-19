import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, RecipeResponse>> searchRecipes(String query);
}
