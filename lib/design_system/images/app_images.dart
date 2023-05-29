// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class AppImages {
  static Future precacheImages(BuildContext context) async {
    await precacheImage(googleIcon, context);
    await precacheImage(appleIcon, context);
    await precacheImage(logoIcon, context);
  }

  static const ImageProvider googleIcon =
      AssetImage('assets/images/google.png');

  static const ImageProvider appleIcon = AssetImage('assets/images/apple.png');

  static const ImageProvider logoIcon = AssetImage('assets/images/logo.png');
}
