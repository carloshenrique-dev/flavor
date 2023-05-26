import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/modules/login/login_page.dart';
import 'package:go_router/go_router.dart';

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
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
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
      return '/home';
    }

    // no need to redirect at all
    return null;
  },
);
