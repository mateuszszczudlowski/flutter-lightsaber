import 'package:flutter/material.dart';

import 'package:neon_lightsaber_app/constants/app_constants.dart';

/// Widget that displays the Star Wars "Hello there" image.
class StarWarsLogo extends StatelessWidget {
  /// Creates a [StarWarsLogo] widget.
  const StarWarsLogo({required this.glowAnimation, super.key});

  /// Animation for the glow effect (kept for compatibility but not used).
  final Animation<double> glowAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        AppConstants.starWarsLogoImage,
        height: 120,
        fit: BoxFit.contain,
      ),
    );
  }
}
