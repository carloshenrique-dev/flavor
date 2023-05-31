part of 'search_cubit.dart';

class SearchState extends Equatable {
  final ScreenStatus status;
  final String errorMessage;
  final List<Recipes> recipes;

  const SearchState._({
    required this.errorMessage,
    required this.status,
    this.recipes = const [],
  });

  const SearchState.initial()
      : this._(
          status: ScreenStatus.initial,
          errorMessage: '',
        );

  @override
  List<Object?> get props => [status, errorMessage, recipes];

  SearchState copyWith({
    ScreenStatus? status,
    String? errorMessage,
    List<Recipes>? recipes,
  }) {
    return SearchState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      recipes: recipes ?? this.recipes,
    );
  }
}
