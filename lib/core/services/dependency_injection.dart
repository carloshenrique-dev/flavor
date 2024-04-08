import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/repositories/login_repository.dart';
import 'package:flavor/core/repositories/search_recipe_images_repository.dart';
import 'package:flavor/core/repositories/search_recipe_images_repository_impl.dart';
import 'package:flavor/core/repositories/search_repository.dart';
import 'package:flavor/core/services/recipe_images/search_recipe_images_service.dart';
import 'package:flavor/modules/new_recipe/cubit/new_recipe_cubit.dart';
import 'package:flavor/modules/search/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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
import 'recipe_images/search_recipe_images_service_impl.dart';
import 'remote_config_service.dart';

final di = GetIt.instance;

Future<void> initServiceLocator() async {
  di.registerFactory<GenerativeModel>(() => GenerativeModel(
      model: 'gemini-pro', apiKey: "AIzaSyA_aQih10F6f6LEqm_PkiJf_WkJwQ2szYk"));

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
      generativeModel: di<GenerativeModel>(),
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
      newRecipeService: di<NewRecipeService>(),
    ),
  );

  di.registerFactory<NewRecipeRepository>(
    () => NewRecipeRepositoryImpl(
      firestore: di<FirebaseFirestore>(),
    ),
  );

  di.registerFactory<NewRecipeService>(
    () => NewRecipeServiceImpl(
      newRecipeRepository: di<NewRecipeRepository>(),
    ),
  );

  di.registerFactory<SearchRecipeImagesRepository>(
    () => SearchRecipeImagesRepositoryImpl(),
  );

  di.registerFactory<SearchRecipeImagesService>(
    () => SearchRecipeImagesServiceImpl(
      searchRecipeImagesRepository: di<SearchRecipeImagesRepository>(),
    ),
  );

  di.registerFactory<NewRecipeCubit>(
    () => NewRecipeCubit(
      newRecipeService: di<NewRecipeService>(),
    ),
  );

  di.registerFactory<FirebaseRemoteConfigService>(
    () => FirebaseRemoteConfigService(),
  );
}
