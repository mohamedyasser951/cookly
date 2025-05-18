part of 'recipes_cubit.dart';

class RecipesState extends Equatable {
  final RequestStatus allRecipesStatus;
  final RequestStatus pginationStatus;
  final List<Recipe> recipes;
  final String recipesErrorMessage;
  final String paginationErrorMessage;
  final int skip;
  final int last;

  const RecipesState({
    this.allRecipesStatus = RequestStatus.initial,
    this.pginationStatus = RequestStatus.initial,
    this.recipes = const [],
    this.recipesErrorMessage = '',
    this.paginationErrorMessage = '',
    this.skip = 0,
    this.last = 0,
  });

  RecipesState copyWith({
    RequestStatus? allRecipesStatus,
    RequestStatus? pginationStatus,
    List<Recipe>? recipes,
    String? recipesErrorMessage,
    String? paginationErrorMessage,
    int? skip,
    int? last,
  }) {
    return RecipesState(
      allRecipesStatus: allRecipesStatus ?? this.allRecipesStatus,
      pginationStatus: pginationStatus ?? this.pginationStatus,
      recipes: recipes ?? this.recipes,
      recipesErrorMessage: recipesErrorMessage ?? this.recipesErrorMessage,
      paginationErrorMessage:
          paginationErrorMessage ?? this.paginationErrorMessage,
      skip: skip ?? this.skip,
      last: last ?? this.last,
    );
  }

  @override
  List<Object> get props => [
    allRecipesStatus,
    pginationStatus,
    List<Recipe>.from(recipes),
    skip,
    last,
    recipesErrorMessage,
    paginationErrorMessage,
  ];
}
