import 'dart:developer';

import 'package:flavor/core/models/recipes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/consts.dart';
import '../../../core/services/new_recipe_service.dart';

part 'new_recipe_state.dart';

class NewRecipeCubit extends Cubit<NewRecipeState> {
  final NewRecipeService _newRecipeService;

  NewRecipeCubit({
    required NewRecipeService newRecipeService,
  })  : _newRecipeService = newRecipeService,
        super(const NewRecipeState.initial());

  Future<void> add() async {
    try {
      await _newRecipeService
          .add(Recipes(ingredients: '', name: '', instructions: '', time: ''));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: ScreenStatus.error));
    }
  }

  void reset() {
    emit(state.copyWith(errorMessage: '', status: ScreenStatus.initial));
  }
}
