part of 'recipes_cubit.dart';

class RecipesState extends Equatable {
  final RequestStatus allRecipesStatus;
  final RequestStatus pginationStatus;
  final List<Recipe> recipes;
  final String recipesErrorMessage;
  final String paginationErrorMessage;
  final int skip;
  final int last;
  final String? searchText;
  final String? orderBy;
  final bool? sortBy;
  const RecipesState({
    this.allRecipesStatus = RequestStatus.initial,
    this.pginationStatus = RequestStatus.initial,
    this.recipes = const [],
    this.recipesErrorMessage = '',
    this.paginationErrorMessage = '',
    this.skip = 0,
    this.last = 0,
    this.searchText,
    this.orderBy,
    this.sortBy = false,
  });

  RecipesState clear({bool isSearchText = true, bool sortBy = true}) {
    return RecipesState(
      allRecipesStatus: allRecipesStatus,
      pginationStatus: pginationStatus,
      recipes: recipes,
      recipesErrorMessage: recipesErrorMessage,
      paginationErrorMessage: paginationErrorMessage,
      skip: skip,
      last: last,
      searchText: isSearchText ? null : searchText,
      sortBy: sortBy ? null : this.sortBy,
    );
  }

  RecipesState copyWith({
    RequestStatus? allRecipesStatus,
    RequestStatus? pginationStatus,
    List<Recipe>? recipes,
    String? recipesErrorMessage,
    String? paginationErrorMessage,
    int? skip,
    int? last,
    String? searchText,
    String? orderBy,
    bool? sortBy,
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
      searchText: searchText ?? this.searchText,
      orderBy: orderBy ?? this.orderBy,
      sortBy: sortBy ?? this.sortBy,
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
