part of 'new_recipe_cubit.dart';

class NewRecipeState extends Equatable {
  final ScreenStatus status;
  final String errorMessage;
  final List<Recipes> recipes;

  const NewRecipeState._({
    required this.errorMessage,
    required this.status,
    this.recipes = const [],
  });

  const NewRecipeState.initial()
      : this._(
          status: ScreenStatus.initial,
          errorMessage: '',
        );

  @override
  List<Object?> get props => [status, errorMessage, recipes];

  NewRecipeState copyWith({
    ScreenStatus? status,
    String? errorMessage,
    List<Recipes>? recipes,
  }) {
    return NewRecipeState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      recipes: recipes ?? this.recipes,
    );
  }
}
