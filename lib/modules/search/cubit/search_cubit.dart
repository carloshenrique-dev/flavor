import 'dart:developer';

import 'package:flavor/core/models/recipes.dart';
import 'package:flavor/core/services/recipe/new_recipe_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/consts.dart';
import '../../../core/services/recipe/search_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService _searchService;
  final NewRecipeService _newRecipeService;

  SearchCubit({
    required SearchService searchService,
    required NewRecipeService newRecipeService,
  })  : _searchService = searchService,
        _newRecipeService = newRecipeService,
        super(const SearchState.initial());

  Future<void> search(String word) async {
    try {
      emit(state.copyWith(status: ScreenStatus.loading));

      final recipesList = await _searchService.search(word);
      if (recipesList.isNotEmpty) {
        emit(state.copyWith(
          recipes: recipesList,
          status: ScreenStatus.completed,
        ));
      } else {
        await searchOnGemini(word);
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: ScreenStatus.error));
    }
  }

  Future<void> searchOnGemini(String word) async {
    try {
      final recipeResult = await _searchService.searchOnGemini(word);
      if (recipeResult != null) {
        await addNewRecipeFromGemini(recipeResult);
        emit(state.copyWith(
          recipes: [recipeResult],
          status: ScreenStatus.completed,
        ));
      } else {
        emit(state.copyWith(recipes: [], status: ScreenStatus.completed));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: ScreenStatus.error));
    }
  }

  Future<void> addNewRecipeFromGemini(Recipes recipes) async {
    try {
      await _newRecipeService.add(recipes);
    } catch (e) {
      log(e.toString());
    }
  }

  void reset() {
    emit(state.copyWith(errorMessage: '', status: ScreenStatus.initial));
  }
}
