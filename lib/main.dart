import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/design_system/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/services/routes_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //const geminyKey = "AIzaSyA_aQih10F6f6LEqm_PkiJf_WkJwQ2szYk";

  //final apiKey = Platform.environment['API_KEY'];
  /*if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }*/

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppImages.precacheImages(context);

    return MaterialApp.router(
      title: 'Flavor',
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            surfaceTintColor: Colors.transparent,
          ),
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
    );
  }
}
