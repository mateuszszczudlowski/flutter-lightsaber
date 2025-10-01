import 'dart:math';

import 'package:flutter/material.dart';

/// Utility class for generating random colors for lightsaber effects.
class ColorGenerator {
  static final Random _random = Random();

  /// Private constructor to prevent instantiation.
  ColorGenerator._();

  /// Generates a random RGB color for the lightsaber.
  ///
  /// Returns a [Color] with full opacity and random red, green, and blue
  static Color generateLightsaberColor() {
    return Color.fromARGB(
      255, // Full opacity
      _random.nextInt(256), // Red: 0-255
      _random.nextInt(256), // Green: 0-255
      _random.nextInt(256), // Blue: 0-255
    );
  }
}
