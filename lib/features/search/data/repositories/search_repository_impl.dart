import 'package:cookly/core/error/exceptions.dart';
import 'package:cookly/core/error/failures.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/search/data/datasources/search_remote_data_source.dart';
import 'package:cookly/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, RecipeResponse>> searchRecipes(String query) async {
    try {
      return Right(await searchRemoteDataSource.searchRecipes(query));
    } on ServerException catch (error) {
      return Left(ServerFailure.formServerException(error));
    }
  }
}
