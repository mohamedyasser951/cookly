import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/search/domain/usecases/search_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchUsecase searchUsecase;
  SearchCubit({required this.searchUsecase}) : super(SearchInitial());

  Future<void> searchRecipes(String text) async {
    emit(SearchLoading());
    final failureOrRecipes = await searchUsecase(text);
    failureOrRecipes.fold(
      (failure) {
        emit(SearchError(message: failure.message));
      },
      (recipes) {
        if (recipes.recipes.isEmpty) {
          emit(SearchEmpty(message: 'No recipes found'));
          return;
        }
        emit(SearchLoaded(recipes: recipes.recipes));
      },
    );
  }
}
