import 'package:cookly/core/error/failures.dart';
import 'package:cookly/core/usecases/usecases.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchUsecase extends UseCase<RecipeResponse, String> {
  final SearchRepository repository;
  SearchUsecase({required this.repository});

  @override
  Future<Either<Failure, RecipeResponse>> call(String params) async =>
      await repository.searchRecipes(params);
}
