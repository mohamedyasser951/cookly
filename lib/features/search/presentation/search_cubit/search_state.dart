part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<Recipe> recipes;
  const SearchLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

final class SearchError extends SearchState {
  final String message;
  const SearchError({required this.message});

  @override
  List<Object> get props => [message];
}

final class SearchEmpty extends SearchState {
  final String message;
  const SearchEmpty({required this.message});

  @override
  List<Object> get props => [message];
}
