import 'package:flutter/material.dart';

/// Application-wide constants and configurations.
class AppConstants {
  /// Private constructor to prevent instantiation.
  AppConstants._();

  // Animation durations
  /// Duration for the neon glow animation effect.
  static const Duration glowAnimationDuration = Duration(seconds: 2);
  
  /// Duration for the lightsaber blade extension/retraction animation.
  static const Duration bladeAnimationDuration = Duration(milliseconds: 800);
  
  /// Duration to reset shake detection state.
  static const Duration shakeResetDuration = Duration(milliseconds: 500);
  
  /// Cooldown duration to prevent rapid toggling.
  static const Duration cooldownDuration = Duration(milliseconds: 300);

  // Colors
  /// Default cyan color for the lightsaber neon effect.
  static const Color defaultNeonColor = Color(0xFF00FFFF);
  
  /// Star Wars signature yellow color for text.
  static const Color starWarsYellow = Color(0xFFFFE81F);
  
  /// Background color for the app.
  static const Color backgroundColor = Colors.black;

  // Dimensions
  /// Height of the lightsaber blade in logical pixels.
  static const double bladeHeight = 340.0;
  
  /// Base width of the lightsaber blade in logical pixels.
  static const double bladeWidth = 16.0;
  
  /// Width of the lightsaber hilt in logical pixels.
  static const double hiltWidth = 50.0;
  
  /// Height of the lightsaber hilt in logical pixels.
  static const double hiltHeight = 150.0;
  
  // Physics
  /// Accelerometer threshold for shake detection.
  static const double shakeThreshold = 20.0;
  
  /// Cooldown period in milliseconds between shake detections.
  static const int shakeDetectionCooldownMs = 500;

  // Assets
  /// Star Wars logo image asset.
  static const String starWarsLogoImage = 'assets/Star_Wars_hello.png';
  
  /// Audio file for lightsaber ignition/retraction sound.
  static const String lightsaberIgnitionSound = 'lightsaber-ignition-6816.mp3';
  
  /// Audio file for lightsaber swing sound effect.
  static const String lightsaberSwingSound = 'swing3-94210.mp3';

  // Text content
  /// Application title displayed in the app bar.
  static const String appTitle = 'Neon Lightsaber';
  
  /// Instructional text explaining how to use the lightsaber.
  static const String instructionalText =
      'Tap the lightsaber hilt to change kyber\ncrystal and ignite/retract the blade!';
}
