import 'package:cookly/core/error/failures.dart';
import 'package:cookly/core/usecases/usecases.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/domain/repositories/recipes_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllRecipes extends UseCase<RecipeResponse, int> {
  final RecipesRepository repository;

  GetAllRecipes({required this.repository});

  @override
  Future<Either<Failure, RecipeResponse>> call(int params) async =>
      await repository.getAllRecipes(params);
}
