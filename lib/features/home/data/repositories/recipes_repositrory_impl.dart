import 'package:cookly/core/error/exceptions.dart';
import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/home/data/datasources/recipe_data_source.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/domain/repositories/recipes_repository.dart';
import 'package:dartz/dartz.dart';

class RecipesRepositroryImpl implements RecipesRepository {
  final RecipesDataSource recipesDataSource;
  RecipesRepositroryImpl({required this.recipesDataSource});
  @override
  Future<Either<Failure, RecipeResponse>> getAllRecipes(int skip) async {
    try {
      final response = await recipesDataSource.getAllRecipes(skip);
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }
}
