import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lightsaber_app/constants/app_constants.dart';
import 'package:lightsaber_app/pages/home_page.dart';

/// Entry point of the Lightsaber application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const LightsaberApp());
}

/// Main application widget that sets up the MaterialApp.
class LightsaberApp extends StatelessWidget {
  /// Creates a [LightsaberApp].
  const LightsaberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppConstants.appTitle,
      home: LightsaberHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
