import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/repositories/login_repository.dart';
import 'package:flavor/core/repositories/search_repository.dart';
import 'package:flavor/modules/new_recipe/cubit/new_recipe_cubit.dart';
import 'package:flavor/modules/search/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../modules/login/cubit/login_cubit.dart';
import '../repositories/login_repository_impl.dart';
import '../repositories/new_recipe_repository.dart';
import '../repositories/new_recipe_repository_impl.dart';
import '../repositories/search_repository_impl.dart';
import 'login/login_service.dart';
import 'login/login_service_impl.dart';
import 'recipe/new_recipe_service.dart';
import 'recipe/new_recipe_service_impl.dart';
import 'recipe/search_service.dart';
import 'recipe/search_service_impl.dart';

final di = GetIt.instance;

Future<void> initServiceLocator() async {
  di.registerFactory<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  di.registerFactory<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  di.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      firestore: di<FirebaseFirestore>(),
    ),
  );

  di.registerFactory<LoginService>(
    () => LoginServiceImpl(
      loginRepository: di<LoginRepository>(),
    ),
  );

  di.registerFactory<LoginCubit>(
    () => LoginCubit(
      loginService: di<LoginService>(),
      firebaseAuthInstance: di<FirebaseAuth>(),
    ),
  );

  di.registerFactory<SearchRepository>(
    () => SearchRepositoryImpl(
      firestore: di<FirebaseFirestore>(),
    ),
  );

  di.registerFactory<SearchService>(
    () => SearchServiceImpl(
      searchRepository: di<SearchRepository>(),
    ),
  );

  di.registerFactory<SearchCubit>(
    () => SearchCubit(
      searchService: di<SearchService>(),
    ),
  );

  di.registerFactory<NewRecipeRepository>(
    () => NewRecipeRepositoryImpl(
      firestore: di<FirebaseFirestore>(),
      firebaseAuth: di<FirebaseAuth>(),
    ),
  );

  di.registerFactory<NewRecipeService>(
    () => NewRecipeServiceImpl(
      newRecipeRepository: di<NewRecipeRepository>(),
    ),
  );

  di.registerFactory<NewRecipeCubit>(
    () => NewRecipeCubit(
      newRecipeService: di<NewRecipeService>(),
    ),
  );
}
