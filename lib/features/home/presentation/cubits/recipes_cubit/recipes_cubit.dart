import 'package:cookly/core/utils/request_status.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/domain/usecases/get_all_recipes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final GetAllRecipes getAllRecipes;
  final ScrollController scrollController = ScrollController();

  RecipesCubit({required this.getAllRecipes}) : super(RecipesState()) {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreRecipesEvents();
    }
  }

  void getAllRecipesEvent() async {
    emit(state.copyWith(allRecipesStatus: RequestStatus.loading, skip: 0));

    final failureOrRecipes = await getAllRecipes(state.skip);

    failureOrRecipes.fold(
      (failure) {
        emit(
          state.copyWith(
            allRecipesStatus: RequestStatus.error,
            recipesErrorMessage: failure.message,
          ),
        );
      },
      (recipes) {
        emit(
          state.copyWith(
            allRecipesStatus: RequestStatus.success,
            skip: recipes.skip,
            last: recipes.total,
            recipes: recipes.recipes,
          ),
        );
      },
    );
  }

  void loadMoreRecipesEvents() async {
    if (state.allRecipesStatus == RequestStatus.loading ||
        state.pginationStatus == RequestStatus.loading) {
      return;
    }
    if (state.skip == state.last) {
      return;
    }
    emit(
      state.copyWith(
        pginationStatus: RequestStatus.loading,
        skip: state.skip + 10,
      ),
    );
    final failureOrRecipes = await getAllRecipes(state.skip);

    failureOrRecipes.fold(
      (failure) {
        emit(
          state.copyWith(
            pginationStatus: RequestStatus.error,
            paginationErrorMessage: failure.message,
            skip: state.skip - 10,
          ),
        );
      },
      (recipes) {
        emit(
          state.copyWith(
            pginationStatus: RequestStatus.success,
            recipes: [...state.recipes, ...recipes.recipes],
            skip: recipes.skip,
            last: recipes.total,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    return super.close();
  }
}
