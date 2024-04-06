import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/consts.dart';
import 'package:flavor/core/models/recipes.dart';
import 'package:flavor/modules/favorite/favorite_page.dart';
import 'package:flavor/modules/login/login_page.dart';
import 'package:flavor/modules/new_recipe/new_recipe_page.dart';
import 'package:flavor/modules/not_found/not_found.dart';
import 'package:flavor/modules/recipe_details/recipe_details.dart';
import 'package:flavor/modules/search/search_page.dart';
import 'package:go_router/go_router.dart';

import '../../modules/dashboard/dashboard_page.dart';
import '../../modules/home/home_page.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  restorationScopeId: 'router',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
      name: AppRoutes.login.name,
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
      name: AppRoutes.dashboard.name,
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      name: AppRoutes.home.name,
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
      name: AppRoutes.search.name,
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoritePage(),
      name: AppRoutes.favorite.name,
    ),
    GoRoute(
      path: '/newRecipe',
      builder: (context, state) => const NewRecipePage(),
      name: AppRoutes.newRecipe.name,
    ),
    GoRoute(
      path: '/recipeDetails',
      name: AppRoutes.recipeDetails.name,
      builder: (context, state) {
        final recipe = state.extra is Recipes;
        if (recipe) {
          return RecipeDetails(
            recipe: state.extra as Recipes,
          );
        }
        return const NotFound();
      },
    ),
  ],
  redirect: (context, state) {
    // if the user is not logged in, they need to login
    final bool loggedIn = FirebaseAuth.instance.currentUser != null;
    final bool loggingIn = state.matchedLocation == '/';
    if (!loggedIn) {
      return '/';
    }

    // if the user is logged in but still on the login page, send them to
    // the home page
    if (loggingIn) {
      return '/dashboard';
    }

    // no need to redirect at all
    return null;
  },
);
