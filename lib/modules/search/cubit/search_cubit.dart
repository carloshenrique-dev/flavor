import 'dart:developer';

import 'package:flavor/core/models/recipes.dart';
import 'package:flavor/core/services/search_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/consts.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService _searchService;

  SearchCubit({
    required SearchService searchService,
  })  : _searchService = searchService,
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
        emit(state.copyWith(recipes: [], status: ScreenStatus.completed));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: ScreenStatus.error));
    }
  }

  void reset() {
    emit(state.copyWith(errorMessage: '', status: ScreenStatus.initial));
  }
}
